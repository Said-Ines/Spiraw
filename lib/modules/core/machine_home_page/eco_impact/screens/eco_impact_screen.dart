import 'package:day_picker/day_picker.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../../bases/screens/exports.dart';
import '../../../../../widgets/home/circular_progress.dart';
import '../../controller/machine_home_page_controller.dart';
import '../common/widgets/custom_tab_bar.dart';

class EcoImpactScreen extends GetView<MachineHomePageController> {
  const EcoImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CircularProgress(),
          const Gap(20),
          CustomTabBar(
            tabController: controller.ecoImpactTabController,
            selectedIndex: controller.selectedEcoImpactTabIndex,
            isFromEcoImpact: true,
            tabs: const [
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Today",
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.0),
                  child: Text(
                    "Weekly",
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.5),
                  child: Text(
                    "Monthly",
                  ),
                ),
              ),
            ],
          ),
          const Gap(30),
          SizedBox(
            height: 130,
            child: TabBarView(
              controller: controller.ecoImpactTabController,
              children: [
                ListView.builder(
                  itemCount: controller.days.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DayInWeek day = controller.days[index];
                    return _ListItem(
                      title: day.dayKey,
                      percentage: 15,
                      topPercentage: 20,
                    ).paddingOnly(right: 14);
                  },
                ),
                ListView.builder(
                  itemCount: controller.weeks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String week = controller.weeks[index];
                    return _ListItem(
                      title: week,
                      percentage: 15,
                      topPercentage: 20,
                    ).paddingOnly(right: 50);
                  },
                ),
                ListView.builder(
                  itemCount: controller.months.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String month = controller.months[index];
                    return _ListItem(
                      title: month,
                      percentage: 15,
                      topPercentage: 20,
                    ).paddingOnly(right: 14);
                  },
                ),
              ],
            ),
          ),
          Observer(
              observes: controller.selectedEcoImpactTabIndex,
              builder: (context, index) {
                return _DotsIndicatorWidget(
                  itemCount: 3,
                  currentPage: controller.selectedEcoImpactTabIndex.value,
                );
              }),
          const Gap(20),
          Text(
            'Spirulina consumed',
            style: AppStyles.interSemiBoldTextButton.withColor(Colors.white).withSize(FontSizes.headline4),
          ).align(alignment: Alignment.topLeft),
          const Gap(20),
          CustomTabBar(
            selectedIndex: controller.selectedSpirulinaConsumedTabIndex,
            tabController: controller.spirulnaConsumedTabController,
            isSpirulinaConsumed: true,
            tabs: const [
              Tab(
                child: Text(
                  "Today",
                ),
              ),
              Tab(
                child: Text(
                  "Weekly",
                ),
              ),
              Tab(
                child: Text(
                  "Monthly",
                ),
              ),
            ],
          ),
          const Gap(20),
          SizedBox(
            height: 230,
            child: TabBarView(
              controller: controller.spirulnaConsumedTabController,
              children: const [
                _ChartView(),
                _ChartView(),
                _ChartView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    super.key,
    required this.title,
    required this.percentage,
    required this.topPercentage,
  });

  final String title;
  final int percentage;
  final int topPercentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 45,
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(42),
            border: Border.all(color: AppColors.greyDark),
            gradient: const LinearGradient(
              begin: Alignment(0.946, 0.154),
              end: Alignment(0.094, 0.953),
              colors: [
                Color.fromRGBO(34, 34, 34, 0.08),
                Color.fromRGBO(15, 15, 15, 0.22),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(84, 84, 84, 0.21),
                offset: Offset(4, 4),
                blurRadius: 16,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: AppStyles.interSemiBoldTextButton.medium().withColor(Colors.white).withSize(FontSizes.subtitle),
              ),
              const Gap(8),
              Text(
                "$percentage%",
                style: AppStyles.interSemiBoldTextButton.medium().withColor(Colors.grey).withSize(FontSizes.subtitle),
              )
            ],
          ).paddingOnly(bottom: 12),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.greenDark, width: 2.5)),
          child: Text(
            "$topPercentage%",
            style: AppStyles.interregularSubTitle.medium(),
          ).center(),
        )
      ],
    );
  }
}

class _DotsIndicatorWidget extends StatelessWidget {
  const _DotsIndicatorWidget({
    super.key,
    required this.itemCount,
    required this.currentPage,
  });

  final int itemCount;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: itemCount,
      position: currentPage,
      decorator: DotsDecorator(
        size: const Size.square(7),
        activeColor: AppColors.secondary,
        activeSize: const Size(40, 7),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

class _ChartView extends GetView<MachineHomePageController> {
  const _ChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366,
      height: 202,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
        gradient: const LinearGradient(
          begin: Alignment(0.946, 0.154),
          end: Alignment(0.094, 0.953),
          colors: [
            Color.fromRGBO(34, 34, 34, 0.08),
            Color.fromRGBO(15, 15, 15, 0.22),
          ],
        ),
      ),
      child: BarChart(
        BarChartData(
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: controller.getBarGroups(
            controller.selectedSpirulinaConsumedTabIndex.value,
          ),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (controller.selectedSpirulinaConsumedTabIndex.value) {
                    case 0:
                      return Text(
                        controller.days[value.toInt()].dayKey,
                        style:
                            AppStyles.interSemiBoldTextButton.medium().withColor(AppColors.grey).withSize(FontSizes.indication),
                      );
                    case 1:
                      return Text(
                        controller.weeks[value.toInt()],
                        style:
                            AppStyles.interSemiBoldTextButton.medium().withColor(AppColors.grey).withSize(FontSizes.indication),
                      );
                    case 2:
                      return Text(
                        controller.months[value.toInt()],
                        style:
                            AppStyles.interSemiBoldTextButton.medium().withColor(AppColors.grey).withSize(FontSizes.indication),
                      );
                    default:
                      return Text(
                        controller.days[value.toInt()].dayKey,
                        style:
                            AppStyles.interSemiBoldTextButton.medium().withColor(AppColors.grey).withSize(FontSizes.indication),
                      );
                  }
                },
              ),
            ),
          ),
        ),
      ).customPadding(top: 60, bottom: 15),
    );
  }
}

// class _BarValue extends StatelessWidget {
//   const _BarValue({super.key, required this.barValue});

//   final double barValue;

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: TrianglePainter(),
//       child: Container(
//         width: 50,
//         height: 20,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(4),
//           color: Colors.white,
//         ),
//         child: Text(
//           '$barValue',
//           style: AppStyles.interboldHeadline3.withSize(FontSizes.subtitle).withColor(const Color(0xFF171817)),
//         ),
//       ),
//     );
//   }
// }

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final path = Path()
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
