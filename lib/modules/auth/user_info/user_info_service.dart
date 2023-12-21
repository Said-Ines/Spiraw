import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../app/constants/firebase_collections.dart';
import '../../../bases/controllers/exports.dart';
import '../data/model/user_model.dart';

class UserInfoService {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection(FirebaseCollections.users);

  Future<void> saveUsertoDatabase(UserModel user) async {
    try {
      await userCollection.doc(user.uid).set(user.toMap());
    } catch (e) {
      Debugger.red("Error while saving user info: $e");
    }
  }
}
