import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:spiraw/bases/screens/exports.dart';

import 'controllers/scanner_controller.dart';

class ScannerScreen extends GetView<ScannerController> {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      displayAppBar: false,
      body: Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
              child: SizedBox(
                  height: AppConstants.scannerHeight,
                  width: AppConstants.scannerWidth,
                  child: QRView(
                    key: controller.qrKey,
                    onQRViewCreated: controller.onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      cutOutSize: 300,
                      borderLength: 2,
                      borderWidth: 3,
                    ),
                  )))),
    );
  }
}
