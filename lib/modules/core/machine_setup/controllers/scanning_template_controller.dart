import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';
import 'package:uuid/uuid.dart';

import '../../../../bases/controllers/exports.dart';
import '../../../../utils/utils.dart';
import '../../../auth_machine/data/machine_model.dart';
import '../../../auth_machine/data/scanned_qr_model.dart';
import '../../../auth_machine/services/machine_service.dart';

class ScanningTemplateController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  Barcode? result;

  final performingApiCall = Observable(false);

  final RxList<ScannedQrCodeModel> scannedQrCodeModelList = <ScannedQrCodeModel>[].obs;

  StreamSubscription<Barcode>? streamSubscription;
  Rx<bool> gotResult = false.obs;

  final selectedImagePath = Observable<Rx<String?>>("".obs);

  VoidCallback navigateToScreen = () {};

  @override
  void onInit() {
    reassemble();
    super.onInit();
  }

  @override
  void onReady() {
    reassemble();
    super.onReady();
  }

  void toAddWaterScreen() {
    Get.toNamed(addWaterModule.name);
  }

  void toScanningStarter() {
    Get.toNamed(scanningStarterModule.name);
  }

  void toStarterAddedScreen() {
    Get.toNamed(starterAddedModule.name);
  }

  void toDisinfectionScreen() {
    Get.toNamed(disinfinctionModule.name);
  }

  void toDisinfectionSuccessScreen() {
    Get.toNamed(disinfinctionSuccessModule.name);
  }

  void toWellDoneScreen() {
    Get.toNamed(wellDoneModule.name);
  }

  void toHomePage() {
    Get.offAllNamed(recipePageModule.name);
  }

  void reassemble() {
    if (Platform.isAndroid) {
      qrController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrController?.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    streamSubscription = controller.scannedDataStream.listen((scanData) {
      result = scanData;
      gotResult.value = true;

      controller.pauseCamera();

      if (result != null) {
        String? scannedLink = result!.code;

        Utils.showSnackBar(
          "QR Code Scanned Successfully",
          scannedLink ?? "Error while scanning the code",
        );
        String machineUid = generateUniqueMachineId();
        String userId = getCurrentUserId();

        MachineModel machine = MachineModel(
          uid: machineUid,
          qrCode: ScannedQrCodeModel(
            qrContent: scannedLink,
            scannedAt: DateTime.now().millisecond,
          ),
          userId: userId,
        );

        saveMachineToDatabase(machine);

        navigateToScreen();
      }

      _cancelAndResume();
    });
  }

  Future<void> saveMachineToDatabase(MachineModel machine) async {
    try {
      await MachineService().saveMachinetoDatabase(machine);
      Debugger.green("Machine added successfully !");
    } catch (e) {
      Debugger.red("Error while saving machine: $e");
    }
  }

  String generateUniqueMachineId() {
    return const Uuid().v4();
  }

  String getCurrentUserId() {
    return FirebaseAuth.instance.currentUser?.uid ?? "";
  }

  void toggleFlash() {
    if (qrController != null) {
      qrController!.toggleFlash();
    }
  }

  void flipCamera() async {
    try {
      CameraFacing newFacing = await qrController!.flipCamera();
      log('Switched to camera: $newFacing');
    } catch (e) {
      log('Error switching camera: $e');
    }
  }

  //? scanning QR code from uploaded image
  void scanningUploadedImage(String? selectedImagePath) async {
    String? result = await Scan.parse(selectedImagePath ?? "");
    if (result != null) {
      Utils.showSnackBar(
        "QR Code Scanned Successfully",
        result,
      );

      navigateToScreen();
    } else {
      Utils.showSnackBar(
        "Error",
        "Error while scanning the code",
      );
    }
    Debugger.magenta('qr code link: $result');
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path.obs;

      scanningUploadedImage(selectedImagePath.value.string);
      log(selectedImagePath.value.string);

      log('Image from gallery : ${pickedFile.path}');
    }
  }

  void _cancelAndResume() {
    streamSubscription?.resume();

    qrController?.resumeCamera();
    result = null;
    gotResult.value = false;
    //Get.back(closeOverlays: true);
  }

  @override
  void onClose() {
    qrController?.dispose();
    streamSubscription?.cancel();
    super.onClose();
  }
}
