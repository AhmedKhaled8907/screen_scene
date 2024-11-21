import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/utils/custom_widgets/build_app_bar.dart';
import 'package:screen_scene/core/utils/services/services_locator.dart';
import 'package:screen_scene/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

import '../../domain/repos/auth_repo.dart';
import 'widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        sl<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'Sign up',
        ),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
