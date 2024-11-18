import '../../export.dart';
part '_event.dart';
part '_state.dart';

class CallerIDAppBloc extends Bloc<CallerIDAppEvent, CallerIDAppState> {
  CallerIDAppBloc() : super(const CallerIDAppState()) {}
}
