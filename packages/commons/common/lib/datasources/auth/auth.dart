import 'package:common/datasources/errors/api_error.dart';
import 'package:common/domain/entities/user.dart';
import 'package:common/infra/dtos/login_dto.dart';
import 'package:common/infra/dtos/sign_up_dto.dart';
import 'package:common/utils/tuple.dart';

abstract interface class AuthDatasource {
  Future<Tuple<ApiError, AppUser>> loginGoogle();
  Future<Tuple<ApiError, AppUser>> loginGithub();
  Future<Tuple<ApiError, AppUser>> loginEmail(LoginDto dto);
  Future<Tuple<ApiError, AppUser>> signUp(SignUpDto dto);
  Future<Tuple<ApiError, void>> forgotPassword(String email);

  Future<Tuple<ApiError, void>> logout();
}
