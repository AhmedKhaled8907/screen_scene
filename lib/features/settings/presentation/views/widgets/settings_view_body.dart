import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/features/settings/presentation/views/widgets/settings_card_section.dart';
import 'package:screen_scene/features/settings/presentation/views/widgets/signout_button.dart';
import 'package:screen_scene/features/settings/presentation/views/widgets/theme_switch_tile.dart';
import 'package:screen_scene/features/settings/presentation/views/widgets/user_info_page.dart';


class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p20,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                UserInfoPage(),
                SizedBox(height: 16),
                ThemeSwitchTile(),
                SizedBox(height: 8),
                SettingsCardsSection(),
                SizedBox(height: 16),
                SignoutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


