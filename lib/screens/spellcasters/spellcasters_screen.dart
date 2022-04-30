import 'package:arthurs_compendium_of_magic/models/spellcaster_list_model.dart';
import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/spellcasters_body_carousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SpellcastersScreen extends StatelessWidget {
  const SpellcastersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SpellcasterListModel>(
      builder: (context, spellcasters, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0, // removes shadow
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.plus),
                  onPressed: () async {
                    Navigator.pushNamed(context, 'spellcasters-add')
                        .then((newSpellcaster) {
                      spellcasters.add(newSpellcaster as SpellcasterModel);
                    });
                  },
                ),
              ),
            ],
          ),
          body: SpellcastersBodyCarousel(spellcasterList: spellcasters),
          floatingActionButton: const FabMenu(),
        );
      },
    );
  }
}
