import 'package:arthurs_compendium_of_magic/models/spell_token_model.dart';
import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:arthurs_compendium_of_magic/screens/spellbook-description/spellbook_description_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpellbookScreen extends StatefulWidget {
  const SpellbookScreen({Key? key}) : super(key: key);

  @override
  State<SpellbookScreen> createState() => _SpellbookScreenState();
}

class _SpellbookScreenState extends State<SpellbookScreen> {
  // List<SpellTokenModel> spells = [];

  addSpellToFirestore(SpellTokenModel spell, BuildContext context) {
    String spellcasterName =
        ModalRoute.of(context)!.settings.arguments as String;
    FirebaseFirestore.instance.collection('spells').add({
      'active': true,
      'index': spell.indexName,
      'name': spell.name,
      'spellcasterName': spellcasterName,
      'userId': FirebaseAuth.instance.currentUser!.uid.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    String spellcasterName =
        ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context).size;

    var spellsQuery = FirebaseFirestore.instance
        .collection('spells')
        .where(
          'userId',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString(),
        )
        .where(
          'spellcasterName',
          isEqualTo: spellcasterName,
        )
        .where(
          'active',
          isEqualTo: true,
        );

    return StreamBuilder<QuerySnapshot>(
        stream: spellsQuery.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.green));
          } else {
            final spellsData = snapshot.requireData;
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                centerTitle: true,
                title: Center(
                    child: Text(
                  spellcasterName,
                  textAlign: TextAlign.center,
                )),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Space Quest',
                  letterSpacing: 1,
                  fontSize: 28,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.plus),
                      onPressed: () async {
                        Navigator.pushNamed(context, 'spellbook-add').then(
                          (selectedSpell) => addSpellToFirestore(
                              selectedSpell as SpellTokenModel, context),
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
                          itemCount: spellsData.size,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Slidable(
                                  key: Key(spellsData.docs[index]['name']),
                                  endActionPane: ActionPane(
                                    motion: const BehindMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed:
                                            (BuildContext context) async {
                                          // disable spellcaster document
                                          var collection = FirebaseFirestore
                                              .instance
                                              .collection('spells');
                                          var snapshot = await collection
                                              .where(
                                                'userId',
                                                isEqualTo: FirebaseAuth
                                                    .instance.currentUser!.uid
                                                    .toString(),
                                              )
                                              .where(
                                                'name',
                                                isEqualTo: spellsData
                                                    .docs[index]['name'],
                                              )
                                              .get();
                                          for (var doc in snapshot.docs) {
                                            await doc.reference.update({
                                              'active': false,
                                            });
                                          }
                                        },
                                        flex: 1,
                                        backgroundColor:
                                            Colors.redAccent.shade200,
                                        foregroundColor: Colors.white,
                                        icon: FontAwesomeIcons.trashCan,
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      spellsData.docs[index]['name'],
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
                                            spellIndex: spellsData.docs[index]
                                                ['index'],
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
        });
  }
}
