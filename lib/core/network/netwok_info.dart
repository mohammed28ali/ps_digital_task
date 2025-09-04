import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> get onStatusChange;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker;

  bool? _cachedConnectionStatus;
  DateTime? _lastCheckTime;
  static const Duration _cacheDuration = Duration(seconds: 5);

  NetworkInfoImpl({required InternetConnectionChecker connectionChecker})
    : _connectionChecker = connectionChecker;

  @override
  Future<bool> get isConnected async {
    final now = DateTime.now();

    if (_cachedConnectionStatus != null &&
        _lastCheckTime != null &&
        now.difference(_lastCheckTime!) < _cacheDuration) {
      return _cachedConnectionStatus!;
    }

    final isConnected = await _connectionChecker.hasConnection;

    _cachedConnectionStatus = isConnected;
    _lastCheckTime = now;

    return isConnected;
  }

  @override
  Stream<InternetConnectionStatus> get onStatusChange =>
      _connectionChecker.onStatusChange;
}
