import 'package:flutter/material.dart';
import 'package:mobile/utils/config.dart';
import 'package:mobile/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,

    required this.hintText,
    this.icon = Icons.person,
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
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
          hintText: "$hintText"
        ),
      ),
    );
  }
}
