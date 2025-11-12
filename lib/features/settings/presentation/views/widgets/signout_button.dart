import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/global/resources/colors_manager.dart';
import '../../../../../core/global/resources/font_manager.dart';
import '../../../../../core/global/resources/styles_manager.dart';
import '../../../../../core/utils/custom_widgets/build_error_bar.dart';
import '../../../../../core/utils/custom_widgets/custom_loading_hud.dart';
import '../../../../auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import '../../../../auth/presentation/views/signin_view.dart';

class SignoutButton extends StatelessWidget {
  const SignoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SignoutSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const SigninView(),
            ),
          );
          buildErrorBar(context, 'Sign out successfully');
        }
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) => CustomLoadingHud(
        isLoading: state is SigninLoading ? true : false,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextButton(
              onPressed: () {
                context.read<SigninCubit>().signOut();
              },
              child: Text(
                'Sign Out',
                style: getSemiBoldStyle(
                  fontSize: FontSize.s20,
                  color: AppColors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
