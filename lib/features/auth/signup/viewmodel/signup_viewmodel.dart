import 'dart:async';

import '../../../../core/init/base/base_viewmodel.dart';
import '../../../../core/init/functions/functions.dart';
import '../freezed_model/signup_freezed_model.dart';
import '../services/signup_usecase.dart';
import '../../../state/state_renderer.dart';
import '../../../state/state_renderer.impl.dart';

class SignUpViewModel extends BaseViewModel
    with SignUpViewModelInputs, SignUpViewModelOutputs {
  final StreamController _nameStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllValidStreamController =
      StreamController<void>.broadcast();
  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  var signUpObject = SignUpObject("", "", "");
  final SignUpUseCase _signUpUseCase;
  SignUpViewModel(this._signUpUseCase);

  @override
  void init() {
    inputState.add(ContentState());
  }

  @override
  signUp() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _signUpUseCase.execute(SignUpUseCaseInput(
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
  Stream<bool> get outputNameIsValid =>
      _nameStreamController.stream.map((name) => _isNameValid(name));
  @override
  Stream<String?> get outputName => outputNameIsValid
      .map((nameIsValid) => nameIsValid ? null : "Invalid Name");

  @override
  Stream<String?> get outputEmail => outputEmailIsValid
      .map((emailIsValid) => emailIsValid ? null : "Invalid Email");

  @override
  Stream<bool> get outputEmailIsValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));
  @override
  Stream<String?> get outputPassword => outputPasswordIsValid
      .map((passwordIsValid) => passwordIsValid ? null : "Invalid Password");
  @override
  Stream<bool> get outputPasswordIsValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));
  @override
  Stream<bool> get outputIsAllValid =>
      _isAllValidStreamController.stream.map((_) => _validateAllInputs());

  //? set functions
  @override
  setName(String name) {
    inputName.add(name);
    if (_isNameValid(name)) {
      signUpObject = signUpObject.copyWith(name: name);
    } else {
      signUpObject = signUpObject.copyWith(name: "");
    }
    _validate();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (isEmailValid(email)) {
      signUpObject = signUpObject.copyWith(email: email);
    } else {
      signUpObject.copyWith(email: email);
    }
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      signUpObject = signUpObject.copyWith(password: password);
    } else {
      signUpObject = signUpObject.copyWith(password: "");
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

  //? DISPOSE
  @override
  void dispose() {
    _nameStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _isAllValidStreamController.close();
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
  signUp();
}

abstract class SignUpViewModelOutputs {
  Stream<String?> get outputName;
  Stream<bool> get outputNameIsValid;
  Stream<String?> get outputEmail;
  Stream<bool> get outputEmailIsValid;
  Stream<String?> get outputPassword;
  Stream<bool> get outputPasswordIsValid;
  Stream<bool> get outputIsAllValid;
}
