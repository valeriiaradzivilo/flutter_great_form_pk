import 'package:great_form/base/either.dart';
import 'package:great_form/base/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params? params);
}
