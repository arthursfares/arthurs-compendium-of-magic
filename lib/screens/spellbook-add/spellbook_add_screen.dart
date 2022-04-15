import 'package:arthurs_compendium_of_magic/screens/spellbook-add/components/spellbook_add_body.dart';
import 'package:flutter/material.dart';

class SpellbookAddScreen extends StatelessWidget {
  const SpellbookAddScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Spell 🤓'),
      ),
      body: const SpellbookAddBody(),
    );
  }
}