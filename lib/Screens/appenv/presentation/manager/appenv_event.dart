part of '../../../appenv/presentation/manager/appenv_bloc.dart';

abstract class AppEnvEvent extends Equatable {
  const AppEnvEvent();
}

class GetAppEnvEvent extends AppEnvEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SetAppEnvEvent extends AppEnvEvent{
  AppEnv appEnv;
  SetAppEnvEvent(this.appEnv);
  @override
  List<Object?> get props => [appEnv];
}