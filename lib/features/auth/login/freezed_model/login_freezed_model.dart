import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_freezed_model.freezed.dart';


@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String email, String password) = _LoginObject;
}
