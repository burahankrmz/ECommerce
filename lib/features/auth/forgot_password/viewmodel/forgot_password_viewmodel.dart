import 'dart:async';

import 'package:ecommerce/core/init/base/base_viewmodel.dart';
import 'package:ecommerce/core/init/functions/functions.dart';
import 'package:ecommerce/features/auth/forgot_password/services/forgot_password_usecase.dart';
import 'package:ecommerce/features/state/state_renderer.dart';
import 'package:ecommerce/features/state/state_renderer.impl.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  final ForgotPasswordUseCase _forgotPasswordUseCase;
  ForgotPasswordViewModel(this._forgotPasswordUseCase);
  var email = "";
  @override
  void init() {
    inputState.add(ContentState());
  }

  @override
  forgotPassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await _forgotPasswordUseCase.execute(ForgotPasswordUseCaseInput(email)))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.POPUP_ERROR_STATE, failure.message))
                },
            (data) => {inputState.add(SuccessState(data))});
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;
  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }

  _isAllInputValid() {
    return isEmailValid(email);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  @override
  void dispose() {
    _emailStreamController.close();
  }

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream
          .map((evisAllInputValident) => _isAllInputValid());
}

abstract class ForgotPasswordViewModelInputs {
  setEmail(String email);
  forgotPassword();
  Sink get inputEmail;
  Sink get inputIsAllInputValid;
}

abstract class ForgotPasswordViewModelOutputs {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsAllInputValid;
}
