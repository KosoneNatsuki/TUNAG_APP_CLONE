import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // デフォルト表示の戻るボタン非表示設定
        backgroundColor: const Color(0xFF41ADBC),
        toolbarHeight: 100,
        centerTitle: true,
        title: const Center(
            child: Text(
          "タイムライン",
          style: TextStyle(
            fontSize: 30,
            color: Color(0xFFFFFFFF),
          ),
        )),
      ),
      body: Stack(children: [
        Container(
          alignment: const Alignment(0, 0),
          child: const Text(
            "ホーム",
            style: TextStyle(
                color: Color(0xFF41ADBC),
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
