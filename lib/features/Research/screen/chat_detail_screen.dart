import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:wildscan/features/Research/controller/user_chat_controller.dart';

class ChatDetailScreen extends StatelessWidget {
  final String name;
  const ChatDetailScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final controller = Get.put(UserChatController());

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        title: Text(name, style: TextStyle(color: scheme.onSurface)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: scheme.onSurface),
      ),
      body: Column(
        children: [
          // ── Message List ────────────────────────────────────────
          Expanded(
            child: Obx(
              () => ListView.builder(
                controller: controller.scrollController,
                padding: const EdgeInsets.all(12),
                itemCount: controller.messages.length,
                itemBuilder: (_, index) {
                  final msg = controller.messages[index];
                  final isMe = true; // all sent from user for demo
                  final time = msg['time']!;
                  return Align(
                    alignment: isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Dismissible(
                      key: Key(index.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) => controller.deleteMessage(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isMe ? scheme.primary : scheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (msg['text'] != null)
                              Text(
                                msg['text']!,
                                style: TextStyle(
                                  color: isMe
                                      ? scheme.onPrimary
                                      : scheme.onSurface,
                                  fontSize: 14,
                                ),
                              ),
                            if (msg['image'] != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(msg['image']!),
                                  width: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            const SizedBox(height: 4),
                            Text(
                              time,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // ── Input Bar ─────────────────────────────────────────────
          Divider(height: 1, color: scheme.outline),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                // Image Picker
                IconButton(
                  icon: const Icon(Icons.image_outlined),
                  color: scheme.onSurface,
                  onPressed: controller.sendImageMessage,
                ),

                // Text Field
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: scheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: controller.inputController,
                      style: TextStyle(color: scheme.onSurface),
                      decoration: const InputDecoration(
                        hintText: 'Message...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (_) => controller.update(),
                    ),
                  ),
                ),
                const SizedBox(width: 6),

                // Send Button
                CircleAvatar(
                  radius: 20,
                  backgroundColor: scheme.primary,
                  child: IconButton(
                    icon: const Icon(Icons.send, size: 18),
                    color: scheme.onPrimary,
                    onPressed: controller.sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
