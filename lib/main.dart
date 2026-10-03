import 'package:flutter/material.dart';

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
        scaffoldBackgroundColor: const Color(0xFF000000), // Pure Black Dream11 Background
      ),
      home: const Dream11LoginScreen(),
    );
  }
}

class Dream11LoginScreen extends StatefulWidget {
  const Dream11LoginScreen({super.key});

  @override
  State<Dream11LoginScreen> createState() => _Dream11LoginScreenState();
}

class _Dream11LoginScreenState extends State<Dream11LoginScreen> {
  bool _is18PlusChecked = false;
  final TextEditingController _mobileController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // 🏆 CARCOS IMAGE LOGO (No Glow Container, Direct Image)
              Image.asset(
                'assets/logo.png',
                height: 45,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/Logo.png',
                    height: 45,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Text(
                      'CARCOS',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF38BDF8),
                        letterSpacing: 2,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 50),

              // 📱 MOBILE NUMBER INPUT (+91)
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF121418),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    const Text(
                      '🇮🇳  +91',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _mobileController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'Enter mobile',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🛑 18+ AGE CHECKBOX
              Row(
                crossAxisAlignment: CrossAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: _is18PlusChecked,
                      activeColor: const Color(0xFF38BDF8),
                      checkColor: Colors.black,
                      side: BorderSide(
                        color: Colors.grey.shade600,
                        width: 1.5,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _is18PlusChecked = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'I am above 18 years of age and accept the Terms & Conditions and Privacy policy',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // 🚀 CONTINUE BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _is18PlusChecked
                        ? const Color(0xFF38BDF8)
                        : Colors.white.withOpacity(0.12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: _is18PlusChecked ? 4 : 0,
                  ),
                  onPressed: _is18PlusChecked ? _navigateToHome : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CONTINUE',
                        style: TextStyle(
                          color: _is18PlusChecked
                              ? Colors.black
                              : Colors.white38,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                        color: _is18PlusChecked
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

// 🏠 HOME SCREEN WITH CARCOS LOGO IN HEADER
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF121418),
        elevation: 0,
        title: Image.asset(
          'assets/logo.png',
          height: 32,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            'assets/Logo.png',
            height: 32,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Text(
              'CARCOS',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF38BDF8),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.sports_esports, size: 80, color: Color(0xFF38BDF8)),
            const SizedBox(height: 16),
            const Text(
              'Welcome to CARCOS Arena!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Upcoming Tournaments will appear here',
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
