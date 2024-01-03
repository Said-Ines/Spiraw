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

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'isSelected': isSelected,
    };
  }

  factory CategoryInfo.fromMap(Map<String, dynamic> map) {
    return CategoryInfo(
      image: map['image'],
      title: map['title'],
      isSelected: map['isSelected'],
    );
  }
}
