part of 'user_fortune_bloc.dart';

abstract class UserFortuneState extends Equatable {
  const UserFortuneState();
}

class UserFortuneInitial extends UserFortuneState {
  @override
  List<Object> get props => [];
}
class UserFortuneLoaded extends UserFortuneState {
  List<FortuneTells> userFortunes;
  UserFortuneLoaded(this.userFortunes,);
  @override
  List<Object?> get props => [userFortunes];
}
class UserFortuneLoading extends UserFortuneState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ErrorUserFortuneLoad extends UserFortuneState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
