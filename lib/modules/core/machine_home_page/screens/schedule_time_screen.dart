import 'package:day_picker/day_picker.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:spiraw/modules/core/machine_home_page/controller/machine_home_page_controller.dart';

import '../../../../bases/screens/exports.dart';

class ScheduleTimeScreen extends GetView<MachineHomePageController> {
  const ScheduleTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Select schedule time",
              style: AppStyles.interSemiBoldTextButton.medium().withSize(FontSizes.headline5).withColor(Colors.white),
            ).align(alignment: Alignment.center),
            SizedBox(
              height: 300,
              child: TimePickerSpinner(
                time: controller.dateTime,
                is24HourMode: false,
                isShowSeconds: false,
                itemHeight: 80,
                spacing: 20,
                alignment: Alignment.bottomCenter,
                normalTextStyle: AppStyles.interSemiBoldTextButton.medium().withSize(FontSizes.headline4).withColor(Colors.white),
                highlightedTextStyle:
                    AppStyles.interSemiBoldTextButton.medium().withSize(FontSizes.headline4).withColor(AppColors.secondary),
                isForce2Digits: true,
                onTimeChange: (time) {
                  // setState(() {
                  //   dateTime = time;
                  // });
                },
              ),
            ),
            const Gap(30),
            Container(
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
                  Text("Repetition",
                          style: AppStyles.interSemiBoldTextButton.medium().withSize(FontSizes.headline6).withColor(Colors.white))
                      .customPadding(top: 25, left: 20),
                  SelectWeekDays(
                    daysFillColor: const Color(0xFF34D945),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    days: controller.days,
                    padding: 11,
                    border: true,
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onSelect: (values) async {
                      // <== Callback to handle the selected days
                      // print(values);
                      debugPrint(controller.selectedDates.toString());

                      controller.selectedDates = values;
                      controller.selectedDates.add(DateFormat('kk:mm').format(controller.dateTime));
                      debugPrint(controller.selectedDates.toString());
                    },
                  )
                ],
              ),
            ),
            const Gap(40),
            Center(
                child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 64,
                width: 64,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: AppColors.primary,
                  size: 36,
                ),
              ),
            ))
          ],
        ).paddingSymmetric(vertical: AppConstants.maxBodyTopPadding, horizontal: AppConstants.bodyMaxSymetricHorizontalPadding),
      ),
    );
  }
}
