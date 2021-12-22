import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_freezed_model.freezed.dart';
@freezed
class SignUpObject with _$SignUpObject {
  factory SignUpObject(String name, String email, String password) =
      _SignUpObject;
}
