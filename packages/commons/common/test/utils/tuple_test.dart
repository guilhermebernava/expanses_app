import 'package:common/utils/tuple.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('It should generate LEFT Tuple', () async {
    final left = Tuple.left(true);

    expect(left, isA<Tuple>());
    expect(left.isLeft(), true);
    expect(left.isRight(), false);
    expect(left.left, true);
  });

  test('It should generate RIGHT Tuple', () async {
    final left = Tuple.right(true);

    expect(left, isA<Tuple>());
    expect(left.isRight(), true);
    expect(left.isLeft(), false);
    expect(left.right, true);
  });
}
