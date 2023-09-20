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
                // 押下処理
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                  print("メールアドレス: ${emailController.text}");
                  print("パスワード: ${passwordController.text}");
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
                                builder: (context) => NewRegistationPage()),
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
