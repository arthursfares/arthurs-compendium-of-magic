import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcasters_body_carousel.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcasters_body_list.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpellcastersScreen extends StatefulWidget {
  const SpellcastersScreen({Key? key}) : super(key: key);

  @override
  State<SpellcastersScreen> createState() => _SpellcastersScreenState();
}

class _SpellcastersScreenState extends State<SpellcastersScreen> {
  final List<bool> viewsToggleList = [true, false];
  List<SpellcasterModel> spellcasters = <SpellcasterModel>[];

  @override
  void initState() {
    super.initState();
    
    spellcasters.add(SpellcasterModel(
      'Nic Cage',
      const AssetImage('assets/images/nic-cage.png'),
      'Wizard',
      9,
      'I\'m going to steal the Declaration of Independence',
    ));
  }

  void addSpellcasterToList(String spellcasterName) {
    // setState(() {
    //   spellcasters.insert(
    //       spellcasters.length,
    //       SpellcasterModel(spellcasterName,
    //           const AssetImage('assets/images/anime-hamster.png')));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spellcasters'),
        actions: [
          ToggleButtons(
            children: const <Widget>[
              Icon(CommunityMaterialIcons.view_list),
              Icon(CommunityMaterialIcons.view_carousel),
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < viewsToggleList.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    viewsToggleList[buttonIndex] = true;
                  } else {
                    viewsToggleList[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: viewsToggleList,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.plus),
              onPressed: () async {
                Navigator.pushNamed(context, 'spellcasters-add').then(
                  (newSpellcasterName) =>
                      addSpellcasterToList(newSpellcasterName as String),
                );
              },
            ),
          ),
        ],
      ),
      body: viewsToggleList[0]
          ? SpellcastersBodyList(spellcasters: spellcasters)
          : SpellcastersBodyCarousel(spellcasters: spellcasters),
      floatingActionButton: const FabMenu(),
    );
  }
}
