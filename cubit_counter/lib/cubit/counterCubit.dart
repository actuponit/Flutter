import 'dart:async';
import 'package:bloc/bloc.dart';

enum CounterEventType { Increment, Decrement }

class CounterEvent {
  CounterEventType type;
  CounterEvent(this.type);

  bool isIncrement() {
    return type == CounterEventType.Increment;
  }

  bool isFetchEvent() {
    return type == CounterEventType.Decrement;
  }
}

class CounterBloc extends Bloc<CounterEvent, int> {
  int count = 0;
  CounterBloc() : super(0) {
    on<CounterEvent>(mapEventToState);
  }

  void mapEventToState(
    CounterEvent event,
    Emitter<int> emitter,
  ) async {
    if (event.isIncrement()) {
      print("Event Emmited");
      emitter(state + 1);
    } else {
      emitter(state - 1);
    }
  }
}
  // CounterCubit() : super(CounterState(counter: 0));
  // increment() => emit(CounterState(counter: state.counter + 1));
  // decrement() => emit(CounterState(counter: state.counter - 1));
