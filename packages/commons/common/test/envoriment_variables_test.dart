import 'package:common/envoriment_variables.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should get .ENV data', () {
    dotenv.testLoad(fileInput: "apiKeyAndroid=teste");
    final data = EnvorimentVariables.apiKeyAndroid;
    expect(data, isNotNull);
  });
}
