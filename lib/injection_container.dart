import 'package:get_it/get_it.dart';
import 'package:untitled/Screens/dashboard/data/data_sources/firestore_datasource.dart';
import 'package:untitled/Screens/dashboard/data/data_sources/firestore_datasource_imp.dart';
import 'package:untitled/Screens/dashboard/data/repositories/firestore_repo_impl.dart';
import 'package:untitled/Screens/dashboard/domain/repositories/firestore_repo.dart';
import 'package:untitled/Screens/appenv/domain/use_cases/get_app_env_usecase.dart';
import 'package:untitled/Screens/dashboard/domain/use_cases/get_fortune_usecase.dart';
import 'package:untitled/Screens/dashboard/domain/use_cases/get_fortune_user_usecase.dart';
import 'package:untitled/Screens/users/domain/use_cases/get_user_usecase.dart';
import 'package:untitled/Screens/appenv/domain/use_cases/set_app_env_usecase.dart';
import 'package:untitled/Screens/dashboard/domain/use_cases/set_fortune_usecase.dart';

import 'Screens/appenv/data/data_sources/appenv_firestore_datasource.dart';
import 'Screens/appenv/data/data_sources/appenv_firestore_datasource_imp.dart';
import 'Screens/appenv/data/repositories/appenv_firestore_repo_impl.dart';
import 'Screens/appenv/domain/repositories/appenv_firestore_repo.dart';
import 'Screens/users/data/data_sources/user_firestore_datasource.dart';
import 'Screens/users/data/data_sources/user_firestore_datasource_imp.dart';
import 'Screens/users/data/repositories/user_firestore_repo_impl.dart';
import 'Screens/users/domain/repositories/user_firestore_repo.dart';


final serviceLocator = GetIt.instance;

Future<void> init() async {
  initInjections(serviceLocator);
}

void initInjections(GetIt serviceLocator) {
  serviceLocator.registerSingleton<FireStoreDataSource>(
    FireStoreDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<FireStoreRepository>(
        () => FireStoreRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerSingleton<AppEnvFireStoreDataSource>(
    AppEnvFireStoreDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<AppEnvFireStoreRepository>(
        () => AppEnvFireStoreRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerSingleton<UserFireStoreDataSource>(
    UserFireStoreDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<UserFireStoreRepository>(
        () => UserFireStoreRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
        () => SetFortuneUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
        () => GetFortuneUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
        () => GetFortuneUserUseCase(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
        () => GetUserUseCase(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
        () => GetAppEnvUseCase(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
        () => SetAppEnvUseCase(
      serviceLocator(),
    ),
  );
}
