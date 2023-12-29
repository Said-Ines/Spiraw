import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../../../../../app/images/app_images.dart';
import '../../../../../bases/controllers/exports.dart';
import '../../data/models/category_info_model.dart';
import '../../data/models/ingredient_model.dart';
import '../services/add_recipe_service.dart';

class AddRecipeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final inputControls = InputControl.generate(3);
  final categoryInputControl = InputControl.generate(1);
  final addIngredientInputControls = InputControl.generate(1);

  final AddRecipeService _addRecipeService = AddRecipeService();

  final RxList<CategoryInfo> categories = [
    CategoryInfo(image: AppImages.indianFood, title: "Indian"),
    CategoryInfo(image: AppImages.italianFood, title: "Italian"),
    CategoryInfo(image: AppImages.americanFood, title: "American"),
    CategoryInfo(image: AppImages.mexicanFood, title: "Mexican"),
    CategoryInfo(image: AppImages.chineseFood, title: "Chinese"),
    CategoryInfo(image: AppImages.greekFood, title: "Greek"),
  ].obs;

  final RxList<CategoryInfo> searchResults = <CategoryInfo>[].obs;
  final Rx<CategoryInfo?> selectedCategory = Rx<CategoryInfo?>(null);

  var selectedDifficulty = 'Easy'.obs;
  var selectedServingQuantity = 'Large'.obs;

  late String recipeId;

  var difficultyOptions = [
    'Easy',
    'Intermediate',
    'Hard',
    'Mastery',
  ];

  final RxList<String> servingQuantityOptions = [
    'Extra Large',
    'Large',
    'Medium',
    'Small',
    'Grams',
    'Slice',
  ].obs;

  var preparationTime = 5.obs;
  var cookingTime = 4.obs;
  var quantity = 4.obs;
  Map<String, dynamic> categoryData = {
    'image': "",
    'title': "",
    'isSelected': false,
  };

  final RxList<IngredientModel> ingredients = <IngredientModel>[].obs;

  void addRecipeValidation() async {
    if (!formKey.isValid) return;
    recipeId = const Uuid().v4();
    final DocumentReference<Map<String, dynamic>> recipeRef = FirebaseFirestore.instance.collection('recipes').doc(recipeId);
    await recipeRef.set({
      'uid': recipeId,
      'title': inputControls.first.controller.text,
      'userId': getUserId(),
      'description': inputControls.last.controller.text,
      'recipeImage': inputControls.second.controller.text,
      'category': categoryData,
      'preparationTime': 0,
      'cookingTime': 0,
      'difficulty': "",
      'ingredients': [],
    });

    final DocumentSnapshot<Map<String, dynamic>> snapshot = await recipeRef.get();
    _addRecipeService.saveAddRecipeScreenInfo(snapshot.data() ?? {});
    Get.toNamed(recipeCategoriesModule.name);
  }

  void updateSelectedDifficulty(String? newValue) {
    if (newValue != null) {
      selectedDifficulty.value = newValue;
    }
  }

  void updateSelectedServingQuantity(String? newValue) {
    if (newValue != null) {
      selectedServingQuantity.value = newValue;
    }
  }

  void onSearchTextChanged(String searchText) {
    searchResults.value = _addRecipeService.searchCategory(searchText, categories);
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

  void updateSelectedCategory(CategoryInfo selectedCategory) {
    this.selectedCategory.value = selectedCategory;
    Debugger.cyan('Selected Category: ${selectedCategory.title}');
  }

  void toTimeSpentScreen() async {
    if (selectedCategory.value == null) {
      Get.snackbar("Error", "Please select a category");
      return;
    }

    if (recipeId.isEmpty) {
      Debugger.red("Recipe ID is not available");
      return;
    }

    await _addRecipeService.saveRecipeCategory(recipeId, selectedCategory.value!);

    Get.toNamed(timeSpentModule.name);
  }

  void toIngredientsScreen() async {
    if (recipeId.isEmpty) {
      Debugger.red("Recipe ID is not available");
      return;
    }
    int cookingTimeValue = cookingTime.value;
    int preparationTimeValue = preparationTime.value;
    String difficultyValue = selectedDifficulty.value;

    await _addRecipeService.saveRecipeTimeAndDifficulty(recipeId, cookingTimeValue, preparationTimeValue, difficultyValue);
    Get.toNamed(ingredientsModule.name);
  }

  void fromAddtoIngredientsScreen(String elementName, String servingSize, int quantity) async {
    if (recipeId.isEmpty) {
      Debugger.red("Recipe ID is not available");
      return;
    }

    IngredientModel ingredient = IngredientModel(
      elementName: elementName,
      servingSize: servingSize,
      quantity: quantity,
    );
    await _addRecipeService.addIngredients(recipeId, ingredient);
    Get.toNamed(ingredientsAfterAddModule.name);
  }

  void toAddIngredientsScreen() {
    Get.toNamed(addIngredientsModule.name);
  }

  void toIngredientsAfterAddScreen() {
    Get.toNamed(ingredientsAfterAddModule.name);
  }

  String getUserId() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return user.uid;
    } else {
      return "user not connected";
    }
  }

  @override
  void onClose() {
    inputControls.disposeAll();
    categoryInputControl.disposeAll();
    addIngredientInputControls.disposeAll();
    super.onClose();
  }
}
