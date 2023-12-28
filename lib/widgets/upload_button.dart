import 'package:dotted_border/dotted_border.dart';

import '../../../bases/screens/exports.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
    this.openCamera,
    this.openGallery,
  });

  final void Function()? openCamera;
  final void Function()? openGallery;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(AppConstants.inputs.radius),
      color: AppColors.secondary,
      strokeWidth: 1.5,
      dashPattern: const [12, 12],
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: AppColors.scaffold,
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
              builder: (context) => SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Add profile picture",
                          style: AppStyles.interSemiBoldTextButton.withColor(Colors.white).withSize(FontSizes.headline5),
                        ).align(alignment: Alignment.topLeft),
                        const Gap(26),
                        InkWell(
                          onTap: () {
                            openCamera;
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.cameraIcon,
                                width: 24,
                                height: 24,
                              ),
                              const Gap(10),
                              Text(
                                "Take a photo",
                                style:
                                    AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white).withSize(FontSizes.title),
                              ),
                            ],
                          ),
                        ),
                        const Gap(24),
                        InkWell(
                          onTap: openGallery,
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.gallery,
                                height: 24,
                                width: 24,
                              ),
                              const Gap(10),
                              Text(
                                "Upload from phone",
                                style:
                                    AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white).withSize(FontSizes.title),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: AppConstants.bodyMinSymetricHorizontalPadding, vertical: 60));
        },
        child: Container(
            height: 104,
            width: 345,
            decoration:
                BoxDecoration(color: AppColors.inputColor, borderRadius: BorderRadius.circular(AppConstants.inputs.radius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                ),
                const HorizontalSpacing(8),
                Text(
                  "Upload post content",
                  style: AppStyles.interregularTitle.withColor(AppColors.greyBackground).withSize(FontSizes.title).medium(),
                ),
              ],
            )),
      ),
    );
  }
}
