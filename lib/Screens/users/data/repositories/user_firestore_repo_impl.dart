import 'package:dartz/dartz.dart';
import 'package:untitled/core/error/failures.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/user_firestore_repo.dart';
import '../data_sources/user_firestore_datasource.dart';

class UserFireStoreRepositoryImpl implements UserFireStoreRepository {
  UserFireStoreDataSource fireStoreDataSourceImpl;

  UserFireStoreRepositoryImpl(this.fireStoreDataSourceImpl);

  @override
  Future<Either<Failure, List<AppUser>>> getUsers() async {
    try {
      final List<AppUser> listOfUsers =
          (await fireStoreDataSourceImpl.getUsers()).cast<AppUser>();
      return Right(listOfUsers);
    } catch (e) {
      return Left(ServerFailure());
    }
  }


}
