import 'package:common/utils/value_objects/value_object.dart';

class Password implements ValueObject<String> {
  Password(this._value, {bool validatePassword = true})
      : _validatePassword = validatePassword;

  final bool _validatePassword;
  String _value;

  String get value => _value;
  void set(String? val) => _value = val ?? '';

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'Password cant be null!';
    }
    if (_validatePassword == false) {
      return null;
    }

    if (!RegExp(r'^(?=.*[0-9]+.*)(?=.*[a-z]+.*)(?=.*[A-Z]+.*)[0-9a-zA-Z]{6,}$')
        .hasMatch(_value)) {
      return 'Password';
    }
    return null;
  }

  @override
  void call(String? value) => set(value);
}
