import 'package:common/datasources/api/api_datasource.dart';
import 'package:common/datasources/errors/api_error.dart';
import 'package:common/utils/isolates/isolate_function_props.dart';
import 'package:common/utils/isolates/isolate_functions.dart';
import 'package:common/utils/tuple.dart';
import 'package:common/utils/validators/check_internet/check_internet.dart';
import 'package:common_dependencies/common_dependencies.dart';

class DioApiDatasourceImp implements ApiDatasource {
  final String baseUrl;
  final CheckInternet checkInternet;
  final _dio = Dio();

  DioApiDatasourceImp({
    required this.baseUrl,
    required this.checkInternet,
  });

  @override
  Future<Tuple<ApiError, Response>> get({required String endpoint}) async {
    if (await _haveInternet() == false) {
      return Tuple.left(
        ApiError(
          endpoint: endpoint,
          message: "NO INTERNET",
          statusCode: 001,
        ),
      );
    }
    final response = await IsolateFunctions.isolateGet(
      IsolateFunctionProps(
        endpoint: Uri.parse(
          baseUrl + endpoint,
        ),
        body: null,
        dio: _dio,
      ),
    );

    if (response == null) {
      return Tuple.left(
        ApiError(
          endpoint: endpoint,
          message: "error in go to endpoint",
          statusCode: 404,
        ),
      );
    }

    if (response.statusCode != 200) {
      return Tuple.left(
        ApiError(
          endpoint: endpoint,
          message: response.statusMessage ?? "UNKNOWNN ERROR",
          statusCode: response.statusCode,
        ),
      );
    }

    return Tuple.right(response);
  }

  @override
  Future<Tuple<ApiError, Response>> post(
      {required String endpoint, required String body}) async {
    if (await _haveInternet() == false) {
      return Tuple.left(
        ApiError(
          endpoint: endpoint,
          message: "NO INTERNET",
          statusCode: 001,
        ),
      );
    }

    final response = await IsolateFunctions.isolatePost(
      IsolateFunctionProps(
        endpoint: Uri.parse(
          baseUrl + endpoint,
        ),
        body: body,
        dio: _dio,
      ),
    );

    if (response == null) {
      return Tuple.left(
        ApiError(
          endpoint: endpoint,
          message: "error in go to endpoint",
          statusCode: 404,
        ),
      );
    }

    if (response.statusCode != 200) {
      return Tuple.left(
        ApiError(
          endpoint: endpoint,
          message: response.statusMessage ?? "UNKNOWNN ERROR",
          statusCode: response.statusCode,
        ),
      );
    }

    return Tuple.right(response);
  }

  Future<bool> _haveInternet() async => await checkInternet.hasInternet();
}
