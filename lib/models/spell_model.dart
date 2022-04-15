class SpellModel {
  String name;
  List<dynamic> description;
  String schoolName;

  SpellModel(this.name, this.description, this.schoolName);

  factory SpellModel.fromJson(Map<String, dynamic> json) {
    return SpellModel(
      json['name'],
      json['desc'],
      json['school']['name']
    );
  }
}