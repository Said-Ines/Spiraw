import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../bases/screens/exports.dart';
import '../core/machine_setup/controllers/scanning_template_controller.dart';

class ScannerScreen extends GetView<ScanningTemplateController> {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
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
