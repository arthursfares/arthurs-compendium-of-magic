import 'package:flutter/material.dart';

class SpellcasterModel {
  late String _name;
  late Image _thumbnail;
  late String _dndClass;
  late int _level;
  late String _description;

  SpellcasterModel(
    String spellcasterName,
    Image spellcasterThumbnail,
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

  factory SpellcasterModel.fromJson(Map<String, dynamic> json) {
    return SpellcasterModel(
      json['name'],
      json['thumbnail'],
      json['class'],
      json['level'],
      json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': _name,
    'thumbnail': _thumbnail,
    'class': _dndClass,
    'level': _level,
    'description': _description,
  };

  String      get name          => _name;
  Image       get thumbnail     => _thumbnail;
  String      get dndClass      => _dndClass;
  int         get level         => _level;
  String      get description   => _description;
}
