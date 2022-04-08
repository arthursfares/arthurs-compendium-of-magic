import 'package:flutter/material.dart';

class SpellcasterModel {
  late String _spellcasterName;
  late Map<String, int> _spellcasterClassMap;
  late Image _spellcasterThumbnail;

  SpellcasterModel(
    spellcasterName,
    spellcasterClassMap,
    spellcasterThumbnail,
  );

  String get spellcasterName => _spellcasterName;
  Map<String, int> get spellcasterClassMap => _spellcasterClassMap;
  Image get spellcasterThumbnail => _spellcasterThumbnail;
}
