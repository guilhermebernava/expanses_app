import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/sign_up/presenters/models/sign_up_model.dart';

void main() {
  test('It should create SING_UP_MODEL', () {
    final entity = SignUpModel();
    expect(entity, isA<SignUpModel>());
  });
}
