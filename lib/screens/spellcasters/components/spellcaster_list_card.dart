import 'package:flutter/material.dart';

class SpellcasterListCard extends StatelessWidget {
  const SpellcasterListCard({
    Key? key,
    required this.spellcasterName,
    required this.image,
    required this.dndClass,
    required this.level,
  }) : super(key: key);

  final String spellcasterName;
  final AssetImage image;
  final String dndClass;
  final int level;

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
              dndClass: dndClass,
              level: level,
            ),
            Thumbnail(image: image),
          ],
        ));
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
    var radius = const Radius.circular(8.0);

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
          Container(height: 12.0),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.amberAccent[700],
                  borderRadius:
                      BorderRadius.only(bottomLeft: radius, topLeft: radius),
                ),
                child: Text(dndClass),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius:
                      BorderRadius.only(bottomRight: radius, topRight: radius),
                ),
                child: Text('$level'),
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
    required this.spellcasterName,
    required this.dndClass,
    required this.level,
  }) : super(key: key);

  final String spellcasterName;
  final String dndClass;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.0,
      // margin: const EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: const Color(0xFF333366),
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
      child: CardContent(
        spellcasterName: spellcasterName,
        dndClass: dndClass,
        level: level,
      ),
    );
  }
}

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    Key? key,
    required this.image,
  }) : super(key: key);

  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      alignment: FractionalOffset.centerLeft,
      child: ClipOval(
        child: Image(
          filterQuality: FilterQuality.high,
          image: image,
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
