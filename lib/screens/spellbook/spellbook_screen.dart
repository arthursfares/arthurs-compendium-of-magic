import 'package:arthurs_compendium_of_magic/models/spell_token_model.dart';
import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:arthurs_compendium_of_magic/screens/spellbook-description/spellbook_description_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // removes shadow
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // title: spellcasterName.characters.last != 's'
        //     ? Text('$spellcasterName\'s Spellbook')
        //     : Text('$spellcasterName\' Spellbook'),
        centerTitle: true,
        title: Text(spellcasterName),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Space Quest',
          letterSpacing: 1,
          fontSize: 20,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.plus),
              onPressed: () async {
                Navigator.pushNamed(context, 'spellbook-add').then(
                  (selectedSpell) =>
                      addSpellToList(selectedSpell as SpellTokenModel),
                );
              },
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  reverse: false,
                  padding: const EdgeInsets.all(10),
                  itemCount: spells.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Slidable(
                          key: Key(spells[index].name),
                          endActionPane: ActionPane(
                            motion: const BehindMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (BuildContext context) {
                                  setState(() {
                                    spells.removeAt(index);
                                  });
                                },
                                flex: 1,
                                backgroundColor: Colors.redAccent.shade200,
                                foregroundColor: Colors.white,
                                icon: FontAwesomeIcons.trashCan,
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              spells[index].name,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SpellbookDescriptionScreen(
                                    spellIndex: spells[index].indexName,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const FabMenu(),
    );
  }
}
