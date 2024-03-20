import 'package:data_connection_checker_tv/data_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfo implements INetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfo(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
