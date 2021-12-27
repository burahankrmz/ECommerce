import 'package:cloud_firestore/cloud_firestore.dart';
import '../features/auth/forgot_password/services/forgot_password_usecase.dart';
import '../features/auth/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import '../features/main/home/services/usecase/home1_usecase.dart';
import '../features/main/home/viewmodel/home_page1_viewmodel.dart';
import '../repository/repository_impl.dart';
import '../features/auth/login/viewmodel/login_viewmodel.dart';
import '../features/auth/signup/viewmodel/signup_viewmodel.dart';
import '../core/init/network/data_source/remote_data_source.dart';
import '../core/init/network/networkinfo/network_info.dart';
import '../core/init/network/repository/repository.dart';
import '../core/init/network/services/firebase_services.dart';
import '../features/auth/login/services/login_usecase.dart';
import '../features/auth/signup/services/signup_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  //? shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //? app prefs instance
  instance.registerLazySingleton<AppPrefences>(() => AppPrefences(instance()));

  //? network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplementer());

  //? firebase auth instance
  instance.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  instance.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  //? firebase service
  instance.registerLazySingleton<FirebaseServices>(
      () => FirebaseServices(instance(), instance()));

  //? remote data source instance
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  //? repository instance
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));
}

initSignUpModule() {
  if (!GetIt.I.isRegistered<SignUpUseCase>()) {
    instance.registerFactory<SignUpUseCase>(() => SignUpUseCase(instance()));
    instance
        .registerFactory<SignUpViewModel>(() => SignUpViewModel(instance()));
  }
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomePage1ViewModel>(
        () => HomePage1ViewModel(instance()));
  }
}
