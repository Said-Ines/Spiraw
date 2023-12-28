import 'package:camera/camera.dart';

import '../../../../../app/images/app_images.dart';
import '../../../../../bases/controllers/exports.dart';

class AddRecipeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final inputControls = InputControl.generate(3);
  late CameraController _cameraController;
  late Future<void> _initializeCameraControllerFuture;
  CameraDescription? camera;

  @override
  void onInit() {
    super.onInit();
    _cameraController = CameraController(camera!, ResolutionPreset.medium);
    _initializeCameraControllerFuture = _cameraController.initialize();
  }

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
    _cameraController.dispose();
    super.onClose();
  }
}

class CategoryInfo {
  final String image;
  final String title;

  CategoryInfo({required this.image, required this.title});
}
