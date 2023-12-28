import '../../../../../app/images/app_images.dart';
import '../../../../../bases/controllers/exports.dart';
import '../../data/models/category_info_model.dart';
import '../services/add_recipe_service.dart';

class AddRecipeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final inputControls = InputControl.generate(3);

  final RxList<CategoryInfo> categories = [
    CategoryInfo(image: AppImages.indianFood, title: "Indian"),
    CategoryInfo(image: AppImages.italianFood, title: "Italian"),
    CategoryInfo(image: AppImages.americanFood, title: "American"),
    CategoryInfo(image: AppImages.mexicanFood, title: "Mexican"),
    CategoryInfo(image: AppImages.chineseFood, title: "Chinese"),
    CategoryInfo(image: AppImages.greekFood, title: "Greek"),
  ].obs;

  final RxList<CategoryInfo> searchResults = <CategoryInfo>[].obs;

  var selectedDifficulty = 'Easy'.obs;

  var difficultyOptions = [
    'Easy',
    'Intermediate',
    'Hard',
    'Mastery',
  ];

  var preparationTime = 5.obs;
  var cookingTime = 4.obs;
  var quantity = 4.obs;

  void addRecipeValidation() {
    if (!formKey.isValid) return;
  }

  void updateSelectedDifficulty(String? newValue) {
    if (newValue != null) {
      selectedDifficulty.value = newValue;
    }
  }

  void onSearchTextChanged(String searchText) {
    searchResults.value = AddRecipeService().searchCategory(searchText, categories);
  }

  void updateSearchResults(List<CategoryInfo> results) {
    searchResults.value = results;
  }

  void deselectAllExcept(CategoryInfo selectedCategory) {
    for (var category in categories) {
      if (category != selectedCategory) {
        category.isSelected.value = false;
      }
    }
  }

  @override
  void onClose() {
    inputControls.disposeAll();
    super.onClose();
  }
}
