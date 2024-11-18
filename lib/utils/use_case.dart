import 'export.dart';

abstract interface class UseCase<SuccessType> {
  FutureOr<SuccessType> call();
}

abstract interface class ParamsUseCase<SuccessType, Params> {
  FutureOr<SuccessType> call(Params params);
}
