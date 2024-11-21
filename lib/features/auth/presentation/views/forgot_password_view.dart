import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/core/utils/custom_widgets/app_validators.dart';
import 'package:screen_scene/core/utils/custom_widgets/build_app_bar.dart';
import 'package:screen_scene/core/utils/custom_widgets/build_error_bar.dart';
import 'package:screen_scene/core/utils/custom_widgets/custom_button.dart';
import 'package:screen_scene/core/utils/custom_widgets/custom_loading_hud.dart';
import 'package:screen_scene/core/utils/custom_widgets/custom_text_form_field.dart';
import 'package:screen_scene/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Forgot Password',
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Navigator.pop(context);
          buildErrorBar(
            context,
            "A verification code has been sent to your Email.",
          );
        }
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomLoadingHud(
          isLoading: state is SigninLoading ? true : false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Don’t worry, just enter your Email, and we’ll send a verification code.',
                      style: getSemiBoldStyle(
                        fontSize: FontSize.s16,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 32),
                    CustomTextFormField(
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        return AppValidators.emailValidator(value);
                      },
                      hintText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context
                              .read<SigninCubit>()
                              .resetPassword(email: email!);
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      title: "Reset Password",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
