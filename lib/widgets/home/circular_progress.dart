import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../bases/screens/exports.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({super.key});

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  ValueNotifier<double>? valueNotifier;
  @override
  void initState() {
    valueNotifier = ValueNotifier(0.0);
    valueNotifier?.value = 75;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleCircularProgressBar(
      valueNotifier: valueNotifier,
      mergeMode: false,
      maxValue: 100,
      startAngle: -90,
      size: 200,
      progressStrokeWidth: 10,
      backStrokeWidth: 0,
      progressColors: const [
        Color(0xFFCBEDB8),
        Color(0xFF60AD86),
        Color(0xFF2E8F4A),
      ],
      onGetText: (double value) {
        return const Text(
          '     Good\n       75%\n  Air Quality',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
