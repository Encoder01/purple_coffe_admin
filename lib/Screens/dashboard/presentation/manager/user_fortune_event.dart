part of 'user_fortune_bloc.dart';

abstract class UserFortuneEvent extends Equatable {
  const UserFortuneEvent();
}
class GetUserFortuneEvent extends UserFortuneEvent{
  String userId;
  GetUserFortuneEvent(this.userId);
  @override
  List<Object?> get props => [userId];
}