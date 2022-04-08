import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcasters_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpellcastersScreen extends StatefulWidget {
  const SpellcastersScreen({Key? key}) : super(key: key);

  @override
  State<SpellcastersScreen> createState() => _SpellcastersScreenState();
}

class _SpellcastersScreenState extends State<SpellcastersScreen> {
  final List<String> names = <String>[
    'Larry Bird',
    'Victor',
    'Tim',
  ];

  final List<String> images = <String>[
    'assets/images/larry-bird.png',
    'assets/images/victor.png',
    'assets/images/tim.png',
  ];

  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      // names.insert(0, nameController.text);
      names.insert(names.length, nameController.text);
      images.insert(images.length, 'assets/images/mordenkainen.png');
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.plus),
              onPressed: (){
                _displayTextInputDialog(context);
              },
            ),
          ),
        ],
      ),
      body: SpellcastersBody(names: names, images: images),
      floatingActionButton: const FabMenu(),
    );
  }
}
