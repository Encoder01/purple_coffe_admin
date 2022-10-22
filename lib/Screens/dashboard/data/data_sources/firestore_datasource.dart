
import 'package:untitled/Screens/dashboard/data/models/fortune_tells_model.dart';
abstract class FireStoreDataSource {
  Future<List<FortuneTellsModel>> getFortunes();
  Future<List<FortuneTellsModel>> getFortunesByUser(String userId);

  Future<List<FortuneTellsModel>> setFortune(FortuneTellsModel fortuneParams);

}
