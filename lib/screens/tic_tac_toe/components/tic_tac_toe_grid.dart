import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_games/bloc/check_win_bloc/check_win_cubit.dart';
import 'package:mini_games/bloc/selectedShapeCubit/selected_shape_cubit.dart';
import 'package:mini_games/constants/enums.dart';
import 'package:mini_games/screens/tic_tac_toe/logic/logic.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TicTacToeGrid extends StatelessWidget {
  const TicTacToeGrid({
    super.key,
    required this.playerShape,
    required this.selectedGridIndex,
  });

  final Shapes playerShape;
  final int selectedGridIndex;
  @override
  Widget build(BuildContext context) {
    final shape = TicTacToeLogic.selectShape(playerShape: playerShape);
    final List<int> selectedIndicesList = [];
    List<int> checkWin = [];
    int x = -1;
    bool isWon = false;

    return Padding(
      padding: EdgeInsets.all(10.0.sp),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => InkWell(
            onTap: () {
              //check if waiting state and area is not selected
              if (context.read<SelectedShapeCubit>().state is! WaitingTurnState &&
                  !selectedIndicesList.contains(index)) {
                //check which grid is being played on
                x = selectedGridIndex;

                //add the index of the selected area
                selectedIndicesList.add(index);

                //create a map for the player with his selected areas
                checkWin = selectedIndicesList;
                Map<Shapes, List<int>> check = {
                  playerShape: checkWin,
                };

                //check the winner of the grid
                context
                    .read<CheckWinCubit>()
                    .checkWinner(playerShape: playerShape, index: selectedGridIndex, check: check);

                //Get index to change state
                context.read<SelectedShapeCubit>().getIndexEvent(index: index);
              }
            },
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.indigo)),
              child: BlocBuilder<SelectedShapeCubit, SelectedShapeState>(
                builder: (context, state) {
                  return Center(
                    child: selectedIndicesList.contains(index) && x == selectedGridIndex
                        ? Icon(shape)
                        : const SizedBox(),
                  );
                },
              ),
            )),
      ),
    );
  }
}
