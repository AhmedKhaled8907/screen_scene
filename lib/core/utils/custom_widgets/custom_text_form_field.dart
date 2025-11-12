import 'package:flutter/material.dart';

import '../../global/resources/colors_manager.dart';
import '../../global/resources/font_manager.dart';
import '../../global/resources/styles_manager.dart';
import '../../global/resources/values_manager.dart';
import '../../global/theme/theme_bloc/theme_bloc.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    required this.validator,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      style: getSemiBoldStyle(
        fontSize: FontSize.s16,
        color: context.isDarkMode ? AppColors.white : AppColors.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        errorStyle: getSemiBoldStyle(
          color: Colors.redAccent,
        ),
        hintText: hintText,
        hintStyle: getSemiBoldStyle(
          fontSize: FontSize.s13,
          color: context.isDarkMode ? AppColors.white : AppColors.black,
        ),
        filled: true,
        fillColor:
            context.isDarkMode ? AppColors.textFieldColor : AppColors.white,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: suffixIcon,
        ),
        enabledBorder: outline(context),
        focusedBorder: outline(context),
        errorBorder: outline(context),
        border: outline(context),
      ),
    );
  }

  OutlineInputBorder outline(BuildContext context) {
    return context.isDarkMode
        ? const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.s8),
            ),
          )
        : const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.s8),
            ),
            borderSide: BorderSide(
              color: Color(0xffE6E9EA),
            ),
          );
  }
}
