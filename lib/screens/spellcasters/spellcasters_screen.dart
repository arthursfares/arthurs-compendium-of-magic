import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:flutter/material.dart';

class SpellcastersScreen extends StatelessWidget {
  const SpellcastersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: FabMenu(),
    );
  }
}
