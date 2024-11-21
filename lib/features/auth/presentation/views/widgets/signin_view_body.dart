import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/core/utils/custom_widgets/build_error_bar.dart';
import 'package:screen_scene/core/utils/custom_widgets/custom_divider.dart';
import 'package:screen_scene/core/utils/custom_widgets/custom_social_button.dart';
import 'package:screen_scene/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'dont_have_an_account.dart';
import 'signin_form.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
        ),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const SigninForm(),
            const SizedBox(height: 36),
            const DontHaveAnAccount(),
            const SizedBox(height: 36),
            const CustomDivider(),
            const SizedBox(height: 24),
            CustomSocialButton(
              onPressed: () {
                context.read<SigninCubit>().signinUserWithGoogle();
              },
              title: 'Sign in with Google',
              image: 'assets/images/google_icon.svg',
            ),
            const SizedBox(height: 16),
            CustomSocialButton(
              onPressed: () {
                context.read<SigninCubit>().signinUserWithFacebook();
              },
              title: 'Sign in with Facebook',
              image: 'assets/images/facebook_icon.svg',
            ),
            const SizedBox(height: 16),
            CustomSocialButton(
              onPressed: () {
                // context.read<SigninCubit>().signinUserWithApple();
                buildErrorBar(
                  context,
                  'Sign in with Apple is not supported yet',
                );
              },
              title: 'Sign in with Apple',
              image: 'assets/images/appl_icon.svg',
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
