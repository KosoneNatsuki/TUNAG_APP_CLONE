import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF41ADBC),
        title: const Text(
          "チャット",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
