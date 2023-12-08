import '../../widgets/observable.dart';

extension ObservableExt on Observable<bool> {
  void toggle() => value = !value;
}
