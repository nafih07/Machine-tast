import 'package:machine_test/riverpod/states/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidationService extends StateNotifier<ValidationState> {
  ValidationService()
      : super(ValidationState(autoValidateMode: AutovalidateMode.disabled));

  AutovalidateMode validateForm(GlobalKey<FormState>? key) {
    AutovalidateMode autoValidateMode;

    if (key!.currentState!.validate()) {
      key.currentState!.save();
      autoValidateMode = AutovalidateMode.disabled;
    } else {
      autoValidateMode = AutovalidateMode.always;
    }

    state = state.copyWith(autoValidateMode: autoValidateMode);
    return autoValidateMode;
  }

  void resetValidation() =>
      state = ValidationState(autoValidateMode: AutovalidateMode.disabled);
}
