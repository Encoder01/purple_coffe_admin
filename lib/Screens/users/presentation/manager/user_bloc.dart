import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/Screens/users/domain/use_cases/get_user_usecase.dart';
import 'package:untitled/core/params/no_params.dart';

import '../../domain/entities/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  GetUserUseCase getUserUseCase;
  UserBloc(this.getUserUseCase) : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(UserLoading());
      final result = await getUserUseCase.call(NoParams());
      result.fold((l) => emit(ErrorUserLoad()), (r) => emit(UserLoaded(r)));
    });

  }
}
