import 'package:flutter/material.dart';
import 'package:wildscan/utils/constraints/colors.dart';

const List<Map<String, String>> shareUsers = [
  {'name': 'John Doe', 'image': 'assets/user1.jpg'},
  {'name': 'Jane Smith', 'image': 'assets/user2.jpg'},
  {'name': 'Alice Johnson', 'image': 'assets/user3.jpg'},
  {'name': 'Bob Brown', 'image': 'assets/user4.jpg'},
  {'name': 'Charlie White', 'image': 'assets/user5.jpg'},
  {'name': 'Diana Green', 'image': 'assets/user6.jpg'},
];

class PostCard extends StatefulWidget {
  final Map<String, dynamic> postData;
  final List<String> likeImagesList;

  PostCard({super.key, required this.postData, required this.likeImagesList});
  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    final postData = widget.postData;
    final likeImagesList = widget.likeImagesList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// --- Post Header
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(postData['profileImage']),
                radius: 30,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postData['userName'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    postData['timeAgo'],
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  _showPostOptions(context);
                },
                child: const Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        /// --- Post Image
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            postData['postImage'],
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 10),

        /// --- Likes and actions row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: _LikesImages(likeImagesList: likeImagesList),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                  color: isLiked ? Colors.red : WildScanColors.black,
                ),
              ),
              const SizedBox(width: 2),
              const Text(
                "15",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => _showCommentsSheet(context),
                child: const Icon(
                  Icons.message_outlined,
                  color: WildScanColors.black,
                ),
              ),

              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => _showShareBottomSheet(context),
                child: const Icon(Icons.share, color: WildScanColors.black),
              ),

              const SizedBox(width: 2),
              const Text(
                "48",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => _showSaveToCollection(context),
                child: const Icon(
                  Icons.bookmark_border,
                  color: WildScanColors.black,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "View All 48 Comments",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ],
    );
  }
}

void _showShareBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF1C1C1E),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.75,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                /// --- Drag handle
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                /// --- Search Bar
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[800],
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: const Icon(
                      Icons.person_add_alt,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 16),

                /// --- User Grid
                Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                    itemCount: shareUsers.length,
                    itemBuilder: (context, index) {
                      final user = shareUsers[index];
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(user['image']!),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            user['name']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      );
                    },
                  ),
                ),

                /// --- Share Options Row
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _ShareOption(
                      icon: Icons.add_circle_outline,
                      label: "Add to story",
                    ),
                    _ShareOption(icon: Icons.send, label: "WhatsApp"),
                    _ShareOption(icon: Icons.link, label: "Copy link"),
                    _ShareOption(icon: Icons.share, label: "Share"),
                    _ShareOption(icon: Icons.snapchat, label: "Snapchat"),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void _showCommentsSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF1C1C1E), // Dark Instagram style
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollController) {
          return Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Text(
                "Comments",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: const [
                    _CommentTile(
                      userName: "itsausifahmed_",
                      comment: "IN SHA ALLAH 🙌",
                      time: "2d",
                      profileUrl: "assets/user1.jpg",
                    ),
                    _CommentTile(
                      userName: "pathan_hassaan_khan",
                      comment: "Inshallah",
                      time: "6d",
                      profileUrl: "assets/user2.jpg",
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "This reel has 88 comments from Facebook.",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              /// --- Emojis and Input
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage("assets/my_profile.jpg"),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Add a comment...",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(Icons.favorite, color: Colors.red),
                    const SizedBox(width: 6),
                    const Icon(Icons.emoji_emotions, color: Colors.yellow),
                    const SizedBox(width: 6),
                    const Icon(Icons.fireplace, color: Colors.orange),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

class _ShareOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ShareOption({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _CommentTile extends StatelessWidget {
  final String userName;
  final String comment;
  final String time;
  final String profileUrl;

  const _CommentTile({
    required this.userName,
    required this.comment,
    required this.time,
    required this.profileUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(profileUrl)),
      title: Text(
        userName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
      trailing: const Icon(Icons.favorite_border, color: Colors.white),
    );
  }
}

void _showSaveToCollection(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF1C1C1E),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            /// --- Saved section
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.bookmark, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saved",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Private",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.bookmark_border, color: Colors.white),
              ],
            ),

            const SizedBox(height: 20),

            /// --- Collections section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Collections",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "New collection",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// Example collection item
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/p4.jpg',
                ), // Replace with actual image
              ),
              title: const Text("u", style: TextStyle(color: Colors.white)),
              subtitle: const Text(
                "Private",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: const Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
              onTap: () {}, // Save to this collection
            ),

            /// Create collaborative collection
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.group, color: Colors.white),
              ),
              title: const Text(
                "Create a collaborative collection",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                "Save posts to a collection with friends",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {}, // Navigate to create collection screen
            ),

            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}

void _showPostOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF1C1C1E), // dark background like Instagram
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top indicator
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            // Row of top icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _OptionIcon(icon: Icons.bookmark_border, label: "Save"),
                _OptionIcon(icon: Icons.loop, label: "Remix"),
                _OptionIcon(icon: Icons.qr_code, label: "QR code"),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(color: Colors.grey),

            // List of actions
            ListTile(
              leading: const Icon(Icons.star_border, color: Colors.white),
              title: const Text(
                "Add to favorites",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(
                Icons.person_remove_outlined,
                color: Colors.white,
              ),
              title: const Text(
                "Unfollow",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(
                Icons.visibility_off_outlined,
                color: Colors.white,
              ),
              title: const Text("Hide", style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.white),
              title: const Text(
                "About this account",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(
                Icons.report_gmailerrorred_outlined,
                color: Colors.redAccent,
              ),
              title: const Text(
                "Report",
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    },
  );
}

class _OptionIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _OptionIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _LikesImages extends StatelessWidget {
  final List<String> likeImagesList;

  const _LikesImages({required this.likeImagesList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          for (int index = 0; index < likeImagesList.length; index++)
            Positioned(
              left: 26.0 * index,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.white),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(likeImagesList[index]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
