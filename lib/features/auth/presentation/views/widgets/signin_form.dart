import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/custom_widgets/app_validators.dart';
import '../../../../../core/utils/custom_widgets/custom_button.dart';
import '../../../../../core/utils/custom_widgets/custom_text_form_field.dart';
import '../../../../../core/utils/custom_widgets/password_field.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'forgot_password.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({
    super.key,
  });

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _formKey = GlobalKey<FormState>();
  var autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) {
              email = value!;
            },
            validator: (value) {
              return AppValidators.emailValidator(value);
            },
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          PasswordField(
            onSaved: (value) {
              password = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password cannot be empty.';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          const ForgotPasswordWidget(),
          const SizedBox(height: 36),
          CustomButton(
            title: 'Sign In',
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                context.read<SigninCubit>().loginUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
