import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/global/resources/strings_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/utils/services/services_locator.dart';
import 'package:screen_scene/features/auth/domain/repos/auth_repo.dart';
import 'package:screen_scene/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:screen_scene/features/settings/presentation/display_user_info_cubit/display_user_info_cubit.dart';
import 'package:screen_scene/features/settings/presentation/views/widgets/settings_view_body.dart';

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
