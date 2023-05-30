class ApiError {
  final String message;
  final String endpoint;
  final int? statusCode;

  ApiError({
    required this.endpoint,
    required this.message,
    required this.statusCode,
  });
}
