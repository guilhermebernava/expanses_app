import 'package:common/common.dart';
import 'package:common_dependencies/common_dependencies.dart';

part './user_events.dart';
part './user_states.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  final EmailAuthUsecase _emailAuthUsecase;
  final LogoutUsecase _logoutUsecase;
  final GoogleAuthUsecase _googleAuthUsecase;

  AppUser? user;

  UserBloc({
    required EmailAuthUsecase emailAuthUsecase,
    required LogoutUsecase logoutUsecase,
    required GoogleAuthUsecase googleAuthUsecase,
  })  : _emailAuthUsecase = emailAuthUsecase,
        _googleAuthUsecase = googleAuthUsecase,
        _logoutUsecase = logoutUsecase,
        super(UserLogout()) {
    on<Login>((event, emit) async {
      final isLogged = await _emailAuthUsecase(event.dto);

      if (isLogged.isRight()) {
        emit(UserLogged(user: isLogged.right));
        return;
      }

      emit(UserError(message: isLogged.left.message));
    });

    on<LoginGoogle>((event, emit) async {
      final isLogged = await _googleAuthUsecase();

      if (isLogged.isRight()) {
        emit(UserLogged(user: isLogged.right));
        return;
      }

      emit(UserError(message: isLogged.left.message));
    });

    on<Logout>((event, emit) async {
      final response = await _logoutUsecase();

      if (response.isRight()) {
        emit(UserLogout());
        return;
      }
      emit(UserError(message: response.left.message));
    });
  }
}
