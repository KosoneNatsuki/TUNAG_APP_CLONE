import 'package:flutter/material.dart';
import 'package:tunag_app_clone/src/login.dart';
import 'package:tunag_app_clone/src/new_registration.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // アンドロイドの戻るボタンが押されても何もしない
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            // TUNAGラベル
            const Align(
              alignment: Alignment(0, -0.3),
              child: Text(
                "TUNAGへようこそ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ボタンエリア
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 縦の中央に配置
                children: [
                  const SizedBox(height: 430), // 縦の中央から下にずらす
                  // ログインボタン
                  ElevatedButton(
                    // 押下処理
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF41ADBC),
                      fixedSize: const Size(320, 75),
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

                  // ボタン間
                  const SizedBox(height: 10),

                  // 新規登録ボタン
                  TextButton(
                    // 押下処理
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewRegistrationPage()),
                      );
                    },
                    child: const Text(
                      '新規登録',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
