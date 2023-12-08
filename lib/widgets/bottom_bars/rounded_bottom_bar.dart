import 'package:flutter/material.dart';
import 'package:spiraw/bases/controllers/exports.dart';
import '../../app/colors/app_colors.dart';

import '../../app/constants/app_constants.dart';

import '../../app/images/app_images.dart';

class RoundedBottomBar extends StatelessWidget {
  const RoundedBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.bottomBar.height,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 4, 13, 31),
          // boxShadow: [
          //   const BoxShadow(
          //       color: Color.fromRGBO(41, 39, 130, 0.1),
          //       offset: Offset(0, -5),
          //       blurRadius: 30,
          //       blurStyle: BlurStyle.outer),
          //   BoxShadow(
          //       color: AppColors.grey.withOpacity(0.5),
          //       offset: const Offset(0, -1),
          //       blurRadius: 1.5,
          //       blurStyle: BlurStyle.outer),
          // ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstants.bottomBar.bottomRadius),
              topRight: Radius.circular(AppConstants.bottomBar.bottomRadius))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppImages.bottomBar.home,
              width: AppConstants.bottomBar.secondaryButtonSize,
              height: AppConstants.bottomBar.secondaryButtonSize,
            )),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            AppImages.bottomBar.twoPersons,
            width: AppConstants.bottomBar.secondaryButtonSize,
            height: AppConstants.bottomBar.secondaryButtonSize,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppImages.bottomBar.shopping,
              width: AppConstants.bottomBar.secondaryButtonSize,
              height: AppConstants.bottomBar.secondaryButtonSize,
            )),
        Container(
          width: AppConstants.bottomBar.secondaryButtonSize,
          height: AppConstants.bottomBar.secondaryButtonSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Material(
              color: AppColors.transparent,
              child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppImages.bottomBar.profile,
                    fit: BoxFit.cover,
                    width: AppConstants.bottomBar.secondaryButtonSize,
                    height: AppConstants.bottomBar.secondaryButtonSize,
                  )),
            ),
          ),
        )
      ]).paddingSymmetric(horizontal: 37),
    );
  }
}
