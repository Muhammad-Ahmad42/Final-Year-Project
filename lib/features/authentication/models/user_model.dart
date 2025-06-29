import 'dart:typed_data';
import 'package:wildscan/features/personalization/models/address_model.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  Address? location; // Changed from final to mutable
  final String userType;
  final DateTime joinedDate;
  final List<String> listedProducts;
  final List<String> followers;
  final List<String> followings;
  final List<String> savedPosts;
  Uint8List? profilePictureBytes;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.location,
    this.userType = 'user',
    DateTime? joinedDate,
    List<String>? listedProducts,
    List<String>? followers,
    List<String>? followings,
    List<String>? savedPosts,
    this.profilePictureBytes,
  }) : joinedDate = joinedDate ?? DateTime.now(),
       listedProducts = listedProducts ?? [],
       followers = followers ?? [],
       followings = followings ?? [],
       savedPosts = savedPosts ?? [];

  Map<String, dynamic> toJson() => {
    'Username': username,
    'Email': email,
    'Location': location?.toJson(),
    'UserType': userType,
    'JoinedDate': joinedDate.toIso8601String(),
    'ListedProducts': listedProducts,
    'Followers': followers,
    'Followings': followings,
    'SavedPosts': savedPosts,
    'ProfilePictureBytes': profilePictureBytes,
  };

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
      id: id,
      username: json['Username'] ?? '',
      email: json['Email'] ?? '',
      location: json['Location'] != null
          ? Address.fromJson(Map<String, dynamic>.from(json['Location']))
          : null,
      userType: json['UserType'] ?? 'user',
      joinedDate: json['JoinedDate'] != null
          ? DateTime.parse(json['JoinedDate'])
          : DateTime.now(),
      listedProducts: List<String>.from(json['ListedProducts'] ?? []),
      followers: List<String>.from(json['Followers'] ?? []),
      followings: List<String>.from(json['Followings'] ?? []),
      savedPosts: List<String>.from(json['SavedPosts'] ?? []),
      profilePictureBytes: json['ProfilePictureBytes'] != null
          ? Uint8List.fromList(List<int>.from(json['ProfilePictureBytes']))
          : null,
    );
  }

  set address(Address address) {
    location = address;
  }

  static UserModel empty() => UserModel(id: '', username: '', email: '');
}
