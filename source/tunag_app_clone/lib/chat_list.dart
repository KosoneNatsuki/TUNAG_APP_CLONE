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
            alignment: const Alignment(0, -0.3),
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
          Container(
            alignment: const Alignment(0, 0), // 中央に配置
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 縦の中央に配置
                children: [
                  const SizedBox(height: 430), // 縦の中央から下にずらす
                  // ログインボタン
                  ElevatedButton(
                    onPressed: () => print('clicked!2'),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF41ADBC),
                      fixedSize: const Size(320, 75),
                      // ボタン角丸
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'ログイン',
                      style: TextStyle(fontSize: 24, color: Color(0xFFFFFFFF)),
                    ),
                  ),

                  // ボタン間
                  const SizedBox(height: 10),

                  // 新規登録ボタン
                  TextButton(
                    onPressed: () => print('clicked!2'),
                    child: const Text(
                      '新規登録',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
