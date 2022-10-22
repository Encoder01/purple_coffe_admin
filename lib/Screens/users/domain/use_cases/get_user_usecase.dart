import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_firestore_repo.dart';


class GetUserUseCase extends UseCase<List<AppUser>, NoParams> {
  final UserFireStoreRepository firestoreRepository;

  GetUserUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, List<AppUser>>> call(NoParams params) async {
    return  await firestoreRepository.getUsers();
  }
}

