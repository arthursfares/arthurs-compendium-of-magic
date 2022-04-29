import 'package:arthurs_compendium_of_magic/models/spell_token_model.dart';
import 'package:arthurs_compendium_of_magic/screens/spellbook-description/spellbook_description_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpellbookBody extends StatelessWidget {
  const SpellbookBody({
    Key? key,
    required this.spells,
  }) : super(key: key);

  final List<SpellTokenModel> spells;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
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
                                // remove spell from list 
                              },
                              flex: 1,
                              backgroundColor: Colors.redAccent.shade200,
                              foregroundColor: Colors.white,
                              icon: FontAwesomeIcons.trashCan,
                            ),
                          ],
                        ),
                        child: ListTile(
                          // tileColor: Color(0xFF161616),
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                                builder: (context) => SpellbookDescriptionScreen(
                                    spellIndex: spells[index].indexName),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        height: 2,
                        width: size.width / 1.2,
                        color: const Color(0xFF161616),
                        // color: index != spells.length - 1
                        //     ? Colors.white12
                        //     : const Color(0x00161616),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
