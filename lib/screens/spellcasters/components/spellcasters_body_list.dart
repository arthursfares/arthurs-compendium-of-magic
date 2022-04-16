import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcaster_list_card.dart';
import 'package:flutter/material.dart';

class SpellcastersBodyList extends StatelessWidget {
  const SpellcastersBodyList({
    Key? key,
    required this.spellcasters,
  }) : super(key: key);

  final List<SpellcasterModel> spellcasters;

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
              itemCount: spellcasters.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'spellbook',
                    arguments: spellcasters[index].name);
                  },
                  child: SpellcasterListCard(
                    spellcasterName: spellcasters[index].name,
                    image: spellcasters[index].thumbnail,
                    dndClass: spellcasters[index].dndClass,
                    level: spellcasters[index].level,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
