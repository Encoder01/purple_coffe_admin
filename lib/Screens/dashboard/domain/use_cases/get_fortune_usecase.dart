import 'package:dartz/dartz.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';
import 'package:untitled/Screens/dashboard/domain/repositories/firestore_repo.dart';
import 'package:untitled/core/params/no_params.dart';
import 'package:untitled/core/error/failures.dart';
import 'package:untitled/core/usecase/usecase.dart';

class GetFortuneUseCase extends UseCase<List<FortuneTells>, NoParams> {
  final FireStoreRepository firestoreRepository;

  GetFortuneUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, List<FortuneTells>>> call(NoParams params) async {
    return  await firestoreRepository.getFortunes();
  }
}

