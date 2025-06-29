import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chat_detail_screen.dart';

class ChatController extends GetxController {
  var chats = <Map<String, String>>[
    {
      'name': 'M. Burhan Naeem',
      'message': 'Looking forward to your paper!',
      'time': '08:43',
      'avatar': 'assets/images/p1.jpeg',
    },
    {
      'name': 'Dr. Sarah Watson',
      'message': 'Looking forward to your paper!',
      'time': '08:43',
      'avatar': 'assets/images/p1.jpeg',
    },
    {
      'name': 'Wildlife Org',
      'message': 'Great research on butterflies!',
      'time': 'Tue',
      'avatar': 'assets/images/p5.jpg',
    },
    {
      'name': 'M Ahmad',
      'message': 'Looking forward to your paper!',
      'time': 'Sun',
      'avatar': 'assets/images/p2.jpg',
    },
    {
      'name': 'Mam Sehar Zia',
      'message': 'Great research on butterflies!',
      'time': '23 Mar',
      'avatar': 'assets/images/p3.jpg',
    },
    {
      'name': 'Mian Gee',
      'message': 'Looking forward to your paper!',
      'time': '15 Mar',
      'avatar': 'assets/images/p4.jpg',
    },
    {
      'name': 'Hannan',
      'message': 'Great research on butterflies!',
      'time': '10 Mar',
      'avatar': 'assets/images/p8.jpg',
    },
    {
      'name': 'Awais',
      'message': 'Looking forward to your paper!',
      'time': '04 Mar',
      'avatar': 'assets/images/p7.jpg',
    },
    {
      'name': 'Salman',
      'message': 'Great research on butterflies!',
      'time': '01 Mar',
      'avatar': 'assets/images/p8.jpg',
    },
  ].obs;

  var recentUsers = <Map<String, String>>[
    {'name': 'Alice', 'image': 'assets/images/chat5.png'},
    {'name': 'Ben', 'image': 'assets/images/chat6.png'},
    {'name': 'Clara', 'image': 'assets/images/chat7.png'},
    {'name': 'David', 'image': 'assets/images/chat8.png'},
  ];
}

class ChatOverviewScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Colors.white;
    final Color textColor = Colors.black87;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Recent section
          Container(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Recent',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: chatController.recentUsers.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final user = chatController.recentUsers[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ChatDetailScreen(
                              name: user['name']!,
                            ));
                      },
                      child: ClipOval(
                        child: Image.asset(
                          user['image']!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      user['name']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Chat List
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(42),
                  topRight: Radius.circular(42),
                ),
              ),
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: chatController.chats.length,
                  itemBuilder: (context, index) {
                    final chat = chatController.chats[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      onTap: () => Get.to(() => ChatDetailScreen(name: chat['name']!)),
                      leading: ClipOval(
                        child: Image.asset(
                          chat['avatar']!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        chat['name']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        chat['message']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        chat['time']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
