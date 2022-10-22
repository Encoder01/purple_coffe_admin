import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';
import 'package:untitled/Screens/dashboard/domain/use_cases/get_fortune_usecase.dart';
import 'package:untitled/Screens/dashboard/domain/use_cases/set_fortune_usecase.dart';
import 'package:untitled/core/params/no_params.dart';


part 'fortune_event.dart';

part 'fortune_state.dart';

class FortuneBloc extends Bloc<FortuneEvent, FortuneState> {
  SetFortuneUseCase setFortuneUseCase;
  GetFortuneUseCase getFortuneUseCase;

  FortuneBloc(this.getFortuneUseCase, this.setFortuneUseCase)
      : super(FortuneInitial()) {
    on<GetMyFortunes>((event, emit) async {
      emit(FortuneLoading());
      final result = await getFortuneUseCase
          .call( NoParams());
      result.fold(
            (failure) => emit(ErrorFortuneLoad()),
            (fortunes) => {
          emit(FortuneLoaded(fortunes,)),
        },
      );
    });
    on<SetFortunes>((event, emit) async {
      emit(FortuneLoading());
      final result = await setFortuneUseCase.call(FortuneParams(getFortune: event.setFortune));
      result.fold(
          (l) => emit(ErrorFortuneLoad()), (r) => emit(FortuneLoaded(r)));
    });
  }
}
