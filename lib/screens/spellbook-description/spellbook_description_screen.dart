import 'dart:convert';

import 'package:arthurs_compendium_of_magic/models/spell_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart';

class SpellbookDescriptionScreen extends StatefulWidget {
  const SpellbookDescriptionScreen({
    Key? key,
    required this.spellIndex,
  }) : super(key: key);

  final String spellIndex;

  @override
  State<SpellbookDescriptionScreen> createState() =>
      _SpellbookDescriptionScreenState();
}

class _SpellbookDescriptionScreenState
    extends State<SpellbookDescriptionScreen> {
  Client client = Client();
  late SpellModel spell;

  loadSpellJson(String spellIndex) async {
    final response = await client
        .get(Uri.parse('https://www.dnd5eapi.co/api/spells/$spellIndex'));
    if (response.statusCode == 200) {
      final dynamic decodedResponse = await json.decode(response.body);
      setState(() {
        spell = SpellModel.fromJson(decodedResponse);
      });
    } else {
      throw Exception('Failed to load spell');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await loadSpellJson(widget.spellIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // removes shadow
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(spell.name),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Space Quest',
          letterSpacing: 1,
          fontSize: 20,
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: buildDescParagraph(spell.description),
        ),
      ),
    );
  }

  Widget buildDescParagraph(List<dynamic> descList) {
    int initTableIndex = -1;
    List<int> tablesStartIndex = [];

    for (int i = 0; i < descList.length; i++) {
      if (descList[i].toString()[0] == '|') {
        initTableIndex = i;
        tablesStartIndex.add(initTableIndex);
        if (initTableIndex != -1) {
          for (int i = initTableIndex + 1; i < descList.length; i++) {
            if (descList[i].toString().startsWith('|')) {
              descList[initTableIndex] += descList[i].toString();
              descList[i] = '';
            } else {
              break;
            }
          }
          descList.removeWhere((element) => element.toString().isEmpty);
          descList[initTableIndex] =
              descList[initTableIndex].toString().replaceAll('||', '|\n|');
        }
      }
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: descList
            .map(
              (item) => !tablesStartIndex.contains(descList.indexOf(item))
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MarkdownBody(data: item),
                    )
                  : Container(
                      width: double.infinity,
                      height: 500,
                      color: Colors.amber,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(width: 20),
                          SizedBox(
                              width: 1000, child: MarkdownBody(data: item)),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}
