import 'package:common/datasources/api/dio/dio_api_datasource_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final service = DioApiDatasourceImp(
    baseUrl: "https://pokeapi.co/api/v2",
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
