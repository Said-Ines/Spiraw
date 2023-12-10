import 'dart:io';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:spiraw/modules/auth_machine/data/scanned_qr_model.dart';

import '../../../bases/controllers/exports.dart';

class ScannerController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  Barcode? result;

  final performingApiCall = Observable(false);

  final RxList<ScannedQrCodeModel> scannedQrCodeModelList = <ScannedQrCodeModel>[].obs;

  StreamSubscription<Barcode>? streamSubscription;
  Rx<bool> gotResult = false.obs;

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

  void _cancelAndResume() {
    streamSubscription?.resume();

    qrController?.resumeCamera();
    result = null;
    gotResult.value = false;
    Get.back(closeOverlays: true);
  }

//! TODO:
  void toSetupMachine() {
    // Get.toNamed();
  }

  @override
  void onClose() {
    qrController?.dispose();
    streamSubscription?.cancel();
    super.onClose();
  }
}
