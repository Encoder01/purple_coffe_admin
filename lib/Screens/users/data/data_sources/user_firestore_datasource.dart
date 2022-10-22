
import '../models/user_model.dart';

abstract class UserFireStoreDataSource {
  Future<List<UserModel>> getUsers();

}
