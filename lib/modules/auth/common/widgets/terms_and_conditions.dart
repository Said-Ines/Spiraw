import '../../../../bases/screens/exports.dart';

class TermsAndConditionsAgreeingWidget extends StatelessWidget {
  const TermsAndConditionsAgreeingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.viewInsetsOf(context).bottom == 0
        ? Text(
            "By continuing, you are agreeing to Spiraw’s\n Terms & Conditions and Privacy Policy",
            textAlign: TextAlign.center,
            style: AppStyles.interregularSubTitle.withSize(FontSizes.subtitle).withColor(Colors.white),
          )
        : const SizedBox.shrink();
  }
}
