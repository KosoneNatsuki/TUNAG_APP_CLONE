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

  // ボタンとテキスト作成関数
  Widget buttonTextItem(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          color: Colors.black,
          iconSize: 28,
          onPressed: onPressed,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

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
              child: buttonTextItem(
                Icons.border_color_rounded,
                "投稿する",
                () {
                  logger.i("投稿ボタン押下");
                },
              ),
            ),
          ),
          Container(
            width: double.infinity, // 横幅いっぱいに広げる
            height: 1, // 線の高さ
            color: const Color.fromARGB(255, 181, 180, 180), // 線の色
          ),

          // 投稿エリア
          SizedBox(
            width: double.infinity, // 幅を親要素に合わせる
            height: 520, // メイン高さを指定
            child: ListView(
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
                        // 以下レイアウト確認の為記載_後ほど削除
                        // const Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Icon(
                        //       // 仮
                        //       Icons.favorite,
                        //       color: Colors.pink,
                        //       size: 40,
                        //     ),
                        //     SizedBox(width: 15),
                        //     Text(
                        //       "テスト1",
                        //       style: TextStyle(fontSize: 15),
                        //     )
                        //   ],
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //     vertical: 20,
                        //     horizontal: 20,
                        //   ),
                        //   child: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         const Text(
                        //           "タイトル",
                        //           style: TextStyle(
                        //             fontSize: 25,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //         const SizedBox(height: 20),
                        //         Image.asset("images/Test1.jpg"), // 仮
                        //         const SizedBox(height: 15),
                        //         const Text("おすすめのお店です。"),
                        //         const SizedBox(height: 15),
                        //         const Icon(
                        //           Icons.favorite,
                        //           color: Colors.pink,
                        //           size: 30,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: double.infinity, // 横幅いっぱいに広げる
            height: 1, // 線の高さ
            color: const Color.fromARGB(255, 181, 180, 180), // 線の色
          ),

          // ヘッダー
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ホームボタン
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 30,
                  ),
                  child: buttonTextItem(
                    Icons.border_color_rounded,
                    "ホーム",
                    () {
                      logger.i("ホームボタン押下");
                    },
                  ),
                ),

                // マイページボタン
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 30,
                  ),
                  child: buttonTextItem(
                    Icons.border_color_rounded,
                    "マイページ",
                    () {
                      logger.i("マイページボタン押下");
                    },
                  ),
                ),
                // チャットボタン
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 30,
                  ),
                  child: buttonTextItem(
                    Icons.border_color_rounded,
                    "チャット",
                    () {
                      logger.i("チャットボタン押下");
                    },
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
