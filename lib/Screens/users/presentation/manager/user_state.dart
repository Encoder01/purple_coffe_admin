part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}


class UserLoading extends UserState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UserLoaded extends UserState {
  List<AppUser> profileUsers;

  UserLoaded(this.profileUsers,);

  @override
  List<Object?> get props => [profileUsers];
}



class ErrorUserLoad extends UserState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
