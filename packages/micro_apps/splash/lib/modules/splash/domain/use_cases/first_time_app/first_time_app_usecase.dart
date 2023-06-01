import 'package:common/common.dart';

abstract interface class FirstTimeAppUseCase {
  Future<Tuple<String, bool>> isFirstTime();
}
