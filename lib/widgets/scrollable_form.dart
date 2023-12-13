import '../app/index.dart';
import '../bases/controllers/exports.dart';

class ScrollableForm extends StatelessWidget {
  const ScrollableForm({
    super.key,
    this.formKey,
    this.topPadding,
    this.horizontalPadding = AppConstants.bodyMinSymetricHorizontalPadding,
    this.bottomPadding = AppConstants.bodyBottomPadding,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.children,
  });

  final GlobalKey<FormState>? formKey;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double? topPadding;
  final double horizontalPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ).customPadding(
          top: topPadding ?? 0,
          left: horizontalPadding,
          right: horizontalPadding,
          bottom: bottomPadding,
        ),
      ),
    );
  }
}
