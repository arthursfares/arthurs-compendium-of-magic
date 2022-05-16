import 'dart:convert';

import 'package:arthurs_compendium_of_magic/models/spell_token_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

class SpellbookAddScreen extends StatefulWidget {
  const SpellbookAddScreen({Key? key}) : super(key: key);

  @override
  State<SpellbookAddScreen> createState() => _SpellbookAddScreenState();
}

class _SpellbookAddScreenState extends State<SpellbookAddScreen> {
  Client client = Client();
  TextEditingController searchFieldController = TextEditingController();
  List<SpellTokenModel> spellList = [];
  List<SpellTokenModel> spellList1 = [];
  List<SpellTokenModel> spellList2 = [];

  loadTokensJson() async {
    final response =
        await client.get(Uri.parse('https://www.dnd5eapi.co/api/spells/'));
    if (response.statusCode == 200) {
      final dynamic decodedResponse = await json.decode(response.body);
      setState(() {
        decodedResponse['results'].forEach((item) {
          spellList.add(SpellTokenModel.fromJson(item));
          spellList1.add(SpellTokenModel.fromJson(item));
        });
        spellList2.addAll(spellList1);
      });
    } else {
      throw Exception('Failed to load tokens');
    }
  }

  void search(String searchString) {
    if (searchString.isNotEmpty) {
      List<SpellTokenModel> tmp = [];
      for (SpellTokenModel item in spellList1) {
        if (item.name.toLowerCase().contains(searchString.toLowerCase())) {
          tmp.add(item);
        }
      }
      setState(() {
        spellList2.clear();
        spellList2.addAll(tmp);
      });
    } else {
      setState(() {
        spellList2.clear();
        spellList2.addAll(spellList1);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadTokensJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // removes shadow
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.green.shade300),
        title: SizedBox(
          // search bar
          width: double.infinity,
          height: 80,
          child: Center(
            child: TextField(
              onChanged: (value) => search(value),
              controller: searchFieldController,
              cursorColor: Colors.green.shade300,
              style: TextStyle(
                fontSize: 24,
                color: Colors.green.shade300,
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: FaIcon(FontAwesomeIcons.xmark, color: Colors.green.shade300),
                  onPressed: () {
                    searchFieldController.clear();
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: spellList2.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  spellList2[index].name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context, spellList2[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
