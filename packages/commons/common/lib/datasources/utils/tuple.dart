class Tuple<Error, Correct> {
  late final Correct? rightSide;
  late final Error? leftSide;

  Tuple({required this.leftSide, required this.rightSide});

  factory Tuple.right(Correct correct) {
    return Tuple(
      leftSide: null,
      rightSide: correct,
    );
  }

  factory Tuple.left(Error error) {
    return Tuple(
      leftSide: error,
      rightSide: null,
    );
  }

  bool isRight() => rightSide != null;
  bool isLeft() => leftSide != null;
}
