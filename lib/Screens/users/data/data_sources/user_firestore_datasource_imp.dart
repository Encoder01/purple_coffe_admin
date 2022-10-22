import '../../../../core/constants/firebase.dart';
import '../models/user_model.dart';
import 'user_firestore_datasource.dart';

class UserFireStoreDataSourceImpl implements UserFireStoreDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final doc = await docUser.get();
      final fDoc = await docFal.get();
      final List<UserModel> userDocs = [];
      for (final element in doc.docs) {
        final List<String> userFalNotReadId = [];
        final List<String> userQuest = [];
        UserModel user = UserModel.fromJson(element.data());
        for (final felement in fDoc.docs) {
          for (final userelemetn in user.fTellId ?? [""]) {
            if (felement.id == userelemetn) {
              if (felement.data()["is_done"] as bool == false) {
                userFalNotReadId.add(felement.id);
                print(felement.id);
              }
              if (felement.data()["fortune_quest"]["quest"] as String !=
                      "null" &&
                  felement.data()["fortune_quest"]["quest"] as String ==
                      "null") {
                userQuest.add(felement.data()["fortune_quest"]["quest"]);
              }
            }
          }
        }
        user.fortuneNotReadId = userFalNotReadId;
        user.userQuest = userQuest;
        userDocs.add(user);
      }
      return userDocs;
    } on Exception catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
