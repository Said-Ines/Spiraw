import '../../../../../bases/controllers/exports.dart';

class CategoryInfo {
  final String image;
  final String title;
  RxBool isSelected;

  CategoryInfo({
    required this.image,
    required this.title,
    bool? isSelected,
  }) : isSelected = isSelected?.obs ?? false.obs;
}
