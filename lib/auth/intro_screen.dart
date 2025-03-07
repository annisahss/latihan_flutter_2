import 'package:flutter/material.dart';

class IntroductionScreen2 extends StatefulWidget {
  const IntroductionScreen2({super.key});

  @override
  State<IntroductionScreen2> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen2> {
   final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> introData = [
    {
      "image": "assets/images/intro1.png",
      "title": "Selamat Datang!",
      "description":
          "Temukan fitur terbaik untuk kebutuhanmu dalam satu aplikasi.",
    },
    {
      "image": "assets/images/intro2.png",
      "title": "Kemudahan dalam Genggaman",
      "description":
          "Akses layanan kami kapan saja dan di mana saja dengan mudah.",
    },
    {
      "image": "assets/images/intro3.png",
      "title": "Mulai Sekarang!",
      "description": "Bergabunglah dengan kami dan nikmati pengalaman terbaik.",
    },
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: introData.length,
              itemBuilder: (context, index) => IntroPage(
                image: introData[index]["image"]!,
                title: introData[index]["title"]!,
                description: introData[index]["description"]!,
              ),
            ),
          ),

          // Indikator halaman (dot indicator)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              introData.length,
              (index) => buildDot(index, context),
            ),
          ),
          SizedBox(height: 20),

          // Tombol Next / Get Started
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex < introData.length - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                } else {
                  // Navigasi ke halaman utama setelah onboarding
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade800,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                currentIndex == introData.length - 1 ? "Get Started" : "Next",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk indikator halaman
  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: currentIndex == index ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.teal : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

// Halaman per-slide onboarding
class IntroPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const IntroPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 250), // Pastikan gambar ada di assets
          SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
       
