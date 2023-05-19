import 'dart:isolate';
import 'package:common/datasources/utils/isolates/isolate_props.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'isolate_function_props.dart';

class IsolateFunctions {
  static Future<Response?> isolateGet(IsolateFunctionProps props) async {
    try {
      final port = ReceivePort();
      await Isolate.spawn(
        (props) async {
          final response = await props.dio.getUri(props.endpoint);
          Isolate.exit(props.sendPort, response);
        },
        IsolateProps(
          body: props.body,
          endpoint: props.endpoint,
          sendPort: port.sendPort,
          dio: props.dio,
        ),
        errorsAreFatal: true,
        onError: port.sendPort,
      );
      final response = await port.first as Response;
      port.close();
      return response;
    } catch (e) {
      return null;
    }
  }

  static Future<Response?> isolatePost(IsolateFunctionProps props) async {
    try {
      final port = ReceivePort();
      await Isolate.spawn(
        (props) async {
          final response = await props.dio.postUri(
            props.endpoint,
            data: props.body,
          );
          Isolate.exit(props.sendPort, response);
        },
        IsolateProps(
          body: props.body,
          endpoint: props.endpoint,
          sendPort: port.sendPort,
          dio: props.dio,
        ),
        errorsAreFatal: true,
        onError: port.sendPort,
      );
      final response = await port.first as Response;
      port.close();
      return response;
    } catch (e) {
      return null;
    }
  }
}
