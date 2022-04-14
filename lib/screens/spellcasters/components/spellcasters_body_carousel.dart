import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SpellcastersBodyCarousel extends StatelessWidget {
  const SpellcastersBodyCarousel({
    Key? key,
    required this.names,
    required this.images,
  }) : super(key: key);

  final List<String> names;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: size.height * 0.7,
          enlargeCenterPage: true,
        ),
        items: names.map((name) {
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
                            name,
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
                        image: AssetImage(images[names.indexOf(name)]),
                      ),
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
