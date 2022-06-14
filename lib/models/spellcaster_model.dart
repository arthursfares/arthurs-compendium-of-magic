import 'package:cloud_firestore/cloud_firestore.dart';

class SpellcasterModel {
  late String _name;
  late String _imageName;
  late String _dndClass;
  late int _level;
  late String _description;

  SpellcasterModel(
    String spellcasterName,
    String imageName,
    String spellcasterClass,
    int spellcasterLevel,
    String spellcasterDescription,
  ) {
    _name = spellcasterName;
    _imageName = imageName;
    _dndClass = spellcasterClass;
    _level = spellcasterLevel;
    _description = spellcasterDescription;
  }

  factory SpellcasterModel.fromJson(Map<String, dynamic> json) {
    return SpellcasterModel(
      json['name'],
      json['imageName'],
      json['class'],
      json['level'],
      json['description'],
    );
  }

  factory SpellcasterModel.fromDoc(QueryDocumentSnapshot<Object?> doc){
    return SpellcasterModel(
      doc['name'],
      doc['imageName'],
      doc['dndClass'],
      doc['level'],
      doc['description'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': _name,
    'imageName': _imageName,
    'class': _dndClass,
    'level': _level,
    'description': _description,
  };

  String      get name          => _name;
  String      get imageName     => _imageName;
  String      get dndClass      => _dndClass;
  int         get level         => _level;
  String      get description   => _description;
}
