import 'package:flutter/material.dart';

class FieldText extends StatelessWidget {
  final String hint;
  final String label;
  final TextInputType inputType;

  FieldText({@required this.hint, @required this.label, this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType != null ? inputType : null,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
      ),
    );
  }
}
