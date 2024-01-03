import '../../../../bases/controllers/exports.dart';
import '../../../../bases/screens/exports.dart';

class AddWaterController extends GetxController {
  final List<String> imagePaths = [
    AppImages.emptyImage,
    AppImages.fillingImage,
    AppImages.filledImage,
  ];

  final RxList<String> textList = ["Empty", "Filling", "Filled"].obs;

  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _startImageAndTextCarousel();
  }

  void _startImageAndTextCarousel() async {
    for (int i = 0; i < imagePaths.length; i++) {
      await Future.delayed(const Duration(seconds: 2));
      currentIndex.value = i;
    }
  }

  void toScanningSupplement() {
    Get.toNamed(scanningSupplementModule.name);
  }
}
