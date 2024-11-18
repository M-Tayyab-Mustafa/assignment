import '../../export.dart';
part '_event.dart';
part '_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {}
}
