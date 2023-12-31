import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tunag_app_clone/src/start.dart';

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
      home: StartUpPage(title: 'TUNAG'),
      debugShowCheckedModeBanner: false, // 右上のデバッグ用バナー非表示設定
    );
  }
}

// 画面はStartUpPage関数内で作成
class StartUpPage extends StatefulWidget {
  const StartUpPage({super.key, required this.title});

  final String title;

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
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
          MaterialPageRoute(builder: (context) => const StartPage()),
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
    return WillPopScope(
      onWillPop: () async {
        // アンドロイドの戻るボタンが押されても何もしない
        return false;
      },
      child: Scaffold(
        // メインエリア
        body: Center(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center, // 横縦の中央に配置
              children: [
                // TUNAGラベルの背景色
                Container(
                  width: 411,
                  height: 92,
                  color: const Color(0xFF41ADBC),
                ),

                //TUNAGラベル
                const Text(
                  "TUNAG",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
