import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcasters_body_carousel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpellcastersScreen extends StatelessWidget {
  const SpellcastersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // removes shadow
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.plus),
              onPressed: () async {
                Navigator.pushNamed(context, 'spellcasters-add')
                    .then((newSpellcaster) async {
                  // add spellcaster to database
                  newSpellcaster = newSpellcaster as SpellcasterModel;
                  var collection =
                      FirebaseFirestore.instance.collection('spellcasters');
                  await collection.add(
                    {
                      'active': true,
                      'userId': FirebaseAuth.instance.currentUser!.uid.toString(),
                      'name': newSpellcaster.name,
                      'imageName': newSpellcaster.imageName,
                      'dndClass': newSpellcaster.dndClass,
                      'level': newSpellcaster.level,
                      'description': newSpellcaster.description,
                    },
                  );
                });
              },
            ),
          ),
        ],
      ),
      body: const SpellcastersBodyCarousel(),
      floatingActionButton: const FabMenu(),
    );
  }
}
