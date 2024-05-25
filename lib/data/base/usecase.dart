import 'package:great_form/data/base/either.dart';
import 'package:great_form/data/base/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params? params);
}
