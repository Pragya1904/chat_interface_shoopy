class ProfileModel {
  String uid;
  String name;
  String? email;
  String? profilePic;

  ProfileModel({required this.uid,required this.name, this.email, this.profilePic});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      profilePic: json['profilePic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profilePic': profilePic,
    };
  }
}
