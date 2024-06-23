import 'package:flutter/material.dart';
import 'package:movies_app/settings/presentation/views/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SettingsViewBody(),
      ),
    );
  }
}
