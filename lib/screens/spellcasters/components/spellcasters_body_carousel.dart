import 'package:arthurs_compendium_of_magic/models/spellcaster_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:community_material_icon/community_material_icon.dart';
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
          height: size.height,
          enlargeCenterPage: true,
        ),
        items: spellcasters.map((spellcaster) {
          return Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Stack(
                  children: [
                    // CARD BACKGROUND
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.15),
                      height: size.height * 0.5 + 20,
                      width: size.width * 0.8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF3E065F),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
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
                          alignment: Alignment.center,
                          child: Text(
                            spellcaster.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 33.0,
                              fontFamily: 'Space Quest',
                              letterSpacing: 1,
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
                              child: Text(
                                spellcaster.dndClass,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                              child: Text(
                                '${spellcaster.level}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // DESCRIPTION
                        const SizedBox(height: 20),
                        Container(
                          // color: Colors.amber,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          constraints:
                              BoxConstraints.tight(const Size(250, 150)),
                          alignment: FractionalOffset.topCenter,
                          child: SingleChildScrollView(
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
                        ),

                        // SPELLBOOK BUTTON
                        const SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.greenAccent
                                  .shade400, //background color of button
                              elevation: 3, //elevation of button
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(
                                  18) //content padding inside button
                              ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 0, top: 4),
                            child: FaIcon(
                              FontAwesomeIcons.bookSkull,
                              size: 30.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'spellbook',
                                arguments: spellcaster.name);
                          },
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      alignment: Alignment.topRight,
                      child: const Icon(CommunityMaterialIcons.dots_horizontal),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
