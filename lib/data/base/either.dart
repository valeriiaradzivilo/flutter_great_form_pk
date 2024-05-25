abstract class Either<L, R> {
  Either();

  bool get isLeft => this is Left<L, R>;
  bool get isRight => this is Right<L, R>;

  R getOrElse(R dflt) => isRight ? asRight() : dflt;

  L getOrElseGet(L Function() op) =>
      isRight ? throw UnimplementedError() : op();

  R asRight() => throw UnimplementedError();
  L asLeft() => throw UnimplementedError();

  @override
  String toString() => isLeft ? 'Left($this)' : 'Right($this)';
}

class Left<L, R> extends Either<L, R> {
  final L value;

  Left(this.value);

  @override
  R asRight() => throw StateError('Cannot get Right value from a Left');

  @override
  L asLeft() => value;

  @override
  String toString() => 'Left($value)';
}

class Right<L, R> extends Either<L, R> {
  final R value;

  Right(this.value);

  @override
  R asRight() => value;

  @override
  L asLeft() => throw StateError('Cannot get Left value from a Right');

  @override
  String toString() => 'Right($value)';
}
