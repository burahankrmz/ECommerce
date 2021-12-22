import 'dart:async';

import 'package:ecommerce/core/init/base/base_viewmodel.dart';
import 'package:ecommerce/core/init/functions/functions.dart';
import 'package:ecommerce/features/auth/signup/freezed_model/signup_freezed_model.dart';
import 'package:ecommerce/features/auth/signup/services/signup_usecase.dart';
import 'package:ecommerce/features/state/state_renderer.dart';
import 'package:ecommerce/features/state/state_renderer.impl.dart';

class SignUpViewModel extends BaseViewModel
    with SignUpViewModelInputs, SignUpViewModelOutputs {
  final StreamController _nameStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllValidStreamController =
      StreamController<bool>.broadcast();
  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  var signUpObject = SignUpObject("", "", "");
  final SingUpUseCase _singUpUseCase;
  SignUpViewModel(this._singUpUseCase);

  @override
  void init() {}

  @override
  singUp() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _singUpUseCase.execute(SingUpUsecaseInput(
            signUpObject.name, signUpObject.email, signUpObject.password)))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.POPUP_ERROR_STATE, failure.message))
                },
            (data) => {
                  inputState.add(ContentState()),
                  isUserLoggedInSuccessfullyStreamController.add(true)
                });
  }

  //? INPUTS
  @override
  Sink get inputName => _nameStreamController.sink;
  @override
  Sink get inputEmail => _emailStreamController.sink;
  @override
  Sink get inputPassword => _passwordStreamController.sink;
  @override
  Sink get inputAllIsValid => _isAllValidStreamController.sink;

  //? OUTPUTS
  @override
  Stream<String> get outputName =>
      _nameStreamController.stream.map((name) => setName(name));
  @override
  Stream<String> get outputEmail =>
      _emailStreamController.stream.map((email) => setEmail(email));
  @override
  Stream<String> get outputPassword =>
      _passwordStreamController.stream.map((password) => setPassword(password));
  @override
  Stream<bool> get outputIsAllValid => _isAllValidStreamController.stream.map((_) => _validateAllInputs());

  //? set functions
  @override
  setName(String name) {
    inputName.add(name);
    if (_isNameValid(name)) {
      signUpObject.copyWith(name: name);
    } else {
      signUpObject.copyWith(name: "");
    }
    _validate();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (isEmailValid(email)) {
      signUpObject.copyWith(email: email);
    } else {
      signUpObject.copyWith(email: email);
    }
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      signUpObject.copyWith(password: password);
    } else {
      signUpObject.copyWith(password: "");
    }
    _validate();
  }

  //? validate functions

  _validate() {
    inputAllIsValid.add(null);
  }

  bool _isNameValid(String name) {
    return name.length >= 3;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }

  bool _validateAllInputs() {
    return signUpObject.name.isNotEmpty &&
        signUpObject.email.isNotEmpty &&
        signUpObject.password.isNotEmpty;
  }

  @override
  void dispose() {
    _nameStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
  }
}

abstract class SignUpViewModelInputs {
  setName(String name);
  setEmail(String email);
  setPassword(String password);

  Sink get inputName;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputAllIsValid;
  singUp();
}

abstract class SignUpViewModelOutputs {
  Stream<String> get outputName;
  Stream<String> get outputEmail;
  Stream<String> get outputPassword;
  Stream<bool> get outputIsAllValid;
}
