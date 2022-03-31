class UserModel {
  String? name;
  String? email;
  String? uId;
  String? image;
  String? gender;
  String? age;

  UserModel({
    this.name,
    this.email,
    this.image,
    this.uId,
    this.age,
    this.gender
  });

  UserModel.fromJson(Map<String,dynamic>json){
    name = json['name'];
    email = json['email'];
    uId = json['uId'];
    image = json['image'];
    age = json['age'];
    gender = json['gender'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
      'image': image,
      'age': age,
      'gender': gender,
    };
  }

}