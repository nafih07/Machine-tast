
import 'package:machine_test/generated/l10n.dart';

class Validator {
  static String? validateEmptyString(String? value, String? error) {
    if (value == null ||
        value.isEmpty ||
        value.replaceAll(RegExp(r"\s+\b|\b\s"), "").isEmpty) {
      return error ??  "";
    }

    return null;
  }

  static String? validateEmail(String? value, String error) {
    if(value == null) return S.current.enter_your_email;
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.isEmpty || value.replaceAll(" ", "").isEmpty)
      return S.current.err_invalid_email;
    else if (!regExp.hasMatch(value)) return error;

    return null;
  }
}
