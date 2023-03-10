import 'package:bloc/bloc.dart';
import 'package:flutter_assignment/utils/util.dart';

import 'task_create_dialog_event.dart';
import 'task_create_dialog_state.dart';

class TaskCreateDialogBloc
    extends Bloc<TaskCreateDialogEvent, TaskCreateDialogState> {
  TaskCreateDialogBloc() : super(const CreateButtonState()) {
    on<CheckButtonState>(mapEventToState);
  }

  void mapEventToState(
      TaskCreateDialogEvent event, Emitter<TaskCreateDialogState> emit) async {
    if (event is CheckButtonState) {
      bool isValidate = Util.isStringNotNull(event.heading) &&
          Util.isStringNotNull(event.body) &&
          Util.isStringNotNull(event.memberList);
      emit(CreateButtonState(isEnable: isValidate));
    }
  }
}
