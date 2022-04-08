import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcasters_body.dart';
import 'package:flutter/material.dart';

class SpellcastersScreen extends StatelessWidget {
  const SpellcastersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spellcasters'),
      ),
      body: const SpellcastersBody(),
      floatingActionButton: const FabMenu(),
    );
  }
}
