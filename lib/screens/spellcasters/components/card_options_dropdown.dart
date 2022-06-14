import 'dart:math';
import 'dart:ui';

import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters-add/spellcasters_add_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardOptionsDropdown extends StatelessWidget {
  const CardOptionsDropdown({
    Key? key,
    required this.spellcasterDoc,
  }) : super(key: key);

  final QueryDocumentSnapshot<Object?> spellcasterDoc;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: const Color(0xFF161616),
      icon: const Icon(
        CommunityMaterialIcons.dots_horizontal,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            value: 0,
            child: BackdropFilter(
              blendMode: BlendMode.src,
              filter: ImageFilter.blur(
                sigmaX: max(0.001, 4.0),
                sigmaY: max(0.001, 4.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Edit",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  FaIcon(
                    FontAwesomeIcons.wandMagicSparkles,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delete",
                  style: TextStyle(
                      color: Colors.red.shade800, fontWeight: FontWeight.bold),
                ),
                FaIcon(
                  FontAwesomeIcons.skullCrossbones,
                  size: 19,
                  color: Colors.red.shade800,
                )
              ],
            ),
          ),
        ];
      },
      onSelected: (value) async {
        if (value == 0) {
          // EDIT
          SpellcasterModel spellcasterFromDoc =
              SpellcasterModel.fromDoc(spellcasterDoc);
          print(spellcasterFromDoc);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SpellcastersAddScreen(spellcaster: spellcasterFromDoc),
            ),
          ).then(
            (spellcaster) async {
              // update value inside database
              var collection =
                  FirebaseFirestore.instance.collection('spellcasters');
              var snapshot = await collection
                  .where('name', isEqualTo: spellcasterDoc['name'])
                  .get();
              for (var doc in snapshot.docs) {
                await doc.reference.update(
                  {
                    'name': spellcaster.name,
                    'imageName': spellcaster.imageName,
                    'dndClass': spellcaster.dndClass,
                    'level': spellcaster.level,
                    'description': spellcaster.description,
                  },
                );
              }
            },
          );
        } else if (value == 1) {
          // DELETE
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => BackdropFilter(
              blendMode: BlendMode.src,
              filter: ImageFilter.blur(
                sigmaX: max(0.001, 8.0),
                sigmaY: max(0.001, 8.0),
              ),
              child: AlertDialog(
                backgroundColor: const Color(0xFF161616),
                title: const Text('Confirmation'),
                content: const Text(
                    'Your about to delete a beloved character with unique magical knowlege and personal histories. \n\nAre you sure you want to continue?'),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'DELETE',
                      style: TextStyle(color: Colors.red.shade800),
                    ),
                    onPressed: () async {
                      // disable spellcaster document
                      var collection =
                          FirebaseFirestore.instance.collection('spellcasters');
                      var snapshot = await collection
                          .where('name', isEqualTo: spellcasterDoc['name'])
                          .get();
                      for (var doc in snapshot.docs) {
                        await doc.reference.update({
                          'active': false,
                        });
                      }
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
