import 'package:flutter/material.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'App for storing Dungeons & Dragons characters\' spell list, in order to make them easier to consult during the game.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(height: 2, width:  size.width / 1.2, color: Colors.black12),
          const SizedBox(height: 20.0),
          const Text(
            'by',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 4.0),
          const Text(
            'Arthur S. Fares',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Space Quest',
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 20.0),
          Container(height: 2, width:  size.width / 1.2, color: Colors.black12),
          const SizedBox(height: 20.0),
          const Text(
            'Made with 💙 and ☕.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
