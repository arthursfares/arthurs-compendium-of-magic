import 'package:flutter/material.dart';

class SpellcasterModel {
  late String _name;
  late AssetImage _thumbnail;
  late String _dndClass;
  late int _level;
  late String _description;

  SpellcasterModel(
    String spellcasterName,
    AssetImage spellcasterThumbnail,
    String spellcasterClass,
    int spellcasterLevel,
    String spellcasterDescription,
  ) {
    _name = spellcasterName;
    _thumbnail = spellcasterThumbnail;
    _dndClass = spellcasterClass;
    _level = spellcasterLevel;
    _description = spellcasterDescription;
  }

  String get name => _name;
  AssetImage get thumbnail => _thumbnail;
  String      get dndClass      => _dndClass;
  int         get level         => _level;
  String      get description   => _description;
}
