import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpellcasterListCard extends StatelessWidget {
  const SpellcasterListCard({
    Key? key,
    required this.spellcasterName,
    required this.image,
    required this.dndClass,
    required this.level,
  }) : super(key: key);

  final String spellcasterName;
  final Image image;
  final String dndClass;
  final int level;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: FocusedMenuHolder(
        menuWidth: size.width * 0.50,
        blurSize: 5.0,
        menuItemExtent: 45,
        menuBoxDecoration: const BoxDecoration(
            color: Color(0xFF161616),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        duration: const Duration(milliseconds: 100),
        animateMenuItems: true,
        blurBackgroundColor: Colors.black54,
        openWithTap: true, // Open Focused-Menu on Tap rather than Long Press
        menuOffset:
            10.0, // Offset value to show menuItem from the selected item
        bottomOffsetHeight:
            80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
        menuItems: <FocusedMenuItem>[
          // Add Each FocusedMenuItem  for Menu Options
          FocusedMenuItem(
            backgroundColor: Colors.greenAccent.shade400,
            title: const Text("Spellbook",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailingIcon: const Icon(FontAwesomeIcons.bookSkull),
            onPressed: () {
              Navigator.pushNamed(context, 'spellbook',
                                arguments: spellcasterName);
            },
          ),
          FocusedMenuItem(
            backgroundColor: const Color(0xFF161616),
            title: const Text("Edit",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailingIcon:
                const Icon(FontAwesomeIcons.wandMagicSparkles, size: 20),
            onPressed: () {},
          ),
          FocusedMenuItem(
            backgroundColor: const Color(0xFF161616),
            title: const Text(
              "Delete",
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            trailingIcon: const Icon(
              CommunityMaterialIcons.skull_crossbones,
              color: Colors.redAccent,
            ),
            onPressed: () {},
          ),
        ],
        onPressed: () {},

        child: Stack(
          children: <Widget>[
            const Card(),
            CardContent(
              spellcasterName: spellcasterName,
              dndClass: dndClass,
              level: level,
            ),
            Thumbnail(image: image),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  CardContent({
    Key? key,
    required this.spellcasterName,
    required this.dndClass,
    required this.level,
  }) : super(key: key);

  final String spellcasterName;
  final String dndClass;
  final int level;

  final TextStyle headerTextStyle = const TextStyle(fontFamily: 'Poppins')
      .copyWith(
          color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(76.0 + 46.0 + 16.0, 16.0, 16.0, 16.0),
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(
            spellcasterName,
            style: const TextStyle(
              fontSize: 22.0,
              fontFamily: 'Space Quest',
              letterSpacing: 1,
            ),
          ),
          Container(height: 12.0),
          // CLASS AND LEVEL
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.amberAccent[700],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                  ),
                ),
                child: Text(
                  dndClass,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: const BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: Text(
                  '$level',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.0,
      // margin: const EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF3E065F),
            Color.fromARGB(255, 81, 9, 122),
            Color.fromARGB(255, 102, 19, 150),
            Color.fromARGB(255, 132, 51, 179),
          ],
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );
  }
}

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    Key? key,
    required this.image,
  }) : super(key: key);

  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: ClipOval(
        child: Image(
          filterQuality: FilterQuality.high,
          image: image.image,
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
