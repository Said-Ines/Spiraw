import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../app/constants/firebase_collections.dart';
import '../../../../../bases/controllers/exports.dart';
import '../../data/models/category_info_model.dart';
import '../../data/models/ingredient_model.dart';
import '../controllers/add_recipe_controller.dart';

class AddRecipeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<CategoryInfo> searchCategory(String searchText, List<CategoryInfo> categories) {
    return categories.where((category) => category.title.toLowerCase().contains(searchText.toLowerCase())).toList();
  }

  Future<String> saveAddRecipeScreenInfo(Map<String, dynamic> partialRecipe) async {
    try {
      final DocumentReference<Map<String, dynamic>> recipeRef =
          await _firestore.collection(FirebaseCollections.recipes).add(partialRecipe);
      final String recipeId = recipeRef.id;
      Debugger.green("Recipe added with ID: $recipeId");
      return recipeId;
    } catch (e) {
      Debugger.red("Error while saving add recipe screen info: $e");
      return "";
    }
  }

  Future<void> saveRecipeCategory(String recipeId, CategoryInfo category) async {
    try {
      var recipeRef = FirebaseFirestore.instance.collection('recipes').doc(recipeId);
      var docSnapshot = await recipeRef.get();
      if (!docSnapshot.exists) {
        Debugger.yellow("Document with ID $recipeId does not exist.");
        return;
      }
      await recipeRef.update({
        'category': {
          'image': category.image,
          'title': category.title,
          'isSelected': category.isSelected.value,
        },
      });
    } catch (e) {
      Debugger.red("Error while saving recipe category: $e");
    }
  }

  Future<void> saveRecipeTimeAndDifficulty(String recipeId, int cookingTime, int preparationTime, String difficulty) async {
    try {
      var recipeRef = FirebaseFirestore.instance.collection('recipes').doc(recipeId);
      var docSnapshot = await recipeRef.get();
      if (!docSnapshot.exists) {
        Debugger.red("Document with ID $recipeId does not exist.");
        return;
      }
      await recipeRef.update({
        'cookingTime': cookingTime,
        'preparationTime': preparationTime,
        'difficulty': difficulty,
      });
      Debugger.green("Recipe time and difficulty saved for recipe with ID: $recipeId");
    } catch (e) {
      Debugger.red("Error while saving recipe time and difficulty: $e");
    }
  }

  Future<void> addIngredients(String recipeId, IngredientModel ingredient) async {
    try {
      var recipeRef = FirebaseFirestore.instance.collection('recipes').doc(recipeId);
      var docSnapshot = await recipeRef.get();
      if (!docSnapshot.exists) {
        Debugger.red("Document with ID $recipeId does not exist.");
        return;
      }
      await recipeRef.update({
        'ingredients': FieldValue.arrayUnion([ingredient.toMap()]),
      });
      Get.find<AddRecipeController>().ingredients.add(ingredient);

      Debugger.green("Ingredient added for recipe with ID: $recipeId");
    } catch (e) {
      Debugger.red("Error while adding ingredient: $e");
    }
  }

  Future<void> removeIngredient(String recipeId, IngredientModel ingredient) async {
    try {
      var recipeRef = FirebaseFirestore.instance.collection('recipes').doc(recipeId);
      var docSnapshot = await recipeRef.get();
      if (!docSnapshot.exists) {
        Debugger.red("Document with ID $recipeId does not exist.");
        return;
      }
      await recipeRef.update({
        'ingredients': FieldValue.arrayRemove([ingredient.toMap()]),
      });
      Get.find<AddRecipeController>().ingredients.remove(ingredient);

      Debugger.green("Ingredient removed for recipe with ID: $recipeId");
    } catch (e) {
      Debugger.red("Error while removing ingredient: $e");
    }
  }
}
