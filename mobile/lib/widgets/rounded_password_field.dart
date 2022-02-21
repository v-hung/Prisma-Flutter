import 'package:flutter/material.dart';
import 'package:mobile/utils/config.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    Key? key,

    required this.hintText,
    this.icon = Icons.visibility,
    required this.onChanged,
    required this.validator
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final ValueChanged onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          hintText: "$hintText",
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none
        ),
      ),
    );
  }
}

