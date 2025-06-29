import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class UserChatController extends GetxController {
  var messages = <Map<String, String>>[].obs;

  final inputController = TextEditingController();
  final scrollController = ScrollController();

  void sendMessage() {
    final text = inputController.text.trim();
    if (text.isNotEmpty) {
      messages.add({
        'text': text,
        'time': DateFormat('hh:mm a').format(DateTime.now()),
      });
      inputController.clear();
      scrollToBottom();
      update();
    }
  }

  void sendImageMessage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      messages.add({
        'image': picked.path,
        'time': DateFormat('hh:mm a').format(DateTime.now()),
      });
      scrollToBottom();
      update();
    }
  }

  void scrollToBottom() {
    Future.delayed(Duration(milliseconds: 300), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void deleteMessage(int index) {
    messages.removeAt(index);
  }

  @override
  void onClose() {
    inputController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
