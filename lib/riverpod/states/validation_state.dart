import 'package:flutter/cupertino.dart';

class ValidationState {
  AutovalidateMode? autoValidateMode;

  ValidationState({this.autoValidateMode});

  ValidationState copyWith({
    AutovalidateMode? autoValidateMode,
  }) =>
      ValidationState(
          autoValidateMode: autoValidateMode ?? this.autoValidateMode);
}
