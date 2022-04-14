import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcaster_list_card.dart';
import 'package:flutter/material.dart';

class SpellcastersBodyList extends StatefulWidget {
  const SpellcastersBodyList({
    Key? key,
    required this.names,
    required this.images,
  }) : super(key: key);

  final List<String> names;
  final List<String> images;

  @override
  State<SpellcastersBodyList> createState() => _SpellcastersBodyListState();
}

class _SpellcastersBodyListState extends State<SpellcastersBodyList> {
  late List<bool> selectionControlList;

  @override
  void initState() {
    super.initState();
    selectionControlList = List<bool>.filled(widget.names.length, false);
  }

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
              itemCount: widget.names.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      for (int spellcasterIndex = 0;
                          spellcasterIndex < selectionControlList.length;
                          spellcasterIndex++) {
                        if (spellcasterIndex == index) {
                          selectionControlList[spellcasterIndex] = true;
                        } else {
                          selectionControlList[spellcasterIndex] = false;
                        }
                      }
                    });
                  },
                  child: SpellcasterListCard(
                    spellcasterName: widget.names[index],
                    imagePath: widget.images[index],
                    isCardSelected: selectionControlList[index],
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
