import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';

import '../../../../bases/controllers/exports.dart';
import '../../../auth_machine/data/scanned_qr_model.dart';

class ScanningTemplateController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  Barcode? result;

  final performingApiCall = Observable(false);

  final RxList<ScannedQrCodeModel> scannedQrCodeModelList = <ScannedQrCodeModel>[].obs;

  StreamSubscription<Barcode>? streamSubscription;
  Rx<bool> gotResult = false.obs;

  final selectedImagePath = Observable<Rx<String?>>("".obs);

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

      _cancelAndResume();
    });
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
    log(result ?? "");
  }

  Future<void> pickImageFromGallery() async {
    //! TODO
    // open gallery permission

    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path.obs;

      scanningUploadedImage(selectedImagePath.value.string);
      log(selectedImagePath.value.string);

      log('Image sélectionnée depuis la galerie: ${pickedFile.path}');
    }
  }

  void _cancelAndResume() {
    streamSubscription?.resume();

    qrController?.resumeCamera();
    result = null;
    gotResult.value = false;
    Get.back(closeOverlays: true);
  }

  @override
  void onClose() {
    qrController?.dispose();
    streamSubscription?.cancel();
    super.onClose();
  }
}
