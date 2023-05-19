import 'package:common/datasources/errors/api_error.dart';
import 'package:common/datasources/utils/tuple.dart';
import 'package:common_dependencies/common_dependencies.dart';

abstract class ApiDatasource {
  Future<Tuple<ApiError, Response>> get({required String endpoint});
  Future<Tuple<ApiError, Response>> post(
      {required String endpoint, required String body});
}
