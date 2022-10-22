import 'package:equatable/equatable.dart';

class AppEnv extends Equatable{
  int? dailyFortune;
  int? fortuneTime;
  int? helpChar;
  int? busyFortuneTime;
  int? readedDailyFortune;

  AppEnv({
    this.dailyFortune,
    this.busyFortuneTime,
    this.fortuneTime,
    this.helpChar,
    this.readedDailyFortune,
  });

  factory AppEnv.empty() {
    return AppEnv(
        busyFortuneTime: 96,
        dailyFortune: 8,
        fortuneTime: 48,
        helpChar: 300,
        readedDailyFortune: 0);
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
