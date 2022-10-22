import 'package:dartz/dartz.dart';
import 'package:untitled/Screens/appenv/data/data_sources/appenv_firestore_datasource.dart';
import 'package:untitled/Screens/appenv/data/models/app_env_model.dart';
import 'package:untitled/Screens/appenv/domain/entities/app_env.dart';
import 'package:untitled/Screens/appenv/domain/repositories/appenv_firestore_repo.dart';
import 'package:untitled/core/error/failures.dart';

class AppEnvFireStoreRepositoryImpl implements AppEnvFireStoreRepository {
  AppEnvFireStoreDataSource fireStoreDataSourceImpl;

  AppEnvFireStoreRepositoryImpl(this.fireStoreDataSourceImpl);

  @override
  Future<Either<Failure, AppEnv>> getAppEnv() async {
    try {
      final AppEnv appEnvModel = (await fireStoreDataSourceImpl.getAppEnv());
      return Right(appEnvModel);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppEnv>> setAppEnv(AppEnv appEnvParams) async {
    try {
      AppEnv appEnv = await fireStoreDataSourceImpl.setAppEnv(AppEnvModel(
        busyFortuneTime: appEnvParams.busyFortuneTime,
        dailyFortune: appEnvParams.dailyFortune,
        fortuneTime: appEnvParams.fortuneTime,
        helpChar: appEnvParams.helpChar,
        readedDailyFortune: appEnvParams.readedDailyFortune,
      ));
      return Right(appEnv);
    } catch (e) {
      return Left(ServerFailure());
    }
  }


}
