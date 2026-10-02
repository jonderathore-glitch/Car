import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const CarcosApp());
}

class CarcosApp extends StatelessWidget {
  const CarcosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CARCOS',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const SplashScreen(),
    );
  }
}

// 1. FULL SCREEN CUSTOM SPLASH SCREEN
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String _splashImageUrl = 'https://i.ibb.co/MkyNn4Fn/20261001-161822.png';

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const CarcosLoginScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5AA5DC),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            _splashImageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Text(
                'CARCOS',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. LOGIN SCREEN WITH FIXED LOGO ALIGNMENT
class CarcosLoginScreen extends StatefulWidget {
  const CarcosLoginScreen({super.key});

  @override
  State<CarcosLoginScreen> createState() => _CarcosLoginScreenState();
}

class _CarcosLoginScreenState extends State<CarcosLoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isAbove18Checked = false;

  final String _logoImageUrl = 'https://i.ibb.co/MkvCbLRZ/20261002-080144.png';
  final String _bgImageUrl = 'https://i.ibb.co/pv4s29Mt/20261002-085101.png';

  static const Color skyBlueAccent = Color(0xFF00E5FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Opacity(
              opacity: 0.50,
              child: Image.network(
                _bgImageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),

          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Color(0xCC000000),
                    Colors.transparent,
                  ],
                  stops: [0.3, 0.6, 1.0],
                ),
              ),
            ),
          ),

          // Main Form UI
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.help_outline, color: Colors.white70, size: 24),
                  ),
                  const SizedBox(height: 20),

                  // Fixed Logo Display
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.network(
                          _logoImageUrl,
                          errorBuilder: (context, error, stackTrace) {
                            return const Text(
                              'CARCOS',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Phone Input Container
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF101216),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _phoneController.text.length == 10 
                            ? skyBlueAccent 
                            : Colors.white24, 
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Image.network(
                            'https://flagcdn.com/w40/in.png',
                            width: 22,
                            height: 15,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '+91',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                            decoration: const InputDecoration(
                              counterText: "",
                              hintText: "Enter mobile",
                              hintStyle: TextStyle(color: Colors.white38, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            onChanged: (val) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Checkbox Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          value: _isAbove18Checked,
                          activeColor: skyBlueAccent,
                          checkColor: Colors.black,
                          side: const BorderSide(color: Colors.white38, width: 1.5),
                          onChanged: (val) {
                            setState(() {
                              _isAbove18Checked = val ?? false;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          "I am above 18 years of age and accept the Terms & Conditions and Privacy policy",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (_phoneController.text.length == 10 && _isAbove18Checked)
                            ? skyBlueAccent
                            : const Color(0xFF23242A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                      ),
                      onPressed: (_phoneController.text.length == 10 && _isAbove18Checked)
                          ? () {}
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'CONTINUE',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: (_phoneController.text.length == 10 && _isAbove18Checked)
                                  ? Colors.black
                                  : Colors.white38,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                            color: (_phoneController.text.length == 10 && _isAbove18Checked)
                                ? Colors.black
                                : Colors.white38,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
