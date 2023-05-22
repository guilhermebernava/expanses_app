import 'dart:isolate';

import 'package:common_dependencies/common_dependencies.dart';

class IsolateProps {
  final Uri endpoint;
  final SendPort sendPort;
  final String? body;
  final Dio dio;

  IsolateProps({
    required this.body,
    required this.endpoint,
    required this.sendPort,
    required this.dio,
  });
}
