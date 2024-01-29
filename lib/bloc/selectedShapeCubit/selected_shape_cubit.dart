import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_games/constants/enums.dart';

part 'selected_shape_state.dart';

class SelectedShapeCubit extends Cubit<SelectedShapeState> {
  SelectedShapeCubit() : super(SelectedShapeInitial());

  getIndexEvent({required int index}) async {
    emit(SelectedIndexState(index: index));
    emit(WaitingTurnState(secondPlayerShape: Shapes.circle));
    await Future.delayed(const Duration(seconds: 1), () => emit(SelectedIndexState(index: index)));
  }
}
