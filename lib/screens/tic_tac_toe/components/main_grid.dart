import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_games/bloc/check_win_bloc/check_win_cubit.dart';
import 'package:mini_games/constants/enums.dart';
import 'package:mini_games/methods/check_in_list.dart';
import 'package:mini_games/screens/tic_tac_toe/components/tic_tac_toe_grid.dart';
import 'package:mini_games/screens/tic_tac_toe/logic/logic.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainGrid extends StatelessWidget {
  const MainGrid({
    super.key,
    // required this.sideGrid,
  });

  // final Widget sideGrid;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(9.sp),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(child: BlocBuilder<CheckWinCubit, CheckWinState>(
            builder: (context, state) {
              return checkIfInList(mainList: [index], subList: state.winner.values.first)
                  ? Icon(TicTacToeLogic.selectShape(playerShape: state.winner.keys.first))
                  : TicTacToeGrid(playerShape: Shapes.cross, selectedGridIndex: index);
            },
          )),
        ),
      ),
    );
  }
}
