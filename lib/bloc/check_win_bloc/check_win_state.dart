part of 'check_win_cubit.dart';

@immutable
abstract class CheckWinState {
  final Map<Shapes, List<int>> winner;

  const CheckWinState({required this.winner});
}

class CheckWinInitial extends CheckWinState {
  const CheckWinInitial({required super.winner});
}

class CheckIfWinState extends CheckWinState {
  const CheckIfWinState({required super.winner});
}
