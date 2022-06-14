import 'package:arthurs_compendium_of_magic/screens/spellcasters/components/card_options_dropdown.dart';
import 'package:arthurs_compendium_of_magic/services/storage_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class SpellcastersBodyCarousel extends StatefulWidget {
  const SpellcastersBodyCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<SpellcastersBodyCarousel> createState() =>
      _SpellcastersBodyCarouselState();
}

class _SpellcastersBodyCarouselState extends State<SpellcastersBodyCarousel> {
  var spellcastersQuery = FirebaseFirestore.instance
      .collection('spellcasters')
      .where(
        'userId',
        isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString(),
      )
      .where(
        'active',
        isEqualTo: true,
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Storage storage = Storage();

    return StreamBuilder<QuerySnapshot>(
      stream: spellcastersQuery.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(color:Colors.purple));
        }
        else {
          final spellcastersData = snapshot.requireData;
          return Center(
            child: CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: false,
                height: size.height,
                enlargeCenterPage: true,
              ),
              items: spellcastersData.docs.map(
                (doc) {
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
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF3E065F),
                                    Color.fromARGB(255, 81, 9, 122),
                                    Color.fromARGB(255, 102, 19, 150),
                                    Color.fromARGB(255, 132, 51, 179),
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                            ),

                            // CARD CONTENT
                            Column(
                              children: [
                                // THUMBNAIL
                                FutureBuilder(
                                  future: storage.downloadUrl(doc['imageName']),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.done &&
                                        snapshot.hasData) {
                                      return Container(
                                        alignment: FractionalOffset.topCenter,
                                        child: ClipOval(
                                          child: Image.network(
                                            snapshot.data!,
                                            width: 200.0,
                                            height: 200.0,
                                          ),
                                        ),
                                      );
                                    }
                                    if (snapshot.connectionState ==
                                            ConnectionState.waiting ||
                                        !snapshot.hasData) {
                                      return Shimmer.fromColors(
                                        baseColor: Colors.purple,
                                        highlightColor: Colors.purpleAccent,
                                        child: Container(
                                          width: 200.0,
                                          height: 200.0,
                                          alignment: FractionalOffset.topCenter,
                                          decoration: const BoxDecoration(
                                            color: Colors.purple,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      );
                                    }
                                    return const Text('image not found');
                                  },
                                ),

                                // NAME
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    doc['name'],
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
                                        doc['dndClass'],
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
                                        '${doc['level']}',
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  constraints: BoxConstraints.tight(
                                      const Size(250, 150)),
                                  alignment: FractionalOffset.topCenter,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      doc['description'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.grey.shade100,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        // fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),

                                // SPELLBOOK BUTTON
                                const SizedBox(height: 65),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'spellbook',
                                        arguments: doc['name']);
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.greenAccent.shade400,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12.0)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 130,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            FaIcon(FontAwesomeIcons.bookSkull,
                                                size: 26.0),
                                            SizedBox(width: 10),
                                            Text(
                                              'Spellbook',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            // PopupMeunuButton
                            Container(
                              // padding: const EdgeInsets.only(right: 8.0),
                              alignment: Alignment.topRight,
                              child: CardOptionsDropdown(spellcasterDoc: doc),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            ),
          );
        }
      },
    );
  }
}
