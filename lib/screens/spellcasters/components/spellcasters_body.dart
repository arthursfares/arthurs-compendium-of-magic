import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcaster_card.dart';
import 'package:flutter/material.dart';

class SpellcastersBody extends StatelessWidget {
  const SpellcastersBody({
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
        ],
      ),
    );
  }
}
