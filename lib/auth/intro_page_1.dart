import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image: AssetImage(AppImage.IntroPage1()),
          Text('Selamat Datang!'),
        ],
      ),
    );

  }
}
