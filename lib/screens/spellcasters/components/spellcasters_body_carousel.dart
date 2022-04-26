import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpellcastersBodyCarousel extends StatelessWidget {
  const SpellcastersBodyCarousel({
    Key? key,
    required this.spellcasters,
  }) : super(key: key);

  final List<SpellcasterModel> spellcasters;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          enableInfiniteScroll: false,
          height: size.height * 0.7,
          enlargeCenterPage: true,
        ),
        items: spellcasters.map((spellcaster) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                children: [
                  // CARD BACKGROUND
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.15),
                    height: size.height * 0.5,
                    width: size.width * 0.8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3E065F),
                      borderRadius:
                          BorderRadius.all(Radius.circular(16.0)),
                    ),
                  ),

                  // CARD CONTENT
                  Column(
                    children: [
                      // THUMBNAIL
                      Container(
                        alignment: FractionalOffset.topCenter,
                        child: ClipOval(
                          child: Image(
                            width: 200.0,
                            height: 200.0,
                            image: spellcaster.thumbnail,
                          ),
                        ),
                      ),

                      // NAME
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        alignment: FractionalOffset.center,
                        child: Text(
                          spellcaster.name,
                          style: const TextStyle(
                            fontSize: 33.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),

                      // CLASS AND LEVEL
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: Colors.amberAccent[700],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0),
                              ),
                            ),
                            child: Text(spellcaster.dndClass),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: const BoxDecoration(
                              color: Colors.purpleAccent,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Text('${spellcaster.level}'),
                          ),
                        ],
                      ),

                      // DESCRIPTION
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        alignment: FractionalOffset.bottomCenter,
                        child: Text(
                          spellcaster.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),

                      // SPELLBOOK BUTTON
                      Center(
                        child: ElevatedButton(
                          child: const FaIcon(FontAwesomeIcons.bookSkull, size: 19.0,),
                          onPressed: () {
                            Navigator.pushNamed(context, 'spellbook', arguments: spellcaster.name);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
