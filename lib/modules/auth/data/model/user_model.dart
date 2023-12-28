class UserModel {
  final String uid;
  final String username;
  // final String lastName;
  final String? phoneNumber;
  final String email;
  final String password;
  final String? userImage;

  UserModel(
      {required this.uid,
      required this.username,
      //required this.lastName,
      this.phoneNumber,
      required this.email,
      required this.password,
      this.userImage});

  // factory UserModel.fromFirebaseUser(User user) {
  //   return UserModel(
  //     uid: user.uid,
  //     firstName: user.displayName?.split(' ')[0] ?? '',
  //     lastName: user.displayName?.split(' ')[1] ?? '',
  //     email: user.email ?? '',
  //     phoneNumber: user.phoneNumber ?? '',
  //     userImage: user.photoURL ?? '',
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      // 'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'userImage': userImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      username: map['username'],
      //lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      password: map['password'],
      userImage: map['userImage'],
    );
  }
}
