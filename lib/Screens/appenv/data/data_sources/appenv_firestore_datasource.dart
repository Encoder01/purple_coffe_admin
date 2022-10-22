
import 'package:untitled/Screens/appenv/data/models/app_env_model.dart';
abstract class AppEnvFireStoreDataSource {

  Future<AppEnvModel> getAppEnv();

  Future<AppEnvModel> setAppEnv(AppEnvModel appEnv);

}
