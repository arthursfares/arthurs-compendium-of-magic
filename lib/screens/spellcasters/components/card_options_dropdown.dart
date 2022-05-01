import 'dart:ui';

import 'package:arthurs_compendium_of_magic/models/spellcaster_list_model.dart';
import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters-add/spellcasters_add_screen.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardOptionsDropdown extends StatelessWidget {
  const CardOptionsDropdown({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<SpellcasterListModel>(
        builder: (context, spellcasterList, child) {
      return PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xFF161616),
        icon: const Icon(CommunityMaterialIcons.dots_horizontal, size: 33,),
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              value: 0,
              child: BackdropFilter(
                blendMode: BlendMode.src,
                filter: ImageFilter.blur(
                  sigmaX: 4,
                  sigmaY: 4,
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
                        color: Colors.red.shade800,
                        fontWeight: FontWeight.bold),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SpellcastersAddScreen(spellcaster: spellcasterList.spellcasters[index]))
            ).then((spellcaster) {
              spellcasterList.update(index, spellcaster as SpellcasterModel);
            });
          } else if (value == 1) {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => BackdropFilter(
                blendMode: BlendMode.src,
                filter: ImageFilter.blur(
                  sigmaX: 8,
                  sigmaY: 8,
                ),
                child: AlertDialog(
                  backgroundColor: const Color(0xFF161616),
                  title: const Text('Confirmation'),
                  content: const Text(
                      'Your about to delete a beloved character with unique magical knowlege and personal histories. \n\nAre you shure you want to continue?'),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        'DELETE',
                        style: TextStyle(color: Colors.red.shade800),
                      ),
                      onPressed: () {
                        spellcasterList.remove(index);
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
    });
  }
}
