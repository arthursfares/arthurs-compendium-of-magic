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
          fontSize: 28,
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
        // of starts with |
        initTableIndex = i;
        tablesStartIndex.add(initTableIndex);
        if (initTableIndex != -1) {
          for (int i = initTableIndex + 1; i < descList.length; i++) {
            if ((descList[i].toString().startsWith('|')) &&
                !(descList[i].toString().contains('---'))) {
              descList[initTableIndex] += descList[i].toString();
              descList[i] = '';
            } else if (descList[i].toString().contains('---')) {
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

    Map<int, TableColumnWidth> _getWidths(List<String> contentSample) {
      contentSample.removeWhere((element) => element == '');
      Map<int, TableColumnWidth> widthsMap = {};
      for (String item in contentSample.sublist(1, contentSample.length - 1)) {
        if (item.replaceAll(' ', '').length > 10) {
          widthsMap[contentSample.indexOf(item)] = const FixedColumnWidth(100);
        } else {
          widthsMap[contentSample.indexOf(item)] = const FlexColumnWidth();
        }
      }
      return widthsMap;
    }

    List<Widget> _getRow(List<String> content) {
      List<Widget> row = [];
      for (String item in content.sublist(1, content.length - 1)) {
        row.add(Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ));
      }
      return row;
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: descList
            .map(
              (item) => !tablesStartIndex.contains(descList.indexOf(item))
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: MarkdownBody(
                        data: item,
                        styleSheet: MarkdownStyleSheet(
                          p: const TextStyle(fontSize: 18,),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SingleChildScrollView(
                        // found table
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            border: TableBorder.all(
                              color: Colors.green,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            columnWidths: _getWidths(item
                                .split('\n')[1]
                                .split('|')), // pass sample row to get width
                            children: item.split('\n').map<TableRow>((value) {
                              return TableRow(
                                  children: _getRow(value.split('|')));
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}
