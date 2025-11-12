import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/global/resources/colors_manager.dart';
import '../../../../../core/global/resources/styles_manager.dart';
import '../../../../../core/global/theme/theme_bloc/theme_bloc.dart';
import '../../../../../core/utils/services/services_locator.dart';
import '../../../domain/repos/auth_repo.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';

import '../forgot_password_view.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => SigninCubit(
                sl<AuthRepo>(),
              ),
              child: const ForgotPasswordView(),
            ),
          ),
        );
      },
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Text(
          'Forgot Password?',
          style: getSemiBoldStyle(
            color: context.isDarkMode ? AppColors.gold : AppColors.darkGold,
          ),
        ),
      ),
    );
  }
}
