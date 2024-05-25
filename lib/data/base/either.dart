/// [Either] is a type that represents one of two possible values. An [Either] is either a [Left] or a [Right].
abstract class Either<L, R> {
  ///Check if the result is [Left] instance.
  bool get isLeft => this is Left<L, R>;

  ///Check if the result is [Right] instance.
  bool get isRight => this is Right<L, R>;

  /// Returns the value from this [Right] or `null` if this is a [Left].
  R asRight() => throw UnimplementedError();

  @override
  String toString() => isLeft ? 'Left($this)' : 'Right($this)';
}

/// Represents the left side of [Either] class which by convention is a "Failure".
class Left<L, R> extends Either<L, R> {
  /// The value of the left side.
  final L value;

  /// Create a [Left] instance with the provided value.
  Left(this.value);

  @override
  asRight() => throw Exception('Cannot call asRight on Left');

  @override
  String toString() => 'Left($value)';
}

/// Represents the right side of [Either] class which by convention is a "Success".
class Right<L, R> extends Either<L, R> {
  /// The value of the right side.
  final R value;

  /// Create a [Right] instance with the provided value.
  Right(this.value);

  @override
  asRight() => value;

  @override
  String toString() => 'Right($value)';
}
