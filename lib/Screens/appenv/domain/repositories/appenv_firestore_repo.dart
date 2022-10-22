
import 'package:dartz/dartz.dart';
import 'package:untitled/Screens/appenv/domain/entities/app_env.dart';
import 'package:untitled/core/error/failures.dart';

abstract class AppEnvFireStoreRepository {

  Future<Either<Failure, AppEnv>> getAppEnv();

  Future<Either<Failure, AppEnv>> setAppEnv(AppEnv appEnv);

}
