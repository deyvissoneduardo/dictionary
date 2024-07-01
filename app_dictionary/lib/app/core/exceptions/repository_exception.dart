class RepositoryException implements Exception {
  final String? message;
  final int? code;

  RepositoryException({
    this.message,
    this.code,
  });
}
