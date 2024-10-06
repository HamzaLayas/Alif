class UserModel {
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? role;
  List<String>? favorites;
  UserModel({
    this.sId,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.role,
    this.favorites,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sId': sId,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'role': role,
      'favorites': favorites,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      sId: map['sId'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      image: map['image'],
      role: map['role'],
      // favorites: map['favorites'],
    );
  }
}
