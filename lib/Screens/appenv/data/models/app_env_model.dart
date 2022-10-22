import 'package:untitled/Screens/appenv/domain/entities/app_env.dart';

class AppEnvModel extends AppEnv {
  AppEnvModel({
    int? dailyFortune,
    int? busyFortuneTime,
    int? fortuneTime,
    int? helpChar,
    int? readedDailyFortune,
  }) : super(
            dailyFortune: dailyFortune,
            busyFortuneTime: busyFortuneTime,
            fortuneTime: fortuneTime,
            helpChar: helpChar,
            readedDailyFortune: readedDailyFortune);

  AppEnvModel.fromJson(Map<String, dynamic> json) {
    dailyFortune = json['daily_fortune'] as int;
    busyFortuneTime = json['busy_fortune_time'] as int;
    fortuneTime = json['fortune_time'] as int;
    helpChar = json['help_char'] as int;
    readedDailyFortune = json['readed_daily_fortune'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['daily_fortune'] = dailyFortune!;
    json['busy_fortune_time'] = busyFortuneTime!;
    json['fortune_time'] = fortuneTime!;
    json['help_char'] = helpChar!;
    json['readed_daily_fortune'] = readedDailyFortune!;
    return json;
  }

  AppEnv create() {
    return AppEnv(
        readedDailyFortune: readedDailyFortune,
        helpChar: helpChar,
        fortuneTime: fortuneTime,
        dailyFortune: dailyFortune,
        busyFortuneTime: busyFortuneTime);
  }
}
