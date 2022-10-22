part of '../../../appenv/presentation/manager/appenv_bloc.dart';

abstract class AppEnvState extends Equatable {
  const AppEnvState();
}

class AppEnvInitial extends AppEnvState {
  @override
  List<Object> get props => [];
}
class AppEnvLoading extends AppEnvState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AppEnvLoaded extends AppEnvState {
  AppEnv appEnv;
  AppEnvLoaded(this.appEnv,);
  @override
  List<Object?> get props => [appEnv];
}


class ErrorAppEnvLoad extends AppEnvState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
