import 'package:splash/modules/splash/domain/use_cases/get_user/get_user_usecase.dart';
import 'package:common/common.dart';

class GetUserUsecaseImp implements GetUserUsecase {
  final AppRepository _appRepository;

  GetUserUsecaseImp({required AppRepository appRepository})
      : _appRepository = appRepository;

  @override
  Future<String?> call() async {
    final result = await _appRepository.getUser();

    if (result.isLeft()) {
      return result.left.title;
    }

    return null;
  }
}
