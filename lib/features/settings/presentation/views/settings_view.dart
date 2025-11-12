import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global/resources/strings_manager.dart';
import '../../../../core/global/resources/styles_manager.dart';
import '../../../../core/utils/services/services_locator.dart';
import '../../../auth/domain/repos/auth_repo.dart';
import '../../../auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import '../display_user_info_cubit/display_user_info_cubit.dart';
import 'widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppString.settingsNav,
            style: getBoldStyle(),
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SigninCubit(
                sl<AuthRepo>(),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  sl<DisplayUserInfoCubit>()..displayUserInfo(),
            ),
          ],
          child: const SettingsViewBody(),
        ),
      ),
    );
  }
}
