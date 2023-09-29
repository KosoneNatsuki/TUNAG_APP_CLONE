import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  final String userId; // ユーザーIDを保持するフィールド

  const HomePage({super.key, required this.userId});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var logger = Logger();

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
          ),
        ),
      ),

      // メインエリア
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
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
          // 投稿ボタン
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.border_color_rounded),
                    color: Colors.black,
                    iconSize: 28,
                    onPressed: () {
                      // アイコンが押下されたときの処理
                      logger.i("投稿ボタン押下");
                    },
                  ),
                  const Text(
                    "投稿する",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity, // 横幅いっぱいに広げる
            height: 1, // 線の高さ
            color: Colors.grey, // 線の色
          ),

          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            // 仮
                            Icons.favorite,
                            color: Colors.pink,
                            size: 40,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "テスト1",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "タイトル",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Image.asset("images/Test1.jpg"), // 仮
                              const SizedBox(height: 15),
                              const Text("おすすめのお店です。"),
                              const SizedBox(height: 15),
                              const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity, // 横幅いっぱいに広げる
            height: 1, // 線の高さ
            color: Colors.grey, // 線の色
          ),
        ]),
      ),
    );
  }
}
