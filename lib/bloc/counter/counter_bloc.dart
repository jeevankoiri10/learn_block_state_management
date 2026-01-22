import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // 'state' variable of the CounterState is avalable throghout this block.
  CounterBloc() : super(CounterState()) {
    // pass the initial state of the bloc inside super()

    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);

    // this on should be inside the super constructor
  }

  void _increment(IncrementEvent event, Emitter<CounterState> emit) {
    // this is where state is used;

    emit(state.copyWith(count: state.count + 1));
  }

  void _decrement(DecrementEvent event, Emitter<CounterState> emit) {
    // this is the place to decrement the state
    emit(state.copyWith(count: state.count - 1));
  }
}
