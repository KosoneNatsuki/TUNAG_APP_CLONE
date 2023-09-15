import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tunag_app_clone/new_registration.dart';
import 'package:tunag_app_clone/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: 1070,
          height: 2400,
          child: Column(
            children: [
              // 要素間
              const SizedBox(height: 90),

              // TUNAGラベル
              const Text(
                "TUNAG",
                style: TextStyle(
                    color: Color(0xFF41ADBC),
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),

              // 要素間
              const SizedBox(height: 80),

              // 入力項目
              SizedBox(
                width: 330,
                child: Column(
                  children: [
                    // メールアドレス
                    Column(
                      children: [
                        Container(
                          alignment: const Alignment(-1, 0),
                          child: const Text(
                            "メールアドレス",
                            style: TextStyle(
                              color: Color(0xFF41ADBC),
                              fontSize: 12,
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

                    // 要素間
                    const SizedBox(height: 10),

                    // パスワード
                    Column(
                      children: [
                        Container(
                          alignment: const Alignment(-1, 0),
                          child: const Text(
                            "パスワード",
                            style: TextStyle(
                              color: Color(0xFF41ADBC),
                              fontSize: 12,
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

              // 要素間
              const SizedBox(height: 70),

              // ログインボタン
              ElevatedButton(
                // 押下処理
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF41ADBC),
                  fixedSize: const Size(320, 75),
                  // ボタン角丸
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'ログイン',
                  style: TextStyle(fontSize: 24, color: Color(0xFFFFFFFF)),
                ),
              ),

              // 要素間
              const SizedBox(height: 30),

              // 新規登録ボタン
              const Text("まだ登録していない方はこちらから"),
              TextButton(
                // 押下処理
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewRegistationPage()),
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

              // 要素間
              const SizedBox(height: 180),

              const Text(
                "待期期間 開発演習 9/1~",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }
}
