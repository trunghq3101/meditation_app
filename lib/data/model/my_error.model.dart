enum ErrorCode { unknown, serverError }

extension GetErrorMessage on MyError {
  String get errorMessage => _errorMessage(code);

  String _errorMessage(ErrorCode code) {
    switch (code) {
      case ErrorCode.serverError:
        return 'Server error';
      default:
        return 'Something went wrong';
    }
  }
}

class MyError {
  final ErrorCode code;
  final dynamic originError;

  MyError({required this.code, this.originError});
}
