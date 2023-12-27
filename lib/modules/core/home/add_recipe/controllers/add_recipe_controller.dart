import '../../../../../app/images/app_images.dart';
import '../../../../../bases/controllers/exports.dart';

class AddRecipeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final inputControls = InputControl.generate(3);

  final List<CategoryInfo> categories = [
    CategoryInfo(image: AppImages.indianFood, title: "Indian"),
    CategoryInfo(image: AppImages.italianFood, title: "Italian"),
    CategoryInfo(image: AppImages.americanFood, title: "American"),
    CategoryInfo(image: AppImages.mexicanFood, title: "Mexican"),
    CategoryInfo(image: AppImages.chineseFood, title: "Chinese"),
    CategoryInfo(image: AppImages.greekFood, title: "Greek"),
  ];

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

  @override
  void onClose() {
    inputControls.disposeAll();
    super.onClose();
  }
}

class CategoryInfo {
  final String image;
  final String title;

  CategoryInfo({required this.image, required this.title});
}
