import 'package:dartz/dartz.dart';
import 'package:untitled/Screens/dashboard/data/data_sources/firestore_datasource.dart';
import 'package:untitled/Screens/dashboard/data/models/fortune_tells_model.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';
import 'package:untitled/Screens/dashboard/domain/repositories/firestore_repo.dart';
import 'package:untitled/core/error/failures.dart';

class FireStoreRepositoryImpl implements FireStoreRepository {
  FireStoreDataSource fireStoreDataSourceImpl;

  FireStoreRepositoryImpl(this.fireStoreDataSourceImpl);

  @override
  Future<Either<Failure, List<FortuneTells>>> getFortunes() async {
    try {
      final List<FortuneTells> listOfFortunes =
          (await fireStoreDataSourceImpl.getFortunes()).cast<FortuneTells>();
      return Right(listOfFortunes);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<FortuneTells>>> setFortune(
      FortuneTells fortuneParams) async {
    try {
      final listOfFortunes = await fireStoreDataSourceImpl.setFortune(
          FortuneTellsModel(
              fortuneId: fortuneParams.fortuneId!,
              createDate: fortuneParams.createDate!,
              flatCup: fortuneParams.flatCup!,
              fortune_quest: fortuneParams.fortune_quest!,
              fortuneComment: fortuneParams.fortuneComment!,
              notifContent: fortuneParams.notifContent,
              userEmail: fortuneParams.userEmail,
              inCup: fortuneParams.inCup!,
              isDone: fortuneParams.isDone!,
              userId: fortuneParams.userId!));
      return Right(listOfFortunes);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<FortuneTells>>> getFortunesByUser(
      String userId) async {
    try {
      final List<FortuneTells> listOfFortunes =
          await fireStoreDataSourceImpl.getFortunesByUser(userId);
      return Right(listOfFortunes);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
