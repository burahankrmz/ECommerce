import 'dart:async';

import '../../../../core/init/base/base_viewmodel.dart';
import '../../../../core/init/functions/functions.dart';
import '../freezed_model/login_freezed_model.dart';
import '../services/login_usecase.dart';
import '../../../state/state_renderer.dart';
import '../../../state/state_renderer.impl.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _emailController =
      StreamController<String>.broadcast();
  final StreamController _passwordController =
      StreamController<String>.broadcast();
  final StreamController _isAllValid = StreamController<void>.broadcast();
  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  var loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  @override
  void init() {
    inputState.add(ContentState());
  }

  @override
  login() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.email, loginObject.password)))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.POPUP_ERROR_STATE, failure.message)),
                },
            (data) => {
                  inputState.add(ContentState()),
                  
                  isUserLoggedInSuccessfullyStreamController.add(true)
                });
  }

  //? INPUTS
  @override
  Sink get inputEmail => _emailController.sink;

  @override
  Sink get inputPassword => _passwordController.sink;

  @override
  Sink get inputIsAllValid => _isAllValid.sink;

  //? OUTPUTS
  @override
  Stream<String?> get outputEmail => outputEmailIsValid
      .map((emailIsValid) => emailIsValid ? null : "Invalid Email");

  @override
  Stream<bool> get outputEmailIsValid =>
      _emailController.stream.map((email) => isEmailValid(email));

  @override
  Stream<String?> get outputPassword => outputPasswordIsValid
      .map((passwordIsValid) => passwordIsValid ? null : "Invalid Password");

  @override
  Stream<bool> get outputPasswordIsValid =>
      _passwordController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsAllValid =>
      _isAllValid.stream.map((_) => _validateAllInputs());

  //? SET FUNCTIONS
  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (isEmailValid(email)) {
      loginObject = loginObject.copyWith(email: email);
    } else {
      loginObject = loginObject.copyWith(email: "");
    }
    _validate();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      loginObject = loginObject.copyWith(password: password);
    } else {
      loginObject = loginObject.copyWith(password: password);
    }
    _validate();
  }

  //? VALIDATE FUNCTIONS
  _validate() {
    _isAllValid.add(null);
  }

  _validateAllInputs() {
    return loginObject.email.isNotEmpty && loginObject.password.isNotEmpty;
  }

  _isPasswordValid(String password) {
    return password.length >= 6;
  }

  //?DISPOSE
  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _isAllValid.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }
}

abstract class LoginViewModelInputs {
  setEmail(String email);
  setPassword(String password);
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputIsAllValid;
  login();
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputEmailIsValid;
  Stream<String?> get outputEmail;
  Stream<bool> get outputPasswordIsValid;
  Stream<String?> get outputPassword;
  Stream<bool> get outputIsAllValid;
}
