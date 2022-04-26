import 'package:arthurs_compendium_of_magic/screens/about/components/about_body.dart';
import 'package:arthurs_compendium_of_magic/screens/components/fab_menu.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // removes shadow
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const AboutBody(),
      floatingActionButton: const FabMenu(),
    );
  }
}