import 'package:great_form/data/base/either.dart';
import 'package:great_form/data/base/failure.dart';

/// Base class for use cases
abstract class UseCase<Type, Params> {
  /// Call method for use cases
  Future<Either<Failure, Type>> call(Params? params);
}
