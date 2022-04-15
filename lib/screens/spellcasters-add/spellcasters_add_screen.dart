import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class SpellcastersAddScreen extends StatefulWidget {
  const SpellcastersAddScreen({Key? key}) : super(key: key);

  @override
  State<SpellcastersAddScreen> createState() => _SpellcastersAddScreenState();
}

class _SpellcastersAddScreenState extends State<SpellcastersAddScreen> {
  final textFieldController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New spellcaster'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: textFieldController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Done',
        child: const Icon(CommunityMaterialIcons.brain),
        onPressed: () {
          Navigator.pop(context, textFieldController.text);
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       content: Text(textFieldController.text),
          //     );
          // };
          // );
        },
      ),
    );
  }
}
