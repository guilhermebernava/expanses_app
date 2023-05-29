import 'package:common/datasources/errors/api_error.dart';
import 'package:common/utils/tuple.dart';

abstract class AuthDatasource {
  Future<Tuple<ApiError, void>> loginGoogle();
  Future<Tuple<ApiError, void>> loginGithub();
  Future<Tuple<ApiError, void>> loginEmail();
  Future<Tuple<ApiError, void>> logout();
}
