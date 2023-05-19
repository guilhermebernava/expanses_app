import 'package:common_dependencies/common_dependencies.dart';

class IsolateFunctionProps {
  final Uri endpoint;
  final String? body;
  final Dio dio;

  IsolateFunctionProps({
    required this.body,
    required this.endpoint,
    required this.dio,
  });
}
