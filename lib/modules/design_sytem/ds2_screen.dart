import 'package:action_slider/action_slider.dart';
import 'package:day_picker/day_picker.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';

import '../../bases/screens/exports.dart';
import '../../widgets/home/circuler_progress.dart';
import '../../widgets/home/dose_card.dart';
import '../../widgets/home/harvest_schedule.dart';

class DS2Screen extends StatefulWidget {
  const DS2Screen({super.key});

  @override
  State<DS2Screen> createState() => _DS2ScreenState();
}

class _DS2ScreenState extends State<DS2Screen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  DateTime dateTime = DateTime.now();

  // TODO: We should move this later
  final List<DayInWeek> _days = [
    DayInWeek("S", dayKey: 'Sun'),
    DayInWeek("M", dayKey: 'Mon'),
    DayInWeek("T", dayKey: 'Tue'),
    DayInWeek("W", dayKey: 'Wed'),
    DayInWeek("T", dayKey: 'Thu'),
    DayInWeek("F", dayKey: 'Fri'),
    DayInWeek("S", dayKey: 'Sat'),
  ];
  List<String> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(255, 255, 255, 0.26),
                    Color.fromRGBO(255, 255, 255, 0.09),
                  ]),
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.green,
                ),
                //  padding: const EdgeInsets.all(24),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.transparent,
                labelStyle: _tabController.index == 0
                    ? AppStyles.interboldHeadline3.withColor(Colors.white).withSize(FontSizes.headline3)
                    : AppStyles.interregularSubTitle.withColor(Colors.grey),

                tabs: [
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text('Spirulina',
                          style: _tabController.index == 0
                              ? AppStyles.interboldHeadline3.withColor(Colors.white).withSize(FontSizes.headline3)
                              : AppStyles.interregularSubTitle.withColor(Colors.grey)),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text('Eco-impact',
                          style: _tabController.index == 1
                              ? AppStyles.interboldHeadline3.withColor(Colors.white).withSize(FontSizes.headline3)
                              : AppStyles.interregularSubTitle.withColor(Colors.grey)),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            const Row(
              children: [
                DoseCard(
                  percentage: 100,
                  title: "Available",
                  status: DoseStatus.completed,
                ),
                Gap(20),
                DoseCard(
                  percentage: 12,
                  title: "Doses",
                  status: DoseStatus.incompleted,
                ),
              ],
            ),
            const Gap(20),
            Center(
              child: ActionSlider.standard(
                backgroundColor: Colors.transparent,
                toggleColor: Colors.green,
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                successIcon: const Icon(Icons.check_rounded, color: Colors.white),
                action: (controller) async {
                  controller.loading(); //starts loading animation
                  await Future.delayed(const Duration(seconds: 3));
                  controller.success(); //starts success animation
                  await Future.delayed(const Duration(seconds: 1));
                  controller.reset(); //resets the slider
                },
                child: Text('Harvest now          >>', style: AppStyles.interboldHeadline1.withColor(Colors.white)),
              ),
            ),
            const HarvestSchedule(
              time: "03:10 PM",
              daysList: ["Monday", "Tusday"],
            ),
            const CircularProgress(),
            VerticalBarIndicator(
              percent: 0.5,
              header: "2 Dozes",
              headerStyle: AppStyles.interboldHeadline3.withColor(Colors.white).withSize(36),
              height: 200,
              width: 30,
              color: const [Color.fromRGBO(46, 143, 74, 1), Color.fromRGBO(52, 217, 69, 1)],
            ),
            SizedBox(
              height: 300,
              child: TimePickerSpinner(
                time: dateTime,
                is24HourMode: false,
                isShowSeconds: false,
                itemHeight: 80,
                spacing: 20,
                alignment: Alignment.bottomCenter,
                normalTextStyle: AppStyles.interboldHeadline3.withColor(Colors.white),
                highlightedTextStyle: AppStyles.interboldHeadline3.withColor(AppColors.secondary),
                isForce2Digits: true,
                onTimeChange: (time) {
                  // setState(() {
                  //   dateTime = time;
                  // });
                },
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(color: Color(0xFF1B2D51), spreadRadius: 3),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Repetition", style: AppStyles.interboldHeadline3.withColor(Colors.white))
                        .customPadding(top: 25, left: 20),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectWeekDays(
                          daysFillColor: const Color(0xFF34D945),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          days: _days,
                          border: true,
                          boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onSelect: (values) async {
                            // <== Callback to handle the selected days
                            // print(values);
                            debugPrint(selectedDates.toString());

                            selectedDates = values;
                            selectedDates.add(DateFormat('kk:mm').format(dateTime));
                            debugPrint(selectedDates.toString());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check_circle,
                      size: 55,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
