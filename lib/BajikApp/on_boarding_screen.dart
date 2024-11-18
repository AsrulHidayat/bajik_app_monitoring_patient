import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bajik_app_monitoring_patient/BajikApp/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Welcome to MyApp",
      "description": "Discover new features and explore the world of possibilities.",
      "image": "assets/images/OnBoarding 1.svg",
    },
    {
      "title": "Stay Connected",
      "description": "Keep in touch with friends and family, anytime and anywhere.",
      "image": "assets/images/OnBoarding 2.svg",
    },
    {
      "title": "Achieve More",
      "description": "Reach your goals and unlock your potential with our tools.",
      "image": "assets/images/OnBoarding 3.svg",
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF4F75FF),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _onboardingData.length + 1,
                itemBuilder: (context, index) {
                  if (index == _onboardingData.length) {
                    return _buildFinalPage(context);
                  }
                  return OnboardingContent(
                    title: _onboardingData[index]["title"]!,
                    description: _onboardingData[index]["description"]!,
                    image: _onboardingData[index]["image"]!,
                  );
                },
              ),
            ),
            if (_currentPage < _onboardingData.length)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                        (index) => _buildDot(index),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: _currentPage == index ? 12.0 : 8.0,
      height: _currentPage == index ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : Colors.white54,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildFinalPage(BuildContext context) {
    return Stack(
      children: [
        // Gambar di bagian atas
        Positioned(
          top: -MediaQuery.of(context).size.height * 0.15,
          left: 0,
          right: 0,
          child: ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final imageWidth = constraints.maxWidth * 1;
                  return SvgPicture.asset(
                    "assets/images/Navigation Login Register.svg",
                    width: imageWidth,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),

        // Konten bawah
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 24.0),
              decoration: BoxDecoration(
                color: const Color(0xFF210D44).withOpacity(0.56),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "You're all set!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Start your journey with us by logging in or creating an account.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF4D91),
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(54),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to Register
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF4D91),
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(54),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}

class OnboardingContent extends StatelessWidget {
  final String title, description, image;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -MediaQuery.of(context).size.height * 0.15,
          left: 0,
          right: 0,
          child: ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final imageWidth = constraints.maxWidth * 1;
                  return image.endsWith('.svg')
                      ? SvgPicture.asset(
                    image,
                    width: imageWidth,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    image,
                    width: imageWidth,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 48.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
