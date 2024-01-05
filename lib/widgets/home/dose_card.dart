import 'package:glassmorphism/glassmorphism.dart';

import '../../app/index.dart';
import '../../bases/extensions/index.dart';
import '../../bases/modules/exports.dart';

enum DoseStatus { completed, incompleted }

class DoseCard extends StatelessWidget {
  const DoseCard({
    super.key,
    this.percentage,
    required this.title,
    required this.status,
    this.doses,
  });
  final String title;
  final double? percentage;
  final int? doses;
  final DoseStatus status;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      DoseStatus.incompleted => _incompletedCard(context),
      DoseStatus.completed => _completedCard(context)
    };
  }

  Widget _incompletedCard(BuildContext context) {
    return GlassmorphicContainer(
      width: AppConstants.cardWidth,
      height: AppConstants.cardHeight,
      borderRadius: AppConstants.cardRadius,
      blur: AppConstants.cardBlur,
      alignment: Alignment.bottomCenter,
      border: 1,
      linearGradient: AppColors.incompletedDoseCardGradient,
      borderGradient: AppColors.incompletedDoseCardBorderGradient,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.interSemiBoldTextButton.medium().withSize(FontSizes.headline5).withColor(Colors.white)),
          const Spacer(),
          Row(
            children: [
              Text("$doses", style: AppStyles.interboldHeadline3.withSize(FontSizes.headline4).withColor(Colors.white)),
              const Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    gradient: AppColors.dozesIconGradientColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Image.asset(
                  AppImages.sandClockIcon,
                  width: 40,
                  height: 40,
                ),
              )
            ],
          )
        ],
      ).customPadding(left: 10, right: 10, bottom: 21, top: 21),
    );
  }

  Widget _completedCard(BuildContext context) {
    return GlassmorphicContainer(
      width: AppConstants.cardWidth,
      height: AppConstants.cardHeight,
      borderRadius: AppConstants.cardRadius,
      blur: AppConstants.cardBlur,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: AppColors.completedDoseCard,
      borderGradient: AppColors.incompletedDoseCardBorderGradient,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.interSemiBoldTextButton.medium().withSize(FontSizes.headline5).withColor(Colors.white)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$percentage%", style: AppStyles.interboldHeadline3.withSize(FontSizes.headline4).withColor(Colors.white)),
              const Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    gradient: AppColors.dozesIconGradientColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Image.asset(
                  AppImages.trendingIcon,
                  width: 36,
                  height: 36,
                ).paddingAll(4),
              )
            ],
          )
        ],
      ).customPadding(left: 10, right: 10, bottom: 21, top: 21),
    );
  }
}
