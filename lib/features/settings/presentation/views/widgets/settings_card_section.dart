import 'package:flutter/material.dart';

import 'settings_card.dart';

class SettingsCardsSection extends StatelessWidget {
  const SettingsCardsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsCard(
          title: 'Favorites',
          onTap: () {},
        ),
        SizedBox(height: 8),
        SettingsCard(
          title: 'Help',
          onTap: () {},
        ),
        SizedBox(height: 8),
        SettingsCard(
          title: 'Terms & Conditions',
          onTap: () {},
        ),
        SizedBox(height: 8),
        SettingsCard(
          title: 'Support',
          onTap: () {},
        ),
      ],
    );
  }
}
