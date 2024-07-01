class RestClientResponse<T> {
  final T? data;
  final int? statusCode;
  final String? message;

  RestClientResponse({
    this.data,
    this.statusCode,
    this.message,
  });
}
