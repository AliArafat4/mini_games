import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_games/bloc/selectedShapeCubit/selected_shape_cubit.dart';

class WaitingForTurn extends StatelessWidget {
  const WaitingForTurn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedShapeCubit, SelectedShapeState>(
      builder: (context, state) => state is WaitingTurnState
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("{Opponent} turn, Shape is ${state.secondPlayerShape.name}"),
                  const LinearProgressIndicator(),
                ],
              ),
            )
          : const Center(
              child: Text("Your turn"),
            ),
    );
  }
}
