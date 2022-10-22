import 'package:dartz/dartz.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';
import 'package:untitled/core/error/failures.dart';

abstract class FireStoreRepository {
  Future<Either<Failure, List<FortuneTells>>> getFortunes();

  Future<Either<Failure, List<FortuneTells>>> getFortunesByUser(String userId);

  Future<Either<Failure, List<FortuneTells>>> setFortune(FortuneTells fortuneTells);

}
