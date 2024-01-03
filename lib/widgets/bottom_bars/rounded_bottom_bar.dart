import '../../bases/screens/exports.dart';
import '../../modules/core/home/recipe_page/controller/recipe_page_controller.dart';

class RoundedBottomBar extends GetView<RecipePageController> {
  const RoundedBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppConstants.bottomBar.height + 50,
          color: Colors.transparent,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: AppConstants.bottomBar.height,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 4, 13, 31),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppConstants.bottomBar.bottomRadius),
                    topRight: Radius.circular(AppConstants.bottomBar.bottomRadius))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      AppImages.bottomBar.home,
                      width: AppConstants.bottomBar.secondaryButtonSize,
                      height: AppConstants.bottomBar.secondaryButtonSize,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      AppImages.bottomBar.shopping,
                      width: AppConstants.bottomBar.secondaryButtonSize,
                      height: AppConstants.bottomBar.secondaryButtonSize,
                    )),
                const Gap(40),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AppImages.bottomBar.twoPersons,
                    width: AppConstants.bottomBar.secondaryButtonSize,
                    height: AppConstants.bottomBar.secondaryButtonSize,
                  ),
                ),
                Container(
                  width: AppConstants.bottomBar.secondaryButtonSize,
                  height: AppConstants.bottomBar.secondaryButtonSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Material(
                      color: AppColors.transparent,
                      child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            AppImages.bottomBar.profile,
                            fit: BoxFit.cover,
                            width: AppConstants.bottomBar.secondaryButtonSize,
                            height: AppConstants.bottomBar.secondaryButtonSize,
                          )),
                    ),
                  ),
                )
              ],
            ).customPadding(
                left: AppConstants.bodyMinSymetricHorizontalPadding, right: AppConstants.bodyMaxSymetricHorizontalPadding),
          ),
        ),
        Positioned(
            bottom: 50,
            left: Get.width / 3 + 32,
            child: _HexagonalButton(
              onPressed: controller.toAddRecipeScreen,
              icon: Icons.add,
            ))
      ],
    );
  }
}

class _HexagonalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const _HexagonalButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 78,
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: onPressed,
          child: CustomPaint(
            painter: _HexagonPainter(),
            child: Center(
              child: Icon(
                icon,
                size: 44,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = AppColors.inputColor;
    final Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 4);
    path.lineTo(size.width, 3 * size.height / 4);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, 3 * size.height / 4);
    path.lineTo(0, size.height / 4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
