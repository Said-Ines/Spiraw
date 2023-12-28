import 'dart:math';

import '../../../../bases/screens/exports.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key, this.icon, required this.onPressed});

  final Widget? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()..rotateZ(pi / 4),
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: AppColors.secondary.withOpacity(0.45),
              offset: const Offset(2, 5),
              blurRadius: 15,
            )
          ]),
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: AppColors.secondary,
            onPressed: () {},
            child: Transform(
              transform: Matrix4.identity()..rotateZ(-pi / 4),
              alignment: Alignment.center,
              child: icon,
            ),
          ),
        ));
  }
}
