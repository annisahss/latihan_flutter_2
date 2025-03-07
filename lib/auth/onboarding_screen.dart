import 'package:flutter/material.dart';
import 'package:latihan_flutter/auth/main_screen.dart';
import 'package:latihan_flutter/auth/intro_page_1.dart';
import 'package:latihan_flutter/auth/intro_page_2.dart';
import 'package:latihan_flutter/auth/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);  
                });
            },  
            children: [
              IntroPage1(),
              IntroPage2(), 
              IntroPage3(), 
            ],
          ),

          // dot indicators
          Container(
            alignment: Alignment(0, 0.75),
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2); 
                  },
                  child:
                    Text('skip')
                ),

                SmoothPageIndicator(controller: _controller, count: 3, effect: WormEffect(),),

                onLastPage ?
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                        builder: (context) {
                            return LoginScreen();
                          },
                        ),
                        );
                      },
                      child: 
                        Text('done'),
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text('next'),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  

  }

