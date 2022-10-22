import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';
import 'package:untitled/Screens/dashboard/domain/repositories/firestore_repo.dart';
import 'package:untitled/core/error/failures.dart';
import 'package:untitled/core/usecase/usecase.dart';

class SetFortuneUseCase extends UseCase<List<FortuneTells>, FortuneParams> {
  final FireStoreRepository firestoreRepository;

  SetFortuneUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, List<FortuneTells>>> call(FortuneParams params) async {
    return  await firestoreRepository.setFortune(params.getFortune);
  }
}

class FortuneParams extends Equatable{
  final FortuneTells getFortune;
  const FortuneParams({
    required this.getFortune,
  });
  @override
  List<Object?> get props => [getFortune];
}