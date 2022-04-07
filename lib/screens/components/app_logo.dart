import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 60.0, right: 60.0, top: 80.0, bottom: 60.0),
      child: Container(
        alignment: Alignment.topCenter,
        child: const Text(
          'Arthur\'s Compendium of Magic',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
