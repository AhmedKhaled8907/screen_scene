import 'package:flutter/material.dart';

import '../../global/theme/theme_bloc/theme_bloc.dart';
import 'custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.onSaved,
    required this.validator,
  });

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: widget.validator,
      obscureText: obscureText,
      onSaved: widget.onSaved,
      hintText: 'Password',
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: context.isDarkMode ? Color(0xffC9CECF) : Colors.black,
        ),
      ),
    );
  }
}
