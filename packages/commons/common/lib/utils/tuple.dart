//Return Tuple containing LEFT side which is an error and RIGHT side which is success
class Tuple<E, R> {
  late final _RightSide<R>? _rightSide;
  late final _LeftSide<E>? _leftSide;

  Tuple._({_LeftSide<E>? leftSide, _RightSide<R>? rightSide})
      : _leftSide = leftSide,
        _rightSide = rightSide;

  factory Tuple.right(R correct) {
    return Tuple._(
      leftSide: null,
      rightSide: _RightSide<R>(value: correct),
    );
  }

  factory Tuple.left(E error) {
    return Tuple._(
      leftSide: _LeftSide<E>(value: error),
      rightSide: null,
    );
  }

  bool isRight() => _rightSide != null;
  bool isLeft() => _leftSide != null;

  E get left {
    if (_leftSide == null) {
      throw Exception("LEFT_SIDE IS EMPTY");
    }
    return _leftSide!.left;
  }

  R get right {
    if (_rightSide == null) {
      throw Exception("RIGHT_SIDE IS EMPTY");
    }
    return _rightSide!.right;
  }
}

//SIDES of can be returned from the TUPLE
class _LeftSide<T> {
  final T _value;

  _LeftSide({required T value}) : _value = value;

  T get left => _value;
}

class _RightSide<T> {
  final T _value;

  _RightSide({required T value}) : _value = value;

  T get right => _value;
}
