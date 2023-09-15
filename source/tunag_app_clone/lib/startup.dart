import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tunag_app_clone/start.dart';

void main() {
  // MyApp関数を呼び出す
  runApp(const MyApp());
}

// MyAppクラス
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // タイトル・テーマを設定
    return const MaterialApp(
      title: 'TUNAG_CLONE',
      home: StartPage(title: 'TUNAG'),
      debugShowCheckedModeBanner: false, // 右上のデバッグ用バナー非表示設定
    );
  }
}

// 画面はStartPage関数内で作成
class StartPage extends StatefulWidget {
  const StartPage({super.key, required this.title});
  final String title;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // Timerを宣言
  Timer? timer;
  // 画面初期化時に呼ばれる関数
  // タイマーをスタート

  @override
  void initState() {
    super.initState();

    // Timerインスタンス作成
    timer = Timer(
      const Duration(seconds: 3), // 3秒
      () {
        // チャット一覧画面に遷移
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatList()),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    // タイマー停止
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // 以下で表示する画面を構成する
    return Scaffold(
      // メインエリア
      body: Stack(
        children: [
          // TUNAGラベルの背景色
          Container(
            alignment: const Alignment(0.0, 0.0), // 中央に配置
            child: Container(
              width: 411,
              height: 92,
              decoration: const BoxDecoration(color: Color(0xFF41ADBC)),
            ),
          ),

          //TUNAGラベル
          Container(
            alignment: const Alignment(0.0, 0.0), // 中央に配置
            child: const Text(
              "TUNAG",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
