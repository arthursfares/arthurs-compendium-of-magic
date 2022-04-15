import 'package:flutter/material.dart';

class SpellcasterModel {
  late String _name;
  late AssetImage _thumbnail;
  // late Map<String, int> _spellcasterClassMap;

  SpellcasterModel(
    spellcasterName,
    spellcasterThumbnail,
    // spellcasterClassMap,
  ) {
    _name = spellcasterName;
    _thumbnail = spellcasterThumbnail;
  }

  String get name => _name;
  AssetImage get thumbnail => _thumbnail;
  // Map<String, int> get spellcasterClassMap => _spellcasterClassMap;
}
