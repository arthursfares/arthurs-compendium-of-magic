import 'package:flutter/material.dart';

class SpellcasterModel {
  late String _spellcasterName;
  // late Map<String, int> _spellcasterClassMap;
  late AssetImage _spellcasterThumbnail;

  SpellcasterModel(
    spellcasterName,
    // spellcasterClassMap,
    spellcasterThumbnail,
  ) {
    _spellcasterName = spellcasterName;
    _spellcasterThumbnail = spellcasterThumbnail;
  }

  String get spellcasterName => _spellcasterName;
  // Map<String, int> get spellcasterClassMap => _spellcasterClassMap;
  AssetImage get spellcasterThumbnail => _spellcasterThumbnail;
}
