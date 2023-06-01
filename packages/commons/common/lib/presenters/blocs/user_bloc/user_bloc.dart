import 'package:common/common.dart';
import 'package:common_dependencies/common_dependencies.dart';

part './user_events.dart';
part './user_states.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  AppUser? user;

  UserBloc() : super(UserLogout()) {
    on<Login>((event, emit) {
      emit(UserLogged(user: event.user));
    });

    on<Logout>((event, emit) async {
      emit(UserLogout());
    });
  }
}
