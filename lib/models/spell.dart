class Spell {
  String name;
  List<dynamic> description;
  String schoolName;

  Spell(this.name, this.description, this.schoolName);

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      json['name'],
      json['desc'],
      json['school']['name']
    );
  }
}