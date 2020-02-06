import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  AppText(this.label, this.hint, {this.password , this.controller, this.validator,
      this.keyboardType, this.textInputAction, this.focusNode, this.nextFocus});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password = false,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 22,
          color: Colors.grey,
        ),
        hintStyle: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
