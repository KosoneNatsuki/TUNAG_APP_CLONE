import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:tunag_app_clone/src/home.dart';
import 'package:tunag_app_clone/src/login.dart';

class NewRegistrationPage extends StatefulWidget {
  const NewRegistrationPage({super.key});

  @override
  NewRegistrationPageState createState() => NewRegistrationPageState();
}

class NewRegistrationPageState extends State<NewRegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 変数定義
  // 新規登録したユーザーのIDを保持
  String registerUserId = '';
  bool validateFlag = false;

  // 登録データ
  Future<void> registerUser(context) async {
    // 変数定義
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    var logger = Logger(); // デバック

    final data = {
      'name': name,
      'email': email,
      'password': password,
    };
    final body = json.encode(data);

    final response = await http.post(
      Uri.parse('http://192.168.3.23:8080/add'), // 登録用のエンドポイントを指定
      headers: <String, String>{'Content-Type': 'application/json'},
      body: body,
    );

    // HTTPリクエストが正常に処理された場合（HTTPステータスコードが200）
    if (response.statusCode == 200) {
      // レスポンスデータからユーザーIDを取得
      final responseData = json.decode(response.body);
      final userId = responseData['userId'];

      logger.i("validateFlag: $validateFlag");
      logger.i(validateFlag);

      // 登録成功時にホーム画面に遷移
      if (userId != null && validateFlag == true) {
        // ユーザーIDが取得できた場合、registerUserIdに設定し、ホーム画面に遷移
        setState(() {
          registerUserId = userId.toString();
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            // ホーム画面にUserIDを渡す
            builder: (context) => HomePage(userId: registerUserId),
          ),
        );
      } else {
        // ユーザーIDが取得できなかった場合の処理（エラーポップアップなど）
        _showErrorPopup(context, "ユーザーIDが取得できませんでした。");
      }
    } else {
      String message = nameController.text.isEmpty
          ? "名前を入力してください。"
          : emailController.text.isEmpty
              ? "メールアドレスを入力してください。"
              : passwordController.text.isEmpty
                  ? "パスワードを入力してください。"
                  : "登録に失敗しました。正しい情報を入力してください。";
      _showErrorPopup(context, message);
    }
  }

  // エラー時に表示するポップアップ
  void _showErrorPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("エラー"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        // スクロール可能になる
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 90),

              // TUNAGラベル
              const Text(
                "TUNAG",
                style: TextStyle(
                  color: Color(0xFF41ADBC),
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // 入力項目エリア
              SizedBox(
                width: 330,
                height: 330,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // 名前
                    TextFormField(
                      controller: nameController,
                      maxLength: 10,
                      maxLengthEnforcement:
                          MaxLengthEnforcement.enforced, //最大桁数以上は入力不可
                      decoration: const InputDecoration(
                        hintText: "たろう",
                        labelText: "名前",
                        hintStyle: TextStyle(fontSize: 14),
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next, // 次の項目に行く
                    ),

                    // メールアドレス
                    TextFormField(
                      controller: emailController,
                      maxLength: 255,
                      maxLengthEnforcement:
                          MaxLengthEnforcement.enforced, //最大桁数以上は入力不可
                      decoration: const InputDecoration(
                        suffixText: '@gmail.com',
                        labelText: "メールアドレス",
                        hintStyle: TextStyle(fontSize: 14),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next, // 次の項目に行く
                    ),

                    // パスワード
                    TextFormField(
                      controller: passwordController,
                      maxLength: 20,
                      maxLengthEnforcement:
                          MaxLengthEnforcement.enforced, //最大桁数以上は入力不可
                      obscureText: true, // 入力文字を*で隠す
                      obscuringCharacter: '*', // 隠す文字を指定
                      decoration: const InputDecoration(
                        labelText: "パスワード",
                        hintText: "英数字で入力してください",
                        hintStyle: TextStyle(fontSize: 14),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.send, // 送信
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // 登録ボタン
              ElevatedButton(
                onPressed: () {
                  // テキストフィールドが空かのフラグ設定
                  setState(() {
                    List<TextEditingController> controllers = [
                      nameController,
                      emailController,
                      passwordController
                    ];
                    validateFlag = controllers
                        .every((controller) => controller.text.isNotEmpty);
                  });
                  registerUser(context); // ユーザーを登録(22行目実行)
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 75),
                  backgroundColor: const Color(0xFF41ADBC),
                  // ボタン角丸
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  '登録',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // 新規登録ラベル
              Center(
                child: SizedBox(
                  width: 330,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end, // 中央に配置
                    children: [
                      const Text("すでに登録している方はこちらから"),
                      TextButton(
                        // 押下処理
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          'ログイン',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 135),
                      // 待期期間ラベル
                      const Text(
                        "待期期間 開発演習 9/1~",
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
