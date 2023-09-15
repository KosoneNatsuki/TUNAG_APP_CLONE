import 'package:flutter/material.dart';

class NewRegistationPage extends StatelessWidget {
  const NewRegistationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          alignment: const Alignment(0, -0.3),
          child: const Text(
            "新規登録画面",
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
