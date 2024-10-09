class ResponseHandler<T> {
  final String? error;
  final T? data;
  ResponseHandler({
    this.error,
    this.data,
  });
}
