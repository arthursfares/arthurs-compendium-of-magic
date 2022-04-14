import 'package:flutter/material.dart';

class SpellcasterListCard extends StatelessWidget {
  const SpellcasterListCard({
    Key? key,
    required this.spellcasterName,
    required this.imagePath,
    required this.isCardSelected,
  }) : super(key: key);

  final String spellcasterName;
  final String imagePath;
  final bool isCardSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            Card(
              spellcasterName: spellcasterName,
              isCardSelected: isCardSelected,
            ),
            Thumbnail(imagePath: imagePath),
          ],
        ));
  }
}

class CardContent extends StatelessWidget {
  CardContent({
    Key? key,
    required this.spellcasterName,
  }) : super(key: key);

  final String spellcasterName;

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
            style: headerTextStyle,
          ),
          Container(height: 10.0),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: const Color(0xff00c6ff)),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.spellcasterName,
    required this.isCardSelected,
  }) : super(key: key);

  final String spellcasterName;
  final bool isCardSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.0,
      // margin: const EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: const Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: isCardSelected
            ? const <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
                BoxShadow(
                  color: Color.fromARGB(130, 237, 125, 58),
                  blurRadius: 15,
                  spreadRadius: 15,
                ),
              ]
            : const <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
      ),
      child: CardContent(spellcasterName: spellcasterName),
    );
  }
}

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      alignment: FractionalOffset.centerLeft,
      child: ClipOval(
        child: Image(
          filterQuality: FilterQuality.high,
          image: AssetImage(imagePath),
          // height: 92.0,
          // width: 92.0,
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}