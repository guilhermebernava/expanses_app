import 'package:common/datasources/api/dio/check_internet.dart';
import 'package:common_dependencies/common_dependencies.dart';

class CheckInternetConnectivyImp implements CheckInternet {
  @override
  Future<bool> hasInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
