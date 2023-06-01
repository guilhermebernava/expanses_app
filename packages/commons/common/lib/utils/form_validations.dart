import 'package:flutter/widgets.dart';

class FormValidations {
  static bool validateForm(GlobalKey<FormState> formKey) {
    final formState = formKey.currentState;

    if (formState == null) {
      return false;
    }

    if (!formState.validate()) {
      return false;
    }

    return true;
  }
}
