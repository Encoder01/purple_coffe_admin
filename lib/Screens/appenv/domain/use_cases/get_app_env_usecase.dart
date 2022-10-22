import 'package:dartz/dartz.dart';
import 'package:untitled/Screens/appenv/domain/entities/app_env.dart';
import 'package:untitled/core/error/failures.dart';
import 'package:untitled/core/params/no_params.dart';
import 'package:untitled/core/usecase/usecase.dart';

import '../repositories/appenv_firestore_repo.dart';

class GetAppEnvUseCase extends UseCase<AppEnv, NoParams> {
  final AppEnvFireStoreRepository firestoreRepository;

  GetAppEnvUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure,AppEnv>> call(NoParams params) async {
    return  await firestoreRepository.getAppEnv();
  }
}

