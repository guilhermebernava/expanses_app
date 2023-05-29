import 'package:common/common.dart';
import 'first_time_app_usecase.dart';

class FirstTimeAppUsecaseImp implements FirstTimeAppUseCase {
  final AppRepository _appRepository;

  FirstTimeAppUsecaseImp({required AppRepository appRepository})
      : _appRepository = appRepository;

  @override
  Future<Tuple<String, bool>> isFirstTime() async {
    final result = await _appRepository.isFirstTime();

    if (result.isLeft()) {
      return Tuple.left(result.left.title);
    }

    if (result.right) {
      return _registerFirstTime();
    }
    return Tuple.right(false);
  }

  Future<Tuple<String, bool>> _registerFirstTime() async {
    final isSaved = await _appRepository.firstTimeApp();

    if (isSaved.isLeft()) {
      return Tuple.left(isSaved.left.title);
    }
    return Tuple.right(true);
  }
}
