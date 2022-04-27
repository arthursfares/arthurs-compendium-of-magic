import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FabMenu extends StatefulWidget {
  const FabMenu({Key? key}) : super(key: key);

  @override
  State<FabMenu> createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          setState(() {
            isDialOpen.value = false;
          });
          return false;
        }
        return true;
      },
      child: SpeedDial(
        icon: FontAwesomeIcons.skull,
        iconTheme: const IconThemeData(color: Colors.white),
        activeIcon: FontAwesomeIcons.xmark,
        openCloseDial: isDialOpen,
        backgroundColor: Colors.purpleAccent.shade700,
        overlayColor: Colors.grey,
        overlayOpacity: 0.5,
        spacing: 15,
        spaceBetweenChildren: 15,
        closeManually: false,
        childrenButtonSize: const Size(60.0, 60.0),
        children: [
          SpeedDialChild(
            backgroundColor: const Color(0xFF202020),
            labelBackgroundColor: const Color(0xFF202020),
            child: const FaIcon(FontAwesomeIcons.hatWizard, size: 19.0,),
            label: 'Spellcasters',
            onTap: () {
              Navigator.pushReplacementNamed(context, 'spellcasters');
            },
          ),
          SpeedDialChild(
            backgroundColor: const Color(0xFF202020),
            labelBackgroundColor: const Color(0xFF202020),
            child: const FaIcon(FontAwesomeIcons.mugHot, size: 19.0,),
            label: 'About',
            onTap: () {
              Navigator.pushReplacementNamed(context, 'about');
            },
          ),
          SpeedDialChild(
            backgroundColor: const Color(0xFF202020),
            labelBackgroundColor: const Color(0xFF202020),
            child: const FaIcon(FontAwesomeIcons.flask, size: 19.0,),
            label: 'Settings',
            onTap: () {
              Navigator.pushReplacementNamed(context, 'settings');
            },
          ),
        ],
      ),
    );
  }
}
