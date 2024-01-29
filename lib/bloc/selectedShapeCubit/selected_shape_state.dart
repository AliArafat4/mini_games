part of 'selected_shape_cubit.dart';

@immutable
abstract class SelectedShapeState {}

class SelectedShapeInitial extends SelectedShapeState {}

class SelectedIndexState extends SelectedShapeState {
  final int index;

  SelectedIndexState({required this.index});
}

class WaitingTurnState extends SelectedShapeState {
  final Shapes secondPlayerShape;

  WaitingTurnState({required this.secondPlayerShape});
}
