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
  NO_INTERNET_CONNECTION,
  // ignore: constant_identifier_names
  USER_DISABLED,
  // ignore: constant_identifier_names
  USER_NOT_FOUND,
  // ignore: constant_identifier_names
  WRONG_PASSWORD
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
    case "email-already-in-use":
      return DataSource.EMAIL_ALREADY_IN_USE.getFailure();
    case "invalid-email":
      return DataSource.INVALID_EMAIL.getFailure();
    case "operation-not-allowed":
      return DataSource.OPERATION_NOT_ALLOWED.getFailure();
    case "weak-password":
      return DataSource.WEAK_PASSWORD.getFailure();
    case "user-disabled":
      return DataSource.USER_DISABLED.getFailure();
    case "user-not-found":
      return DataSource.USER_NOT_FOUND.getFailure();
    case "wrong-password":
      return DataSource.WRONG_PASSWORD.getFailure();
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
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(AuthErrorCodes.NO_INTERNET_CONNECTION,
            AuthErrorMessages.NO_INTERNET_CONNECTION.tr());
      case DataSource.USER_DISABLED:
        return Failure(
            AuthErrorCodes.USER_DISABLED, AuthErrorMessages.USER_DISABLED.tr());
      case DataSource.USER_NOT_FOUND:
        return Failure(AuthErrorCodes.USER_NOT_FOUND,
            AuthErrorMessages.USER_NOT_FOUND.tr());
      case DataSource.WRONG_PASSWORD:
        return Failure(AuthErrorCodes.WRONG_PASSWORD,
            AuthErrorMessages.WRONG_PASSWORD.tr());
      default:
        return Failure(AuthErrorCodes.OPERATION_NOT_ALLOWED,
            AuthErrorMessages.OPERATION_NOT_ALLOWED.tr());
    }
  }
}

class AuthErrorCodes {
  //? REGISTER ERROR CODES
  // ignore: constant_identifier_names
  static const String EMAIL_ALREADY_IN_USE = "email-already-in-use";
  // ignore: constant_identifier_names
  static const String INVALID_EMAIL = "invalid-email";
  // ignore: constant_identifier_names
  static const String OPERATION_NOT_ALLOWED = "operation-not-allowed";
  // ignore: constant_identifier_names
  static const String WEAK_PASSWORD = "weak-password";
  //? NO CONNECTION ERROR CODE
  // ignore: constant_identifier_names
  static const String NO_INTERNET_CONNECTION = "no-connection";
  //? LOGIN ERROR MESSAGES
  // ignore: constant_identifier_names
  static const String USER_DISABLED = "user-disabled";
  // ignore: constant_identifier_names
  static const String USER_NOT_FOUND = "user-not-found";
  // ignore: constant_identifier_names
  static const String WRONG_PASSWORD = "wrong-password";
}

class AuthErrorMessages {
  //? REGISTER ERROR CODES
  // ignore: constant_identifier_names
  static const String EMAIL_ALREADY_IN_USE = AppStrings.emailAlreadyInUse;
  // ignore: constant_identifier_names
  static const String INVALID_EMAIL = AppStrings.invalidEmail;
  // ignore: constant_identifier_names
  static const String OPERATION_NOT_ALLOWED = AppStrings.operationNotAllowed;
  //? NO CONNECTION ERROR CODE
  // ignore: constant_identifier_names
  static const String WEAK_PASSWORD = AppStrings.weakPassword;
  // ignore: constant_identifier_names
  static const String NO_INTERNET_CONNECTION = AppStrings.noInternet;
  //? LOGIN ERROR MESSAGES
  // ignore: constant_identifier_names
  static const String USER_DISABLED = AppStrings.userDisabled;
  // ignore: constant_identifier_names
  static const String USER_NOT_FOUND = AppStrings.userNotFound;
  // ignore: constant_identifier_names
  static const String WRONG_PASSWORD = AppStrings.wrongPassword;
}
