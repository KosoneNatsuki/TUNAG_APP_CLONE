import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:tunag_app_clone/src/home.dart';
import 'package:tunag_app_clone/src/new_registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ログイン処理
  void loginUser(context) async {
    Map data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    var body = json.encode(data);

    final response = await http.post(
      Uri.parse('http://192.168.3.23:8080/login'), // 登録用のエンドポイントを指定
      headers: <String, String>{'Content-Type': 'application/json'},
      body: body,
    );

    // デバック
    var logger = Logger();

    // HTTPリクエストが正常に処理された場合（HTTPステータスコードが200）
    if (response.statusCode == 200) {
      logger.i("ログイン成功");
      // ログイン成功時にホーム画面に遷移
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      logger.i("ログイン失敗");
      // エラーメッセージを表示する
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("ログインエラー"),
            content: const Text("ログインに失敗しました。正しい情報を入力してください。"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ダイアログを閉じる
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
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
                  fontSize: 45,
                  color: Color(0xFF41ADBC),
                  fontWeight: FontWeight.bold,
                ),
              ),

              // 入力項目エリア
              SizedBox(
                width: 330,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // メールアドレス
                    Column(
                      children: [
                        Container(
                          alignment: const Alignment(-1.0, 0.0),
                          child: const Text(
                            "メールアドレス",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF41ADBC),
                            ),
                          ),
                        ),
                        TextField(
                          controller: emailController,
                          maxLength: 255,
                          maxLengthEnforcement:
                              MaxLengthEnforcement.enforced, //最大桁数以上は入力不可
                          decoration: const InputDecoration(
                              hintText: "aaa@gmail.com",
                              hintStyle: TextStyle(
                                fontSize: 14,
                              )),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction:
                              TextInputAction.next, // 入力完了時、次の項目に行く
                        ),
                      ],
                    ),

                    // パスワード
                    Column(
                      children: [
                        Container(
                          alignment: const Alignment(-1.0, 0.0),
                          child: const Text(
                            "パスワード",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF41ADBC),
                            ),
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          maxLength: 20,
                          maxLengthEnforcement:
                              MaxLengthEnforcement.enforced, //最大桁数以上は入力不可
                          obscureText: true, //入力文字隠す
                          obscuringCharacter: '*', //隠す文字を*で表示
                          decoration: const InputDecoration(
                              hintText: "英数字で入力してください",
                              hintStyle: TextStyle(
                                fontSize: 14,
                              )),
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.send,
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // ログインボタン
              ElevatedButton(
                onPressed: () {
                  loginUser(context); // ユーザーをログイン(22行目実行)
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
                  'ログイン',
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
                      const Text("まだ登録していない方はこちらから"),
                      TextButton(
                        // 押下処理
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NewRegistrationPage()),
                          );
                        },
                        child: const Text(
                          '新規登録',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 215),
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
