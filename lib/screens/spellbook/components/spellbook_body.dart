import 'package:arthurs_compendium_of_magic/models/spell_token.dart';
import 'package:flutter/material.dart';

class SpellbookBody extends StatelessWidget {
  const SpellbookBody({
    Key? key,
    required this.spells,
  }) : super(key: key);

  final List<SpellToken> spells;

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
              itemCount: spells.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(spells[index].name),
                    onTap: () {
                      // show spell description screen
                    },
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
