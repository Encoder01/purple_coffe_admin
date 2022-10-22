part of 'fortune_bloc.dart';

abstract class FortuneEvent extends Equatable {
  const FortuneEvent();
}

class GetMyFortunes extends FortuneEvent{
  const GetMyFortunes( );
  @override
  List<Object?> get props => [];
}

class SetFortunes extends FortuneEvent{
  FortuneTells setFortune;
  SetFortunes(this.setFortune,);
  @override
  List<Object?> get props => [setFortune];
}