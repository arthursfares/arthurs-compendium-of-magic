import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpellcastersScreen extends StatelessWidget {
  const SpellcastersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FabCircularMenu(
        fabOpenIcon: const FaIcon(FontAwesomeIcons.skull),
        fabCloseIcon: const FaIcon(FontAwesomeIcons.xmark),
        ringDiameter: size.width,
        // ringColor: const Color(0x00ffffff),
        ringColor: const Color(0x11161616),
        children: <Widget>[
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.mugHot),
            onPressed: () {},
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.wandMagicSparkles),
            onPressed: () {},
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bookSkull),
            onPressed: () {},
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.hatWizard),
            onPressed: () {},
          ),
        ],
        animationDuration: const Duration(milliseconds: 600),
        animationCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
