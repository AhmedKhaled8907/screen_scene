import 'package:flutter/material.dart';

import '../../../../../core/global/resources/values_manager.dart';
import 'settings_card_section.dart';
import 'signout_button.dart';
import 'theme_switch_tile.dart';
import 'user_info_page.dart';

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
                SizedBox(height: 8),
                ThemeSwitchTile(),
                SizedBox(height: 8),
                SettingsCardsSection(),
                SizedBox(height: 8),
                SignoutButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
