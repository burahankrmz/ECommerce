import 'package:ecommerce/core/constants/strings/strings_manager.dart';
import 'package:ecommerce/core/init/network/failure/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';

enum DataSource {
  // ignore: constant_identifier_names
  EMAIL_ALREADY_IN_USE,
  // ignore: constant_identifier_names
  INVALID_EMAIL,
  // ignore: constant_identifier_names
  OPERATION_NOT_ALLOWED,
  // ignore: constant_identifier_names
  WEAK_PASSWORD,
  // ignore: constant_identifier_names
  NO_INTERNET_CONNECTION
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is FirebaseAuthException) {
      //? dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      //? default error
      failure = DataSource.OPERATION_NOT_ALLOWED.getFailure();
    }
  }
}

Failure _handleError(FirebaseAuthException error) {
  switch (error.code) {
    case "auth/email-already-in-use":
      return DataSource.EMAIL_ALREADY_IN_USE.getFailure();
    case "auth/invalid-email":
      return DataSource.EMAIL_ALREADY_IN_USE.getFailure();
    case "auth/operation-not-allowed":
      return DataSource.EMAIL_ALREADY_IN_USE.getFailure();
    case "auth/weak-password":
      return DataSource.EMAIL_ALREADY_IN_USE.getFailure();
    default:
      return DataSource.OPERATION_NOT_ALLOWED.getFailure();
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.EMAIL_ALREADY_IN_USE:
        return Failure(AuthErrorCodes.EMAIL_ALREADY_IN_USE,
            AuthErrorMessages.EMAIL_ALREADY_IN_USE.tr());
      case DataSource.INVALID_EMAIL:
        return Failure(
            AuthErrorCodes.INVALID_EMAIL, AuthErrorMessages.INVALID_EMAIL.tr());
      case DataSource.OPERATION_NOT_ALLOWED:
        return Failure(AuthErrorCodes.OPERATION_NOT_ALLOWED,
            AuthErrorMessages.OPERATION_NOT_ALLOWED.tr());
      case DataSource.WEAK_PASSWORD:
        return Failure(
            AuthErrorCodes.WEAK_PASSWORD, AuthErrorMessages.WEAK_PASSWORD.tr());
      default:
        return Failure(AuthErrorCodes.OPERATION_NOT_ALLOWED,
            AuthErrorMessages.OPERATION_NOT_ALLOWED.tr());
    }
  }
}

class AuthErrorCodes {
  // ignore: constant_identifier_names
  static const String EMAIL_ALREADY_IN_USE = "auth/email-already-in-use";
  // ignore: constant_identifier_names
  static const String INVALID_EMAIL = "auth/invalid-email";
  // ignore: constant_identifier_names
  static const String OPERATION_NOT_ALLOWED = "auth/operation-not-allowed";
  // ignore: constant_identifier_names
  static const String WEAK_PASSWORD = "auth/weak-password";
  // ignore: constant_identifier_names
  static const String NO_INTERNET_CONNECTION = "abc";
}

class AuthErrorMessages {
  // ignore: constant_identifier_names
  static const String EMAIL_ALREADY_IN_USE = AppStrings.emailAlreadyInUse;
  // ignore: constant_identifier_names
  static const String INVALID_EMAIL = AppStrings.emailAlreadyInUse;
  // ignore: constant_identifier_names
  static const String OPERATION_NOT_ALLOWED = AppStrings.emailAlreadyInUse;
  // ignore: constant_identifier_names
  static const String WEAK_PASSWORD = AppStrings.emailAlreadyInUse;
  // ignore: constant_identifier_names
  static const String NO_INTERNET_CONNECTION = AppStrings.emailAlreadyInUse;
}
