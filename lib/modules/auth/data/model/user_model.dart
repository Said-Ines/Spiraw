class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String? userImage;

  UserModel(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.email,
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
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'userImage': userImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      userImage: map['userImage'],
    );
  }
}
