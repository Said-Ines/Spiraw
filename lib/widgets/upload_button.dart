import 'package:dotted_border/dotted_border.dart';

import '../../../bases/screens/exports.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(AppConstants.inputs.radius),
      color: AppColors.secondary,
      strokeWidth: 1.5,
      dashPattern: const [12, 12],
      child: Container(
        height: 104,
        width: 345,
        decoration: BoxDecoration(
            color: AppColors.inputColor,
            borderRadius: BorderRadius.circular(AppConstants.inputs.radius)),
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
              style: AppStyles.interregularTitle
                  .withColor(AppColors.greyBackground)
                  .withSize(FontSizes.title)
                  .medium(),
            ),
          ],
        ),
      ),
    );
  }
}
