import 'package:flutter/material.dart';
import 'package:latihan_flutter/auth/detail_quiz.dart';
import 'package:latihan_flutter/utils/constant/app_image.dart';


// import 'package:introduction_screen/introduction_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImage.bgLogin2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Image(
                    image: AssetImage(AppImage.logo),
                    width: 160,
                    height: 160,
                  ),
                  SizedBox(height: 100,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter your name",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "John Deh...",
                    hintStyle: TextStyle(color: Color(0xffE9EAED)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizScreen()),
                      );
                    },
                    child: Text("Start"),
                  ),
                ),
                ],
              ),
            ),
          ),   
            ),
          );
  }
}
