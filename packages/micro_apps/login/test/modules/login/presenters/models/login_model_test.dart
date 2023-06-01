import 'package:flutter_test/flutter_test.dart';
import 'package:login/modules/login/presenters/models/login_model.dart';

void main() {
  test('It should create an LoginModel', () {
    final model = LoginModel();
    expect(model, isNotNull);
    expect(model, isA<LoginModel>());
  });
}
