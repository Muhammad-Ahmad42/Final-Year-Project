import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wildscan/data/repositries/user/user_repository.dart';
import 'package:wildscan/features/authentication/models/user_model.dart';
import 'package:wildscan/features/personalization/models/address_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final Rx<UserModel> user = UserModel.empty().obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final fetchedUser = await UserRepository.instance.fetchUserData(uid);
        user.value = fetchedUser;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> updateProfilePicture() async {
    try {
      final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;

      final bytes = await pickedImage.readAsBytes();
      await UserRepository.instance.uploadProfileImage(user.value.id, bytes);

      user.update((val) {
        if (val != null) val.profilePictureBytes = bytes;
      });

      Get.snackbar('Success', 'Profile picture updated');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> closeAccount() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
      Get.back();
      Get.snackbar('Account Closed', 'Your account has been deleted');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> updateUserAddress(Address newAddress) async {
    final userId = user.value.id;
    await UserRepository.instance.updateUserField(
      userId,
      'Address',
      newAddress.toJson(),
    );

    user.update((val) {
      if (val != null) val.address = newAddress;
    });

    Get.back();
    Get.snackbar('Success', 'Address updated successfully');
  }
}
