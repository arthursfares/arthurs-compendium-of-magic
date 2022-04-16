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
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.15),
                    height: size.height * 0.5,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.purple[900],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 90.0),
                          alignment: FractionalOffset.center,
                          child: Text(
                            spellcaster.name,
                            style: const TextStyle(
                              fontSize: 33.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  Center(
                    child: ElevatedButton(
                      child: const FaIcon(FontAwesomeIcons.bookSkull, size: 19.0,),
                      onPressed: () {
                        Navigator.pushNamed(context, 'spellbook', arguments: spellcaster.name);
                      },
                    ),
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
