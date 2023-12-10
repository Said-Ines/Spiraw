import '../../../bases/controllers/exports.dart';

class DesignSystemController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final inputControls = InputControl.generate(3);
  final performingApiCall = Observable(false);
  final acceptanceObs = Observable<bool>(true);
  final isSelected = Observable<bool>(true);
  final observables = List.generate(3, (index) => Observable<bool>(index.isOdd));

  void validate() {
    formKey.isValid;
  }

  Future<void> login() async {
    performingApiCall.toggle();
    await 2.delay();
    performingApiCall.toggle();
  }

  @override
  void onClose() {
    inputControls.disposeAll();
    super.onClose();
  }
}
