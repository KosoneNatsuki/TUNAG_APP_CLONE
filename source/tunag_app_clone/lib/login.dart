import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          alignment: const Alignment(0, -0.3),
          child: const Text(
            "ログイン画面",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
