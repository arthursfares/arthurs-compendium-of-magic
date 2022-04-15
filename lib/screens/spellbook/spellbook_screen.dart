import 'package:arthurs_compendium_of_magic/models/spell_token_model.dart';
import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:arthurs_compendium_of_magic/screens/spellbook/components/spellbook_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpellbookScreen extends StatefulWidget {
  const SpellbookScreen({Key? key}) : super(key: key);

  @override
  State<SpellbookScreen> createState() => _SpellbookScreenState();
}

class _SpellbookScreenState extends State<SpellbookScreen> {
  List<SpellTokenModel> spells = [];

  addSpellToList(SpellTokenModel spell) {
    setState(() {
      spells.insert(spells.length, spell);
    });
  }

  @override
  Widget build(BuildContext context) {
    String spellcasterName =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: spellcasterName.characters.last != 's'
            ? Text('$spellcasterName\'s Spellbook')
            : Text('$spellcasterName\' Spellbook'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.plus),
              onPressed: () async {
                Navigator.pushNamed(context, 'spellbook-add').then(
                    (selectedSpell) =>
                        addSpellToList(selectedSpell as SpellTokenModel));
              },
            ),
          ),
        ],
      ),
      body: SpellbookBody(spells: spells),
      floatingActionButton: const FabMenu(),
    );
  }
}
