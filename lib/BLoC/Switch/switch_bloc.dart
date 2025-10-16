import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Switch/switch_events.dart';
import 'package:flutter_bloc_practice/BLoC/Switch/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<ChangeOpacity>(_changeOpacity);
  }

  void _enableOrDisableNotification(
    EnableOrDisableNotification event,
    Emitter<SwitchStates> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _changeOpacity(ChangeOpacity event, Emitter<SwitchStates> emit) {
    emit(state.copyWith(value: event.opacityValue));
  }
}
