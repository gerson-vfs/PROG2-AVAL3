class GenericError extends Error {
  final String message;

  GenericError(this.message);

  @override
  String toString() => "Error: $message";
}
