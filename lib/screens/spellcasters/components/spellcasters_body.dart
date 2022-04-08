import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcaster_card.dart';
import 'package:flutter/material.dart';

class SpellcastersBody extends StatefulWidget {
  const SpellcastersBody({Key? key}) : super(key: key);

  @override
  State<SpellcastersBody> createState() => _SpellcastersBodyState();
}

class _SpellcastersBodyState extends State<SpellcastersBody> {
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
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.84,
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              // reverse: true,
              reverse: false,
              padding: const EdgeInsets.all(10),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return SpellcasterCard(
                  spellcasterName: names[index],
                  imagePath: images[index],
                );
              },
            ),
          ),
          const SizedBox(height: 13.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 13.0),
                child: Text(
                  '📚 Add spellcaster',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              onPressed: () {
                // addItemToList();
                _displayTextInputDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 146, 109, 213), // background
                onPrimary: Colors.white, // foreground
              ),
            ),
          ),
        ],
      ),
    );
  }
}
