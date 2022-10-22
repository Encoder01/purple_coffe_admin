import '../../domain/entities/user.dart';

class UserModel extends AppUser {
  UserModel({
    String? uid,
    String? name,
    String? email,
    List<String>? userQuest,
    String? sex,
    String? birthDate,
    List<String>? fTellId,
    List<String>? fortuneNotReadId=const [""],
  }) : super(
            uid: uid,
            sex: sex,
            name: name,
            fTellId: fTellId,
            email: email,
            userQuest: userQuest,
            birthDate: birthDate,
            fortuneNotReadId: fortuneNotReadId);

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['user_id'] as String;
    name = json['user_name'] as String;
    email = json['user_email'] as String;
    sex = json['user_sex'] as String;
    birthDate = json['user_birth_date'] as String;
    fTellId = json['user_fortune_id'].cast<String>() as List<String>;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = uid;
    data['user_name'] = name;
    data['user_email'] = email;
    data['user_sex'] = sex;
    data['user_birth_date'] = birthDate;
    data['user_fortune_id'] = fTellId;
    return data;
  }

  AppUser create() {
    return AppUser(
      birthDate: birthDate,
      email: email,
      fTellId: fTellId,
      name: name,
      sex: sex,
      uid: uid,
    );
  }
}
