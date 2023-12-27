import '../bases/screens/exports.dart';

class DropDownButtonSection extends StatelessWidget {
  const DropDownButtonSection({
    super.key,
    required this.value,
    required this.onChanged,
    required this.itemsList,
  });

  final String value;
  final void Function(String?)? onChanged;
  final List<String> itemsList;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: Container(
            height: 56,
            width: 300,
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              border: Border.all(color: AppColors.inputColor, width: 2),
              borderRadius: BorderRadius.circular(
                AppConstants.inputs.radius,
              ),
            ),
            child: DropdownButton<String>(
              items: itemsList.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AppStyles.rubikregularTitle.withSize(FontSizes.headline6).medium().withColor(AppColors.darkBackIcon),
                  ).paddingOnly(left: AppConstants.bodyMinSymetricHorizontalPadding),
                );
              }).toList(),
              value: value,
              onChanged: onChanged,
              dropdownColor: AppColors.offWhite,
              icon: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  border: Border.all(color: AppColors.inputColor, width: 2),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppConstants.inputs.radius),
                    bottomRight: Radius.circular(AppConstants.inputs.radius),
                  ),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.offBlack,
                  size: 35,
                ),
              ),
            )).paddingSymmetric(horizontal: AppConstants.bodyMinSymetricHorizontalPadding));
  }
}
