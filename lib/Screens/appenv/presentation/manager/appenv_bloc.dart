
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Screens/appenv/domain/use_cases/get_app_env_usecase.dart';
import 'package:untitled/Screens/appenv/domain/use_cases/set_app_env_usecase.dart';
import 'package:untitled/core/params/no_params.dart';

import '../../domain/entities/app_env.dart';

part 'appenv_event.dart';
part 'appenv_state.dart';

class AppEnvBloc extends Bloc<AppEnvEvent, AppEnvState> {
  GetAppEnvUseCase getAppEnvUseCase;
  SetAppEnvUseCase setAppEnvUseCase;

  AppEnvBloc(this.getAppEnvUseCase, this.setAppEnvUseCase)
      : super(AppEnvInitial()) {
    on<GetAppEnvEvent>((event, emit) async {
      emit(AppEnvLoading());
      final result = await getAppEnvUseCase.call(NoParams());
      result.fold((l) => emit(ErrorAppEnvLoad()), (r) => emit(AppEnvLoaded(r)));
    });
    on<SetAppEnvEvent>((event, emit) async {
      emit(AppEnvLoading());
      final result =
          await setAppEnvUseCase.call(AppEnvParams(getAppEnv: event.appEnv));
      result.fold((l) => emit(ErrorAppEnvLoad()), (r) => emit(AppEnvLoaded(r)));
    });
  }
}
