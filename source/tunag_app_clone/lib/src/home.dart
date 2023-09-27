import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  final String userId; // ユーザーIDを保持するフィールド

  HomePage({super.key, required this.userId});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // デフォルト表示の戻るボタン非表示設定
        backgroundColor: const Color(0xFF41ADBC),
        toolbarHeight: 100,
        centerTitle: true, // タイトルをcenterに設定
        title: const Center(
            child: Text(
          "タイムライン",
          style: TextStyle(
            fontSize: 30,
            color: Color(0xFFFFFFFF),
          ),
        )),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          // 検索エリア
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 65,
            ),
            child: TextField(
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "検索ワードを入力してください",
                hintMaxLines: 5,
                prefixIcon: IconButton(
                  onPressed: () {
                    // デバック
                    var logger = Logger();
                    // アイコンが押下されたときの処理
                    logger.i(" 検索アイコン押下されました");
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Center(
                  //アプリ内から画像を表示
                  child: Image.network(
                    'https://via.placeholder.com/150',
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
