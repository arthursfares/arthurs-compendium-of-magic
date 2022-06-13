class UserModel {
  late String uid;
  late String name;

  UserModel(this.uid, this.name);

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
      };
}
