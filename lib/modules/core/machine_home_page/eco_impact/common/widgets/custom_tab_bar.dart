import '../../../../../../bases/screens/exports.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.selectedIndex,
    required this.tabs,
    this.isFromEcoImpact = false,
    this.isSpirulinaConsumed = false,
  });
  final TabController tabController;
  final Observable<int> selectedIndex;
  final List<Tab> tabs;
  final bool? isFromEcoImpact;
  final bool? isSpirulinaConsumed;

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
        indicator: !isSpirulinaConsumed!
            ? BoxDecoration(
                gradient: !isFromEcoImpact!
                    ? const LinearGradient(
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.26),
                          Color.fromRGBO(255, 255, 255, 0.09),
                        ],
                      )
                    : const LinearGradient(
                        begin: Alignment(-1.0, -7.77),
                        end: Alignment(0.0, 1.265),
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.00),
                          Color.fromRGBO(255, 255, 255, 0.09),
                        ],
                        stops: [0.0, 1.0],
                      ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white),
                //color: Colors.green,
              )
            : const BoxDecoration(color: AppColors.transparent),
        // labelColor: Colors.white,
        unselectedLabelStyle: AppStyles.interregularTitle.withColor(Colors.grey),
        indicatorColor: Colors.transparent,
        labelStyle: selectedIndex.value == 0
            ? AppStyles.interboldHeadline1
                .withColor(Colors.white)
                .withSize(!isFromEcoImpact! ? FontSizes.title : FontSizes.subtitle)
            : AppStyles.interregularSubTitle.withColor(Colors.grey),
        tabs: tabs,
      ),
    );
  }
}
