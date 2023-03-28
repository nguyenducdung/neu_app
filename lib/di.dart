import 'package:get_it/get_it.dart';
import 'package:neu_app/network/api_repository.dart';
import 'package:neu_app/prefrence/local_repository.dart';
import 'package:neu_app/ui/login/login.dart';
import 'package:neu_app/ui/login_with_account/login_with_account.dart';
import 'package:neu_app/ui/splash/splash.dart';

final getIt = GetIt.instance;

void setupLocator() {
  //Repository
  getIt.registerLazySingleton(() => LocalRepository());
  getIt.registerLazySingleton(() => YouthNeuRepository());

  //View Model
  getIt.registerFactory(() =>
      LoginViewModel(getIt<LocalRepository>(), getIt<YouthNeuRepository>()));
  getIt.registerFactory(() => LoginWithAccountViewModel(
      getIt<LocalRepository>(), getIt<YouthNeuRepository>()));
  getIt.registerFactory(() =>
      SplashViewModel(getIt<LocalRepository>(), getIt<YouthNeuRepository>()));
}
