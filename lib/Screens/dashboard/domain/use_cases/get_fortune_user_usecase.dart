import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';
import 'package:untitled/Screens/dashboard/domain/repositories/firestore_repo.dart';
import 'package:untitled/core/error/failures.dart';
import 'package:untitled/core/usecase/usecase.dart';

class GetFortuneUserUseCase extends UseCase<List<FortuneTells>, GetFortuneUserParam> {
  final FireStoreRepository firestoreRepository;

  GetFortuneUserUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, List<FortuneTells>>> call(GetFortuneUserParam params) async {
    return  await firestoreRepository.getFortunesByUser(params.userId);
  }
}

class GetFortuneUserParam extends Equatable{
  String userId;
  GetFortuneUserParam(this.userId);

  @override
  List<Object?> get props =>[userId];
}
