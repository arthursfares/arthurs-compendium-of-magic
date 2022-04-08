import 'package:flutter/material.dart';

class SpellcasterCard extends StatelessWidget {
  const SpellcasterCard({
    Key? key,
    required this.spellcasterName,
  }) : super(key: key);

  final String spellcasterName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(2),
      color: Colors.grey,
      child: Center(
        child: Text(
          spellcasterName,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
