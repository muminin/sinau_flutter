import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '59_counter_event.dart';
part '59_counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterState(0);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    yield (event is Increment)
        ? CounterState(state.value + 1)
        : CounterState(state.value - 1);
  }
}
