import '../../../../bases/screens/exports.dart';
import '../../../../widgets/bottom_bars/rounded_bottom_bar.dart';
import '../../common/notifications_button.dart';
import '../../common/search_button.dart';
import '../controller/machine_home_page_controller.dart';
import '../eco_impact/screens/eco_impact_screen.dart';
import '../spirulina_growth/screens/spirulina_growth_screen.dart';

class MachineHomePageScreen extends GetView<MachineHomePageController> {
  const MachineHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Material(
                        color: AppColors.transparent,
                        child: GestureDetector(
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
                  const Spacer(),
                  const SearchButton(),
                  const Gap(8),
                  const NotificationsButton(),
                ],
              ),
              const Gap(12),
              Text(
                "Spirulina Growth",
                style: AppStyles.interboldHeadline1.withSize(FontSizes.headline2).withColor(Colors.white),
              ),
              const Gap(30),
              _CustomTabBar(
                tabController: controller.tabController,
                selectedIndex: controller.selectedTabIndex,
              ),
              const Gap(AppConstants.bodyMaxSymetricHorizontalPadding),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    const SpirulinaGrowthScreen().paddingOnly(bottom: 100),
                    SingleChildScrollView(child: const EcoImpactScreen().paddingOnly(bottom: 100)),
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(
            horizontal: AppConstants.bodyMinSymetricHorizontalPadding,
            vertical: AppConstants.minBodyTopPadding,
          ),
          Positioned(
              child: RoundedBottomBar(
            isFromMachineHomePage: true,
            onPressed: controller.toScheduleTimeScreen,
          )),
        ],
      ),
    );
  }
}

class _CustomTabBar extends GetView<MachineHomePageController> {
  const _CustomTabBar({
    super.key,
    required this.tabController,
    required this.selectedIndex,
  });
  final TabController tabController;
  final Observable<int> selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TabBar(
        controller: tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(255, 255, 255, 0.26),
            Color.fromRGBO(255, 255, 255, 0.09),
          ]),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white),
          color: Colors.green,
        ),
        labelColor: Colors.white,
        unselectedLabelStyle: AppStyles.interregularTitle.withColor(Colors.grey),
        indicatorColor: Colors.transparent,
        labelStyle: selectedIndex.value == 0
            ? AppStyles.interboldHeadline1.withColor(Colors.white).withSize(FontSizes.title)
            : AppStyles.interregularSubTitle.withColor(Colors.grey),

        tabs: const [
          Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text('Spirulina'),
            ),
          ),
          Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Eco-impact'),
            ),
          ),
        ],
      ),
    );
  }
}
