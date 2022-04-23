import 'package:flutter/material.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Fotinha aqui :)'),
          SizedBox(height: 20.0),
          Text('Arthur Scorsolini Fares'),
          Text('832447'),
          Text('Made with 💙 and ☕.'),
        ],
      ),
    );
  }
}