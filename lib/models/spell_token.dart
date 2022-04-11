class SpellToken {
  String indexName;
  String name;

  SpellToken(this.indexName, this.name);

  factory SpellToken.fromJson(Map<String, dynamic> json) {
    return SpellToken(
      json['index'],
      json['name']
    );
  }
}