import 'package:arthurs_compendium_of_magic/screens/add-spell/components/add_spell_body.dart';
import 'package:flutter/material.dart';

class AddSpellScreen extends StatelessWidget {
  const AddSpellScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Spell 🤓'),
      ),
      body: const AddSpellBody(),
    );
  }
}