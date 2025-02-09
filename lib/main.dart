import 'package:flutter/material.dart';
import 'package:pati_kampus_demo/screens/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _welcomeTextAnimation;
  late Animation<double> _welcomeTextSlideAnimation;
  late Animation<Color?> _backgroundColorAnimation;
   bool _isNavigating = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _logoAnimation = Tween<double>(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    
    _welcomeTextAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut), 
      ),
    );

    _welcomeTextSlideAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _backgroundColorAnimation = ColorTween(
      begin: Colors.white,
      end: const Color(0xFFBAE6FF),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

        _controller.forward().then((_) {
      // Navigasyon işlemi için güvenli kontrol
      if (mounted && !_isNavigating) {
        _isNavigating = true;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUpPage()),
        );
      }
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: screenWidth,
            height: screenHeight,
            color: _backgroundColorAnimation.value,
            child: Stack(
              children: [
                // Logo 
                Positioned(
                  top: screenHeight * 0.15 + _logoAnimation.value, 
                  left: (screenWidth - (screenWidth * 0.85)) / 2, 
                  child: Image.asset(
                    "assets/logo_pati.png",
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.5,
                  ),
                ),

                // "Hoş Geldiniz" Yazısı
                Positioned(
                  top: screenHeight * 0.50 + _welcomeTextSlideAnimation.value,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: _welcomeTextAnimation.value,
                    child: Text(
                      "HOŞ GELDİNİZ!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
