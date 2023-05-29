import 'package:common/datasources/errors/api_error.dart';
import 'package:common/domain/entities/user.dart';
import 'package:common/utils/tuple.dart';

abstract class AuthDatasource {
  Future<Tuple<ApiError, AppUser>> loginGoogle();
  Future<Tuple<ApiError, AppUser>> loginGithub();
  Future<Tuple<ApiError, AppUser>> loginEmail();
  Future<Tuple<ApiError, void>> logout();
}
