import 'package:common/utils/value_objects/value_object.dart';

class Email implements ValueObject<String> {
  Email(this._value);

  String _value;

  String get value => _value;
  void set(String? val) => _value = val ?? '';

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Email cant be null!';
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_value)) {
      return 'Invalid Email!';
    }
    return null;
  }

  @override
  void call(String? value) => set(value);
}
