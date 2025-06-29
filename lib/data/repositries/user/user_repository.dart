import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:wildscan/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).set(user.toJson());
  }

  Future<UserModel> fetchUserData(String uid) async {
    final snapshot = await _db.collection("Users").doc(uid).get();
    if (snapshot.exists) {
      return UserModel.fromJson(snapshot.id, snapshot.data()!);
    } else {
      throw 'User not found';
    }
  }

  Future<void> uploadProfileImage(String userId, Uint8List imageBytes) async {
    await _db.collection("Users").doc(userId).update({
      "ProfilePictureBytes": imageBytes,
    });
  }

  Future<void> updateUserField(String uid, String field, dynamic value) async {
    await _db.collection("Users").doc(uid).update({field: value});
  }
}
