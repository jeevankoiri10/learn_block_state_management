import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test/bloc/toggle/toggle_event.dart';
import 'package:test/bloc/toggle/toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc() : super(ToggleState(isFavorited: false)) {
    on<ToggleButtonEvent>(_toggle);
  }

  void _toggle(ToggleEvent event, Emitter emit) {
    //toggle this value to another value
    emit(state.copyWith(isFavorited: !state.isFavorited));
  }
}
