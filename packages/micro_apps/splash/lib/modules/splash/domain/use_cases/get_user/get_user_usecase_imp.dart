import 'package:splash/modules/splash/domain/use_cases/get_user/get_user_usecase.dart';
import 'package:common/common.dart';

class GetUserUsecaseImp implements GetUserUsecase {
  final AppRepository _appRepository;

  GetUserUsecaseImp({required AppRepository appRepository})
      : _appRepository = appRepository;

  @override
  Future<Tuple<GenericError, AppUser>> call() async {
    final result = await _appRepository.getUser();

    if (result.isLeft()) {
      return Tuple.left(GenericError(message: result.left.title));
    }

    return Tuple.right(result.right);
  }
}
