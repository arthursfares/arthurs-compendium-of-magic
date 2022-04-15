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

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    spellcasters.insert(spellcasters.length, SpellcasterModel('Larry Bird', const AssetImage('assets/images/larry-bird.png')));
    spellcasters.insert(spellcasters.length, SpellcasterModel('Victor', const AssetImage('assets/images/victor.png')));
    spellcasters.insert(spellcasters.length, SpellcasterModel('Tim', const AssetImage('assets/images/tim.png')));
    spellcasters.insert(spellcasters.length, SpellcasterModel('Nic Cage', const AssetImage('assets/images/nic-cage.png')));
    spellcasters.insert(spellcasters.length, SpellcasterModel('Euler', const AssetImage('assets/images/euler.png')));
  }


  void addItemToList() {
    setState(() {
      spellcasters.insert(spellcasters.length, SpellcasterModel(nameController.text, const AssetImage('assets/images/anime-hamster.png')));
    });
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Name'),
            content: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "TODO: random mage name generator"),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[800], // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  child: const Text('ADD'),
                  onPressed: () {
                    setState(() {
                      addItemToList();
                      nameController.clear();
                      Navigator.pop(context);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[700], // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
              ),
            ],
          );
        });
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
              onPressed: () {
                _displayTextInputDialog(context);
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
