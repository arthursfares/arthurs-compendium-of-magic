import 'dart:convert';

import 'package:arthurs_compendium_of_magic/models/spell_token_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SpellbookAddBody extends StatefulWidget {
  const SpellbookAddBody({Key? key}) : super(key: key);

  @override
  State<SpellbookAddBody> createState() => _SpellbookAddBodyState();
}

class _SpellbookAddBodyState extends State<SpellbookAddBody> {
  Client client = Client();
  List<SpellTokenModel> spellList = [];

  loadTokensJson() async {
    final response =
        await client.get(Uri.parse('https://www.dnd5eapi.co/api/spells/'));
    if (response.statusCode == 200) {
      final dynamic decodedResponse = await json.decode(response.body);
      setState(() {
        decodedResponse['results'].forEach((item) {
          spellList.add(SpellTokenModel.fromJson(item));
        });
      });
    } else {
      throw Exception('Failed to load tokens');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await loadTokensJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: spellList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(spellList[index].name),
              onTap: () {
                Navigator.pop(context, spellList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
