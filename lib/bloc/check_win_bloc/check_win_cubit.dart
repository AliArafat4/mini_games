import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_games/constants/enums.dart';
import 'package:mini_games/screens/tic_tac_toe/logic/logic.dart';

part 'check_win_state.dart';

class CheckWinCubit extends Cubit<CheckWinState> {
  CheckWinCubit()
      : super(const CheckWinInitial(winner: {
          Shapes.triangle: [-1]
        }));

  final List<int> winningGrids = [];
  checkWinner({required Shapes playerShape, required int index, required check}) {
    if (TicTacToeLogic.winCondition(check: check)) {
      winningGrids.add(index);
      emit(CheckIfWinState(winner: {playerShape: winningGrids}));
    }
  }
}
