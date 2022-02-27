class NetworkException implements Exception {
  final _message;
  final _prefix;

  NetworkException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends NetworkException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends NetworkException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class ForbiddenException extends NetworkException {
  ForbiddenException([String? message]) : super(message, "Forbidden exception: ");
}

class NotFoundException extends NetworkException {
  NotFoundException([String? message]) : super(message, "NotFound exception: ");
}

class InternalServerErrorException extends NetworkException {
  InternalServerErrorException([String? message]) : super(message, "InternalServer exception: ");
}
