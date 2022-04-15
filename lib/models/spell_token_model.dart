class SpellTokenModel {
  String indexName;
  String name;

  SpellTokenModel(this.indexName, this.name);

  factory SpellTokenModel.fromJson(Map<String, dynamic> json) {
    return SpellTokenModel(
      json['index'],
      json['name']
    );
  }
}