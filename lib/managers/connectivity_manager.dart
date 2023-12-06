import 'package:connectivity_plus/connectivity_plus.dart';

import '../widgets/observable.dart';

class ConnectivityManager {
  final _connectivity = Connectivity();

  final _connectionStateObs = Observable(true);

  Observable<bool> get connectionStateObs {
    assert(
      _monitoring,
      '\n[ConnectivityManager] You have forgot to start monitoring, try to do it by calling  $ConnectivityManager.startMonitoring()',
    );
    return _connectionStateObs;
  }

  bool _monitoring = false;

  void startMonitoring() {
    if (_monitoring) return;

    _monitoring = true;

    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      _connectionStateObs.value = !_connectionStateObs.value;
      _connectionStateObs.value = connectivityResult != ConnectivityResult.none;
    });
  }
}
