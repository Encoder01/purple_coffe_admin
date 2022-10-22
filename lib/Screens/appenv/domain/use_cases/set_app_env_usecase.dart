import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Screens/appenv/domain/entities/app_env.dart';
import 'package:untitled/core/error/failures.dart';
import 'package:untitled/core/usecase/usecase.dart';

import '../repositories/appenv_firestore_repo.dart';

class SetAppEnvUseCase extends UseCase<AppEnv, AppEnvParams> {
  final AppEnvFireStoreRepository firestoreRepository;

  SetAppEnvUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure,AppEnv>> call(AppEnvParams params) async {
    return  await firestoreRepository.setAppEnv(params.getAppEnv);
  }
}
class AppEnvParams extends Equatable{
  final AppEnv getAppEnv;
  const AppEnvParams({
    required this.getAppEnv,
  });
  @override
  List<Object?> get props => [getAppEnv];
}