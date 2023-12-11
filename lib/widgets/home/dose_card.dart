import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../app/index.dart';
import '../../bases/extensions/index.dart';

enum DoseStatus { completed, incompleted }

class DoseCard extends StatelessWidget {
  const DoseCard({
    super.key,
    required this.percentage,
    required this.title,
    required this.status,
  });
  final String title;
  final double percentage;
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
      width: MediaQuery.of(context).size.width * 0.4,
      height: AppConstants.cardHeight,
      borderRadius: AppConstants.cardRadius,
      blur: 16,
      alignment: Alignment.bottomCenter,
      border: 1,
      linearGradient: AppColors.incompletedDoseCardGradient,
      borderGradient: AppColors.incompletedDoseCardBorderGradient,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.interboldHeadline3.withColor(Colors.white)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$percentage %", style: AppStyles.interboldHeadline1.withColor(Colors.white)),
              const Icon(
                Icons.hourglass_bottom,
                color: Colors.white,
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
      blur: 5,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: AppColors.completedDoseCard,
      borderGradient: AppColors.incompletedDoseCardBorderGradient,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.interboldHeadline3.withColor(Colors.white)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$percentage %", style: AppStyles.interboldHeadline1.withColor(Colors.white)),
              const Spacer(),
              const Icon(
                Icons.insights,
                color: Colors.white,
              )
            ],
          )
        ],
      ).customPadding(left: 10, right: 10, bottom: 21, top: 21),
    );
  }
}
