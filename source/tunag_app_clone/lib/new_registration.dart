import 'package:flutter/material.dart';

class NewRegistationPage extends StatelessWidget {
  const NewRegistationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          alignment: const Alignment(0, 0),
          child: const Text(
            "TUNAG",
            style: TextStyle(
                color: Color(0xFF41ADBC),
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
