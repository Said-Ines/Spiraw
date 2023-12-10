import '../modules/exports.dart';

class InputControl {
  final TextEditingController controller;
  final FocusNode node;

  InputControl({
    required this.controller,
    required this.node,
  });

  factory InputControl.single() => InputControl(
        controller: TextEditingController(),
        node: FocusNode(),
      );

  static List<InputControl> generate(int count) => List<InputControl>.generate(
        count,
        (index) => InputControl(
          controller: TextEditingController(),
          node: FocusNode(),
        ),
      );

  void dispose() {
    controller.dispose();
    node.dispose();
  }
}

extension InputControlsListDisposer on List<InputControl> {
  void disposeAll() => forEach((element) => {element.controller.dispose(), element.node.dispose()});
  void clearTECs() => forEach((element) => element.controller.clear());
}
