

import 'package:untitled/Screens/appenv/data/models/app_env_model.dart';
import 'package:untitled/core/constants/firebase.dart';

import 'appenv_firestore_datasource.dart';

class AppEnvFireStoreDataSourceImpl implements AppEnvFireStoreDataSource {

  @override
  Future<AppEnvModel> getAppEnv() async {
    final doc = await docEnv.doc("ZmbSG2rsYqohKtNFA2vQ").get();
    AppEnvModel appEnv = AppEnvModel.fromJson(doc.data()!);
    return appEnv;
  }

  @override
  Future<AppEnvModel> setAppEnv(AppEnvModel appEnv) async {
    try {
      await docEnv.doc("ZmbSG2rsYqohKtNFA2vQ").set(appEnv.toJson());
      return appEnv;
    } on Exception catch (e) {
      throw e.toString();
    }
  }

}
