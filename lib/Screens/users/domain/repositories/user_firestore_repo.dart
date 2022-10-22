import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class UserFireStoreRepository {
  Future<Either<Failure, List<AppUser>>> getUsers();
}
