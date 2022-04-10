import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:arthurs_compendium_of_magic/screens/spellbook/components/spellbook_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpellbookScreen extends StatelessWidget {
  const SpellbookScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spellbook'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.plus),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const SpellbookBody(),
      floatingActionButton: const FabMenu(),
    );
  }
}