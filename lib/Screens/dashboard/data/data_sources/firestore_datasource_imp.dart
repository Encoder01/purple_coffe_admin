
import 'package:untitled/Screens/dashboard/data/data_sources/firestore_datasource.dart';
import 'package:untitled/Screens/dashboard/data/models/fortune_tells_model.dart';
import 'package:untitled/core/constants/firebase.dart';


class FireStoreDataSourceImpl implements FireStoreDataSource {
  @override
  Future<List<FortuneTellsModel>> getFortunes() async {
    final List<FortuneTellsModel> fortuneDoc = [];
    final doc = await docFal.get();
    for (final element in doc.docs) {
      FortuneTellsModel fortuneTellsFrom =
          FortuneTellsModel.fromJson(element.data());
      final doc2 = await docUser.doc(fortuneTellsFrom.userId).get();
      fortuneTellsFrom.userEmail=doc2.data()!["user_email"];
      fortuneDoc.add(fortuneTellsFrom);
    }
    return fortuneDoc;
  }

  @override
  Future<List<FortuneTellsModel>> setFortune(
      FortuneTellsModel fortuneParams) async {
    try {
      final List<FortuneTellsModel> fortuneDoc = [];
      print(fortuneParams.notifContent);
      await docFal.doc(fortuneParams.fortuneId).set(fortuneParams.toJson());
      int fortuneIndex = fortuneDoc.indexWhere(
          (element) => element.fortuneId == fortuneParams.fortuneId);
      fortuneDoc[fortuneIndex] = fortuneParams;
      final doc2 = await docUser.doc(fortuneDoc[fortuneIndex].userId).get();
      fortuneDoc[fortuneIndex].userEmail=doc2.data()!["user_email"];
      return fortuneDoc;
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  @override
  Future<List<FortuneTellsModel>> getFortunesByUser(String userId) async {
    final List<FortuneTellsModel> fortuneDocByUser = [];
    final doc = await docFal.get();
    for (final element in doc.docs) {
      FortuneTellsModel fortuneTellsFrom =
          FortuneTellsModel.fromJson(element.data());
      fortuneTellsFrom.fortuneId = element.id;
      if (userId == fortuneTellsFrom.userId) {
        final doc2 = await docUser.doc(userId).get();
        fortuneTellsFrom.userEmail=doc2.data()!["user_email"];
        fortuneDocByUser.add(fortuneTellsFrom);
      }
    }
    return fortuneDocByUser;
  }
}
