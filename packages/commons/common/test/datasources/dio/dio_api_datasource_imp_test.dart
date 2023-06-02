import 'package:common/datasources/api/dio/dio_api_datasource_imp.dart';
import 'package:common/utils/validators/check_internet/check_internet.dart';
import 'package:flutter_test/flutter_test.dart';

class CheckInternetMock implements CheckInternet {
  @override
  Future<bool> hasInternet() async {
    return true;
  }
}

void main() {
  final mock = CheckInternetMock();

  TestWidgetsFlutterBinding.ensureInitialized();
  final service = DioApiDatasourceImp(
    baseUrl: "https://pokeapi.co/api/v2",
    checkInternet: mock,
  );

  test('Should Work GET', () async {
    final response = await service.get(endpoint: "/pokemon/ditto");
    expect(response.isRight(), true);
  });

  test('Should not Work GET when ENDPOINT is wrong', () async {
    final response = await service.get(endpoint: "/pokem");
    expect(response.isLeft(), true);
  });

  //TODO implementar testes para POST
}
