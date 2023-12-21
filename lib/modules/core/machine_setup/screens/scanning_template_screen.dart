import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../bases/screens/exports.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/bottom_bars/gradient_bar.dart';
import '../controllers/scanning_template_controller.dart';

class ScanningTemplateScreen extends GetView<ScanningTemplateController> {
  const ScanningTemplateScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: ScrollableForm(
        children: [
          Row(
            children: [
              const BackButton(
                fromScanning: true,
              ),
              const Gap(28),
              Text(
                title,
                style: AppStyles.urbanistboldHeadline3.withSize(FontSizes.headline4).withColor(Colors.white),
              ).center().align(alignment: Alignment.topLeft),
            ],
          ),
          const Gap(AppConstants.minBodyTopPadding),
          ClipRRect(
              //! TODO
              //Scan the qr code of the selected image
              borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
              child: Observer(
                observes: controller.selectedImagePath,
                builder: (context, selectedImagePath) => SizedBox(
                    height: AppConstants.scannerHeight,
                    width: AppConstants.scannerWidth,
                    child: Stack(alignment: Alignment.center, children: [
                      selectedImagePath.value != ""
                          ? DottedBorder(
                              padding: const EdgeInsets.all(7),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(AppConstants.inputs.radius),
                              color: AppColors.secondary,
                              strokeWidth: 1.5,
                              dashPattern: const [135, 145],
                              child: Image.file(
                                File(selectedImagePath.value ?? ""),
                                width: 300,
                                height: 300,
                                fit: BoxFit.contain,
                              ),
                            )
                          : QRView(
                              key: controller.qrKey,
                              onQRViewCreated: controller.onQRViewCreated,
                              overlay: QrScannerOverlayShape(
                                cutOutSize: 300,
                                borderLength: 2,
                                borderWidth: 3,
                              ),
                            ),
                    ])),
              )),
        ],
      ).paddingOnly(top: AppConstants.minBodyTopPadding),
      floatingActionButton:
          const GradientBar().paddingSymmetric(vertical: 40, horizontal: AppConstants.bodyMinSymetricHorizontalPadding),
    );
  }
}
