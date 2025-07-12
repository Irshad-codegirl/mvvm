class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  String toString() {
    return '$_message, $_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
    : super(message, 'Error During Communication');
}

class BadRequiestException extends AppException {
  BadRequiestException([String? message]) : super(message, 'Invalid requiest.');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
    : super(message, 'UnAuthorized requiest.');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input.');
}
