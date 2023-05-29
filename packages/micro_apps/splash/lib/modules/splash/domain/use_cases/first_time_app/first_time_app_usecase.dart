import 'package:common/common.dart';

abstract class FirstTimeAppUseCase {
  Future<Tuple<String, bool>> isFirstTime();
}
