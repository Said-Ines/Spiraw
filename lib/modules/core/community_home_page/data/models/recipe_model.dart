import 'category_info_model.dart';
import 'ingredient_model.dart';

class RecipeModel {
  final String uid;
  final String title;
  final String userId;
  final String description;
  final String? recipeImage;
  final CategoryInfo? category;
  final int preparationTime;
  final int cookingTime;
  final String difficulty;
  final List<IngredientModel> ingredients;

  RecipeModel({
    required this.uid,
    required this.title,
    required this.userId,
    required this.description,
    this.recipeImage,
    this.category,
    required this.preparationTime,
    required this.cookingTime,
    required this.difficulty,
    required this.ingredients,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'userId': userId,
      'description': description,
      'recipeImage': recipeImage ?? "",
      'category': category?.title ?? "No category mentioned",
      'preparationTime': preparationTime,
      'cookingTime': cookingTime,
      'difficulty': difficulty,
      'ingredients': ingredients.map((e) => e.toMap()).toList(),
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      uid: map['uid'],
      title: map['title'],
      userId: map['userId'],
      description: map['description'],
      recipeImage: map['recipeImage'],
      category: CategoryInfo.fromMap(map['category']),
      preparationTime: map['preparationTime'],
      cookingTime: map['cookingTime'],
      difficulty: map['difficulty'],
      ingredients: List<IngredientModel>.from(map['ingredients']?.map((x) => IngredientModel.fromMap(x))),
    );
  }
}
