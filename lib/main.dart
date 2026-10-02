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

// 1. SPLASH SCREEN
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Image.asset(
                  '20261002_080144.png',
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),
              const CircularProgressIndicator(
                color: Color(0xFF00E5FF),
                strokeWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. LOGIN SCREEN
class CarcosLoginScreen extends StatefulWidget {
  const CarcosLoginScreen({super.key});

  @override
  State<CarcosLoginScreen> createState() => _CarcosLoginScreenState();
}

class _CarcosLoginScreenState extends State<CarcosLoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isAbove18Checked = false;

  static const Color skyBlueAccent = Color(0xFF00E5FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
              const SizedBox(height: 30),

              // LOGO
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Image.asset(
                  '20261002_080144.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 50),

              // MOBILE NUMBER INPUT
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

              // CHECKBOX
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

              const SizedBox(height: 30),

              // CONTINUE BUTTON
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
    );
  }
}
