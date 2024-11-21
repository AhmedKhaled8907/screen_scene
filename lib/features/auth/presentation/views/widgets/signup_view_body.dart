import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/features/auth/presentation/views/widgets/have_an_account.dart';
import 'signup_form.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
        ),
        child: Column(
          children: [
            SizedBox(height: 24),
            SignupForm(),
            SizedBox(height: 24),
            HaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
