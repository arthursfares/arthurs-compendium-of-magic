import 'dart:convert';

import 'package:arthurs_compendium_of_magic/models/spell_token.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddSpellBody extends StatefulWidget {
  const AddSpellBody({Key? key}) : super(key: key);

  @override
  State<AddSpellBody> createState() => _AddSpellBodyState();
}

class _AddSpellBodyState extends State<AddSpellBody> {
  Client client = Client();
  List<SpellToken> spellList = [];

  loadTokensJson() async {
    final response =
        await client.get(Uri.parse('https://www.dnd5eapi.co/api/spells/'));
    if (response.statusCode == 200) {
      final dynamic decodedResponse = await json.decode(response.body);
      setState(() {
        decodedResponse['results'].forEach((item) {
          spellList.add(SpellToken.fromJson(item));
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
              onTap: () async {
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
