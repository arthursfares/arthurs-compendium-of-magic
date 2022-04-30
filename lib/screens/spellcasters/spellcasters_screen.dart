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
  final List<bool> viewsToggleList = [false, true];
  List<SpellcasterModel> spellcasters = <SpellcasterModel>[];

  @override
  void initState() {
    super.initState();

    spellcasters.add(SpellcasterModel(
      'Nick Cage',
      Image.asset('assets/images/nic-cage.png'),
      'Wizard',
      19,
      'I\'m going to steal the Declaration of Independence',
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // removes shadow
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0, right: size.width / 4),
            child: ToggleButtons(
              fillColor: Colors.purple.shade300.withOpacity(0),
              selectedColor: Colors.purpleAccent.shade700,
              color: Colors.grey.shade400,
              renderBorder: false,
              children: const <Widget>[
                Icon(CommunityMaterialIcons.view_list, size: 33),
                Icon(CommunityMaterialIcons.view_carousel, size: 33),
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
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.plus),
              onPressed: () async {
                Navigator.pushNamed(context, 'spellcasters-add')
                    .then((newSpellcaster) {
                  setState(() {
                    spellcasters.add(newSpellcaster as SpellcasterModel);
                  });
                });
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
