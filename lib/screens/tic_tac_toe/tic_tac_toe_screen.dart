import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_games/bloc/check_win_bloc/check_win_cubit.dart';
import 'package:mini_games/methods/display_dialog.dart';
import 'package:mini_games/screens/tic_tac_toe/components/waiting_turn.dart';
import 'package:mini_games/screens/tic_tac_toe/logic/logic.dart';
import 'package:mini_games/widgets/app_bar_widget.dart';
import 'components/main_grid.dart';

class TicTacToeScreen extends StatelessWidget {
  const TicTacToeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(hasAction: false, title: 'Tic-Tac-Toe', centered: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const WaitingForTurn(),
          const MainGrid(),
          BlocListener<CheckWinCubit, CheckWinState>(
            listener: (context, state) {
              if (TicTacToeLogic.winCondition(
                  check: {state.winner.keys.first: state.winner.values.first})) {
                displayDialog(context: context);
              }
            },
            child: const SizedBox(),
          )
        ],
      ),
    );
  }
}
