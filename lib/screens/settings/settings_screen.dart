import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:arthurs_compendium_of_magic/screens/settings/components/settings_body.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // removes shadow
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const SettingsBody(),
      floatingActionButton: const FabMenu(),
    );
  }
}