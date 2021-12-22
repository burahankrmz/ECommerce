import 'package:cloud_firestore/cloud_firestore.dart';
import '../core/init/network/data_source/remote_data_source.dart';
import '../core/init/network/networkinfo/network_info.dart';
import '../core/init/network/repository/repository.dart';
import '../core/init/network/services/firebase_services.dart';
import '../features/auth/login/services/login_usecase.dart';
import '../features/auth/signup/services/signup_usecase.dart';
import '../services/repository_impl.dart';
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
      () => FirebaseServices(instance()));

  //? remote data source instance
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  //? repository instance
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance()));

  //? registerusecase
  instance
      .registerLazySingleton<SingUpUseCase>(() => SingUpUseCase(instance()));

  //? loginusecase
  instance.registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));
}
