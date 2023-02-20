import 'package:the_weather/domain/core/failures.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueErrors extends Error {
  final Failure valueFailure;

  UnexpectedValueErrors(this.valueFailure);

  @override
  String toString() {
    const String exxplanation =
        'Encountered a ValueFailure at an unrecoverable point. Termination.';
    return Error.safeToString("$exxplanation Failure was: $valueFailure");
  }
}
