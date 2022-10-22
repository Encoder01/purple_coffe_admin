
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Screens/dashboard/domain/entities/fortune_tells.dart';
import 'package:untitled/Screens/dashboard/domain/use_cases/get_fortune_user_usecase.dart';

part 'user_fortune_event.dart';
part 'user_fortune_state.dart';

class UserFortuneBloc extends Bloc<UserFortuneEvent, UserFortuneState> {
  GetFortuneUserUseCase getUserFortuneUseCase;

  UserFortuneBloc(this.getUserFortuneUseCase) : super(UserFortuneInitial()) {
    on<GetUserFortuneEvent>((event, emit) async {
      emit(UserFortuneLoading());
      final result = await getUserFortuneUseCase.call(GetFortuneUserParam(event.userId));
      result.fold((l) => emit(ErrorUserFortuneLoad()), (r) => emit(UserFortuneLoaded(r)));
    });
  }
}
