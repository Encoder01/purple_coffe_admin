import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  String? uid;
  String? name;
  String? email;
  String? sex;
  String? birthDate;
  List<String>? fTellId;
  List<String>? fortuneNotReadId;
  List<String>? userQuest;

  AppUser({
    this.uid,
    this.name,
    this.email,
    this.userQuest,
    this.sex,
    this.birthDate,
    this.fTellId,
    this.fortuneNotReadId = const [""],
  });

  @override
  List<Object> get props =>
      [uid!, name!, birthDate!, fTellId!, fortuneNotReadId!];
}
