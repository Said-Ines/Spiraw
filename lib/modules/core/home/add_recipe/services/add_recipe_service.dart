import '../../data/models/category_info_model.dart';

class AddRecipeService {
  List<CategoryInfo> searchCategory(String searchText, List<CategoryInfo> categories) {
    return categories.where((category) => category.title.toLowerCase().contains(searchText.toLowerCase())).toList();
  }
}
