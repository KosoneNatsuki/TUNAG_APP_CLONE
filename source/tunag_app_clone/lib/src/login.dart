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

  // ログインしたユーザーのIDを保持するフィールド
  String loginUserId = '';

  // 入力した値を格納
  Future<void> loginUser(context) async {
    final email = emailController.text;
    final password = passwordController.text;

    final data = {
      'email': email,
      'password': password,
    };
    final body = json.encode(data);

    final response = await http.post(
      Uri.parse('http://192.168.3.23:8080/login'), // 登録用のエンドポイントを指定
      headers: <String, String>{'Content-Type': 'application/json'},
      body: body,
    );

    // デバック
    var logger = Logger();

    // HTTPリクエストが正常に処理された場合（HTTPステータスコードが200）
    if (response.statusCode == 200) {
      // レスポンスデータからユーザーIDを取得
      final responseData = json.decode(response.body);
      final userId = responseData['userId'];

      // ログイン成功時にホーム画面に遷移
      if (userId != null) {
        // ユーザーIDが取得できた場合、loginUserIdに設定し、ホーム画面に遷移
        setState(() {
          loginUserId = userId.toString();
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            // ホーム画面にUserIDを渡す
            builder: (context) => HomePage(userId: loginUserId),
          ),
        );
        // ユーザーIDが取得出来なかった場合、エラーポップアップを表示
      } else {
        _showErrorPopup(context, "ユーザーIDが違います。");
      }
      // ログイン失敗処理した場合、エラーポップアップを表示
    } else {
      logger.i("ログイン失敗");
      _showErrorPopup(context, "ログインに失敗しました。正しい情報を入力してください。");
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

  // ログイン画面レイアウト
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // スクロール可能になる
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    TextField(
                      controller: emailController,
                      maxLength: 255,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: const InputDecoration(
                        hintText: "aaa@gmail.com",
                        labelText: "メールアドレス",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),

                    // パスワード
                    TextField(
                      controller: passwordController,
                      maxLength: 20,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      obscureText: true, // 入力文字を*で隠す
                      obscuringCharacter: '*', // 隠す文字を指定
                      decoration: const InputDecoration(
                        labelText: "パスワード",
                        hintText: "英数字で入力してください",
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.send,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // ログインボタン
              ElevatedButton(
                onPressed: () => loginUser(context), // ユーザーをログイン(22行目実行)
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 75),
                  backgroundColor: const Color(0xFF41ADBC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // ボタン角丸
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
