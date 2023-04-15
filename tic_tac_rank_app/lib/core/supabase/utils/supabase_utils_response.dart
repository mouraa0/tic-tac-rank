class SupabaseUtilsResponse {
  final bool success;
  final dynamic exception;

  SupabaseUtilsResponse({
    required this.success,
    this.exception,
  });
}
