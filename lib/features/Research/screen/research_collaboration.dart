import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:wildscan/features/Research/controller/research_collaboration_controller.dart';
import 'package:wildscan/features/Research/screen/chat_screen.dart';
import 'package:wildscan/features/Research/screen/new_post_screen.dart';
import 'package:wildscan/features/Research/widgets/post_card.dart';
import 'package:wildscan/features/Research/widgets/profile_story_card.dart';
import 'package:wildscan/features/Research/widgets/stroy_card.dart';
// ← path to Chat screen

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        title: Text('Add Post', style: TextStyle(color: scheme.onSurface)),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: scheme.onSurface),
        elevation: 0,
      ),
      body: const Center(child: Text('Add post content here')),
    );
  }
}

class ResearchCollaborationScreen extends StatelessWidget {
  ResearchCollaborationScreen({super.key});

  final controller = Get.put(ResearchCollabController());

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Research Collaboration',
          style: TextStyle(
            color: scheme.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: scheme.onSurface,
            onPressed: () => Get.to(() => ImagePickerScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.message),
            color: scheme.onSurface,
            onPressed: () => Get.to(() => ChatOverviewScreen()),
          ),
        ],
      ),

      // ─── BODY ────────────────────────────────────────────────
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ---- Stories ----
              SizedBox(
                height: 120,
                child: Obx(
                  () => ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      const ProfileStoryCard(),
                      ...controller.storyData.map(
                        (data) => StoryCard(
                          userName: data['userName']!,
                          profileImage: data['image']!,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ---- Posts ----
              ListView.builder(
                itemCount: controller.postData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) => PostCard(
                  likeImagesList: controller.likeImagesList,
                  postData: controller.postData[i],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
