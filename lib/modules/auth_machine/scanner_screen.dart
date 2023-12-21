import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../bases/screens/exports.dart';
import '../../widgets/back_button.dart';
import '../../widgets/bottom_bars/gradient_bar.dart';
import '../core/machine_setup/controllers/scanning_template_controller.dart';

class ScannerScreen extends GetView<ScanningTemplateController> {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: Column(
        children: [
          Row(
            children: [
              const BackButton(
                fromScanning: true,
              ),
              const Gap(28),
              Text(
                "Scanning",
                style: AppStyles.urbanistboldHeadline3.withSize(FontSizes.headline4).withColor(Colors.white),
              ).center().align(alignment: Alignment.topLeft),
            ],
          ).paddingOnly(left: AppConstants.bodyMinSymetricHorizontalPadding, top: AppConstants.minBodyTopPadding),
          const Gap(AppConstants.minBodyTopPadding),
          ClipRRect(
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
                  ))),
        ],
      ),
      floatingActionButton:
          const GradientBar().paddingSymmetric(vertical: 40, horizontal: AppConstants.bodyMinSymetricHorizontalPadding),
    );
  }
}
