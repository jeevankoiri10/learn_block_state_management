import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/slider/slider_event.dart';
import 'package:test/bloc/slider/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc()
    : super(
        SliderState(),
      ) // always super constructor (not a const constructor) has a body
      {
    // what things need to happen
    on<SlideEvent>(_changeOpacity);
  }

  void _changeOpacity(SlideEvent event, Emitter emit) {
    emit(state.copyWith(sliderValue: event.newValue));
  }
}
