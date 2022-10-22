import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';

class FortuneTellsModel extends FortuneTells {
  FortuneTellsModel({
    String? fortuneId,
    DateTime? createDate,
    List<String>? flatCup,
    Map<String, dynamic>? fortune_quest,
    String? fortuneComment,
    String? notifContent,
    List<String>? inCup,
    bool? isDone,
    String? userId,
    String? userEmail,
  }) : super(
          userId: userId,
          isDone: isDone,
          inCup: inCup,
          userEmail: userEmail,
          fortuneId: fortuneId,
          fortuneComment: fortuneComment,
          fortune_quest: fortune_quest,
          flatCup: flatCup,
          notifContent: notifContent,
          createDate: createDate,
        );

  FortuneTellsModel.fromJson(Map<String, dynamic> json) {
    createDate = DateTime.fromMicrosecondsSinceEpoch(
        (json['create_date'] as Timestamp).microsecondsSinceEpoch);
    flatCup = json['flat_cup'].cast<String>() as List<String>;
    fortuneComment = json['fortune_comment'] as String;
    notifContent = json['fortune_notif'] as String;
    fortune_quest = json['fortune_quest'] as Map<String, dynamic>;
    inCup = json['in_cup'].cast<String>() as List<String>;
    isDone = json['is_done'] as bool;
    userId = json['user_id'] as String;
    fortuneId = json['fortune_id'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_date'] = createDate;
    data['flat_cup'] = flatCup;
    data['fortune_comment'] = fortuneComment;
    data['fortune_notif'] = notifContent;
    data['fortune_quest'] = fortune_quest;
    data['in_cup'] = inCup;
    data['is_done'] = isDone;
    data['user_id'] = userId;
    data['fortune_id'] = fortuneId;
    return data;
  }

  FortuneTells create() {
    return FortuneTells(
      createDate: createDate,
      flatCup: flatCup,
      fortune_quest: fortune_quest,
      fortuneComment: fortuneComment,
      fortuneId: fortuneId,
      inCup: inCup,
      notifContent: notifContent,
      isDone: isDone,
      userId: userId,
    );
  }
}
