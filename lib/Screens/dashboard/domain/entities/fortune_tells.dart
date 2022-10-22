import 'package:equatable/equatable.dart';

class FortuneTells extends Equatable {
  DateTime? createDate;
  List<String>? flatCup;
  String? fortuneComment;
  Map<String, dynamic>? fortune_quest;
  List<String>? inCup;
  bool? isDone;
  String? userId;
  String? userEmail;
  String? fortuneId;
  String? notifContent;

  FortuneTells(
      {this.createDate,
      this.flatCup,
      this.fortuneComment,
      this.fortune_quest,
      this.inCup,
      this.isDone,
      this.notifContent,
      this.userId,
      this.userEmail,
      this.fortuneId});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
