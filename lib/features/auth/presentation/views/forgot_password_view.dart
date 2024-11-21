import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/core/utils/custom_widgets/app_validators.dart';
import 'package:screen_scene/core/utils/custom_widgets/build_app_bar.dart';
import 'package:screen_scene/core/utils/custom_widgets/custom_button.dart';
import 'package:screen_scene/core/utils/custom_widgets/custom_text_form_field.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String routeName = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Forgot Password',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
          ),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                'Don’t worry, just enter your phone number, and we’ll send a verification code.',
                style: getSemiBoldStyle(
                  fontSize: FontSize.s16,
                ),
              ),
              const SizedBox(height: 32),
              CustomTextFormField(
                validator: (value) {
                  return AppValidators.emailValidator(value);
                },
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 32),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                title: "Reset Password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
