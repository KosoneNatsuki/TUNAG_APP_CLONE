import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // TUNAGラベル
          Container(
            alignment: const Alignment(0, -0.3), // 中央に配置
            child: const Text(
              "TUNAGへようこそ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),

          // ボタンエリア
        ],
      ),
    );
  }
}
