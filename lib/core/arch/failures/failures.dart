abstract class Failure {}

class ServerFailure extends Failure {
  final int? code;

  ServerFailure(this.code);
}

class ServerFailureWithMessage extends ServerFailure {
  final String message;

  ServerFailureWithMessage(
    int? code, 
    this.message,
  ) : super(code);
}
