

import 'package:bloc/bloc.dart';
import 'package:new_machine_test/domain/repositories/repository.dart';
import 'package:new_machine_test/presentation/event.dart';
import 'package:new_machine_test/presentation/state.dart';

class StartScreenBloc extends Bloc<StartScreenEvent, StartScreenState> {
  StartScreenBloc() : super(EmployeeInitialState()) {
    on<StartScreenEvent>((event, emit) async {
      emit(EmployeeLoadingState());
      try {
        if (event is FetchEmployeeEvent) {
          var employeeScreen = await Repository().getEmployees();
          emit(EmployeeLoadedState(employeeScreen: employeeScreen));
        }
      } catch (e) {
        emit(EmployeeErrorState(message: e.toString()));
      }
    });
  }
}
