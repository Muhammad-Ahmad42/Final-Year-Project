import 'package:get/get.dart';

class ResearchCollabController extends GetxController {
  final List<Map<String, String>> _shareUsers = [
  {'name': 'Muhammad Ahmad', 'image': 'assets/user1.jpg'},
  {'name': 'SALMAN ZAIN', 'image': 'assets/user2.jpg'},
  {'name': 'Maryam Nadeem', 'image': 'assets/user3.jpg'},
  {'name': 'rafiahabib', 'image': 'assets/user4.jpg'},
  {'name': 'Mian Haziq', 'image': 'assets/user5.jpg'},
  {'name': 'Ctrl+Alt=graduate', 'image': 'assets/user6.jpg'},
];
  var storyData = <Map<String, String>>[
    {"userName": "Ali", "image": "assets/images/p2.jpg"},
    {"userName": "Ahmad", "image": "assets/images/p3.jpg"},
    {"userName": "Awais", "image": "assets/images/p4.jpg"},
    {"userName": "Hannan", "image": "assets/images/p5.jpg"},
    {"userName": "Haziq", "image": "assets/images/p6.jpg"},
    {"userName": "Salman", "image": "assets/images/p7.jpg"},
    {"userName": "Osama", "image": "assets/images/p8.jpg"},
    {"userName": "Burhan", "image": "assets/images/p9.jpg"},
    {"userName": "Rana Farhan", "image": "assets/images/p10.jpg"},
  ].obs;
  final likeImagesList = [
    'assets/images/p6.jpg',
    'assets/images/p7.jpg',
    'assets/images/p8.jpg',
    'assets/images/p9.jpg',
  ];
var postData=[
    {
      "userName": "Ali",
      "profileImage": "assets/images/p1.jpeg",
      "postImage": "assets/images/ban.jpeg",
      "timeAgo": "2 hours ago",
    },
    {
      "userName": "Ahmad",
      "profileImage": "assets/images/p2.jpg",
      "postImage": "assets/images/ban.jpeg",
      "timeAgo": "3 hours ago",
    },
    {
      "userName": "Awais",
      "profileImage": "assets/images/p3.jpg",
      "postImage": "assets/images/ban.jpeg",
      "timeAgo": "4 hours ago",
    },
  ];
}