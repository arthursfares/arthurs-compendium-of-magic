import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FabMenu extends StatelessWidget {
  const FabMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FabCircularMenu(
      fabOpenIcon: const FaIcon(FontAwesomeIcons.skull),
      fabCloseIcon: const FaIcon(FontAwesomeIcons.xmark),
      ringDiameter: size.width,
      ringColor: ThemeData.dark().primaryColor,
      children: <Widget>[
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.mugHot),
          onPressed: () {},
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.bookSkull),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'spellbook');
          },
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.hatWizard),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'spellcasters');
          },
        ),
      ],
      animationDuration: const Duration(milliseconds: 600),
      animationCurve: Curves.linearToEaseOut,
    );
  }
}
