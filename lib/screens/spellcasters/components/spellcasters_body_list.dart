import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcaster_list_card.dart';
import 'package:flutter/material.dart';

class SpellcastersBodyList extends StatelessWidget {
  const SpellcastersBodyList({
    Key? key,
    required this.names,
    required this.images,
  }) : super(key: key);

  final List<String> names;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              reverse: false,
              padding: const EdgeInsets.all(10),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return SpellcasterListCard(
                  spellcasterName: names[index],
                  imagePath: images[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
