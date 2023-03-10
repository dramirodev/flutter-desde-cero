import 'package:flutter/material.dart';
import 'package:forms/pages/login.dart';

mixin LoginMixin on State<LoginPage> {
  String? emailValidator(String? value) {
    value ??= '';
    final isValid = RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value);

    return isValid ? null : 'Invalid Email';
  }

  String? passwordValidator(String? value) {
    value ??= '';
    value = value.replaceAll(' ', '');
    return value.length >= 8 ? null : 'Invalid Password';
  }

  String? checkboxValidator(bool? value){
    if(value == true){
      return null;
    }

    return 'Checkbox required';
  }
}
