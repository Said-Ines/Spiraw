import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/bottom_bars/rounded_bottom_bar.dart';
import '../../common/floatting_button.dart';
import '../controller/recipe_page_controller.dart';

class RecipePageScreen extends GetView<RecipePageController> {
  const RecipePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'SPIRAW.',
                    style: AppStyles.rubikboldHeadline3.withColor(AppColors.secondary).withSize(FontSizes.headline4),
                  ),
                  const Spacer(),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      color: AppColors.greyDark,
                      icon: Image.asset(
                        AppImages.searchIcon,
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {},
                    ).center(),
                  ),
                  const Gap(8),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      color: AppColors.greyDark,
                      icon: Image.asset(
                        AppImages.notificationIcon,
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {},
                    ).center(),
                  ),
                ],
              ).paddingOnly(
                  left: AppConstants.bodyMinSymetricHorizontalPadding,
                  right: AppConstants.bodyMinSymetricHorizontalPadding,
                  top: AppConstants.minBodyTopPadding),
              const Gap(16),
              Text(
                "Top creators",
                style: AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white).withSize(FontSizes.headline5),
              ).align(alignment: Alignment.topLeft).paddingOnly(left: AppConstants.bodyMinSymetricHorizontalPadding),
              const Gap(16),
              SizedBox(
                height: Get.height * 0.119,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) => _StoryItem(
                          image: AppImages.bottomBar.profile,
                          name: 'James',
                        ).paddingOnly(
                          left: AppConstants.bodyMinSymetricHorizontalPadding,
                          right: 3,
                        )),
              ),
              const Gap(24),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.offWhite),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Blue Spirulina Smoothie",
                              style: AppStyles.interboldHeadline3.withSize(FontSizes.headline5).withColor(Colors.white),
                            ),
                            const Gap(12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    AppImages.likeIcon,
                                    width: AppConstants.recipe.interactiveIconSize,
                                    height: AppConstants.recipe.interactiveIconSize,
                                  ),
                                ),
                                Text(
                                  "1.3M",
                                  style: AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white),
                                ),
                                const Gap(5),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    AppImages.heartIcon,
                                    width: AppConstants.recipe.interactiveIconSize,
                                    height: AppConstants.recipe.interactiveIconSize,
                                  ),
                                ),
                                Text(
                                  "55k",
                                  style: AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white),
                                ),
                                const Gap(5),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    AppImages.deliciousIcon,
                                    width: AppConstants.recipe.interactiveIconSize,
                                    height: AppConstants.recipe.interactiveIconSize,
                                  ),
                                ),
                                Text(
                                  "55k",
                                  style: AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white),
                                ),
                              ],
                            ),
                            const Gap(50),
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.clockIcon,
                                  width: AppConstants.recipe.iconSize,
                                ),
                                const Gap(16),
                                Text(
                                  "5 - 10 mins",
                                  style: AppStyles.interSemiBoldTextButton.withColor(Colors.white).withSize(FontSizes.headline6),
                                )
                              ],
                            ),
                            const Gap(24),
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.flameIcon,
                                  width: AppConstants.recipe.iconSize,
                                ),
                                const Gap(16),
                                Text(
                                  "154 Kcal",
                                  style: AppStyles.interSemiBoldTextButton.withColor(Colors.white).withSize(FontSizes.headline6),
                                )
                              ],
                            ),
                            const Gap(24),
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.personIcon,
                                  width: AppConstants.recipe.iconSize,
                                ),
                                const Gap(16),
                                Text(
                                  "2 people",
                                  style: AppStyles.interSemiBoldTextButton.withColor(Colors.white).withSize(FontSizes.headline6),
                                )
                              ],
                            ),
                            const Gap(24),
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.leafIcon,
                                  width: AppConstants.recipe.iconSize,
                                ),
                                const Gap(16),
                                Text(
                                  "Vegetarian",
                                  style: AppStyles.interSemiBoldTextButton.withColor(Colors.white).withSize(FontSizes.headline6),
                                )
                              ],
                            ),
                            const Gap(16),
                            Row(
                              children: [
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
                                ),
                                const Gap(15),
                                Text(
                                  "Chris Jr.",
                                  style: AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white),
                                ),
                                const Gap(24),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.transparent,
                                        minimumSize: const Size(80, 36),
                                        side: const BorderSide(color: Colors.white)),
                                    onPressed: () {},
                                    child: Text(
                                      "Follow",
                                      style: AppStyles.interSemiBoldTextButton
                                          .medium()
                                          .withColor(Colors.white)
                                          .withSize(FontSizes.subtitle),
                                    )),
                                const Spacer()
                              ],
                            ),
                            const Gap(8),
                            Text(
                              "This gorgeous Blue Spirulina Smoothie is packed with good-for-you ingredients that are loaded with antioxidants.",
                              style: AppStyles.interregularSubTitle.withColor(Colors.white),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 26, vertical: 15),
                      ).paddingSymmetric(horizontal: 6),
                      Positioned(
                        bottom: Get.height / 2,
                        left: Get.width / 2 + 20,
                        child: ClipOval(
                          child: Material(
                            color: AppColors.transparent,
                            child: InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  AppImages.foodImage,
                                  fit: BoxFit.cover,
                                  width: 280,
                                  height: 270,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Positioned(child: RoundedBottomBar()),
        ],
      ),
      floatingActionButton: FloatingButton(
        onPressed: () {},
        icon: Image.asset(
          AppImages.downloadIcon,
          width: 30,
          height: 30,
        ),
      ).customPadding(bottom: 100, right: 10),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem({required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Material(
            color: AppColors.transparent,
            child: InkWell(
                onTap: () {},
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 55,
                  height: 55,
                )),
          ),
        ),
        const Gap(8),
        Text(
          name,
          style: AppStyles.interregularTitle,
        ),
      ],
    );
  }
}
