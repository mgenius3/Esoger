class CustomError implements Exception {
  final String message;
  CustomError(this.message);

  @override
  String toString() => message;
}

String? extractErrorMessages(Map<dynamic, dynamic> errorObject) {
  if (errorObject.containsKey('errors')) {
    Map<String, dynamic> errors = errorObject['errors'];
    StringBuffer errorMessages = StringBuffer();

    errors.forEach((key, value) {
      errorMessages.writeln(value);
    });

    return errorMessages.toString().trim();
  }
}
