import '../../../../../bases/screens/exports.dart';

class RecipePageScreen extends StatelessWidget {
  const RecipePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: Column(
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
            height: 100,
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
          )
        ],
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem({super.key, required this.image, required this.name});

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
