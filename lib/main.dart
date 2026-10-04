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
        scaffoldBackgroundColor: const Color(0xFF0D0F12),
      ),
      home: const SplashScreen(),
    );
  }
}

// ---------------- 1. FULL SCREEN SPLASH SCREEN ----------------
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
            transitionDuration: const Duration(milliseconds: 700),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              _splashImageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: const Color(0xFF62AADC),
                child: const Center(
                  child: Icon(Icons.emoji_events, size: 80, color: Colors.white),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- 2. DREAM11 STYLE LOGIN SCREEN ----------------
class CarcosLoginScreen extends StatefulWidget {
  const CarcosLoginScreen({super.key});

  @override
  State<CarcosLoginScreen> createState() => _CarcosLoginScreenState();
}

class _CarcosLoginScreenState extends State<CarcosLoginScreen> {
  bool _is18PlusChecked = true;
  final TextEditingController _mobileController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    if (_mobileController.text.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 10-digit mobile number')),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0F12),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.help_outline, color: Colors.white70, size: 18),
            label: const Text('Help', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAlignment.start,
            children: [
              const SizedBox(height: 10),

              // CARCOS TEXT LOGO
              const Center(
                child: Column(
                  children: [
                    Text(
                      'CARCOS',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.black,
                        color: Color(0xFF38BDF8),
                        letterSpacing: 3,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Play Esports & Win Real Cash',
                      style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                'ENTER MOBILE NUMBER',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),

              // MOBILE NUMBER INPUT FIELD (+91)
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF161B22),
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
                    const Text('|', style: TextStyle(color: Colors.white24, fontSize: 20)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _mobileController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintText: '00000 00000',
                          hintStyle: TextStyle(color: Colors.white24, fontSize: 16),
                          border: InputBorder.none,
                          counterText: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 18+ CHECKBOX
              Row(
                crossAlignment: CrossAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: _is18PlusChecked,
                      activeColor: const Color(0xFF38BDF8),
                      checkColor: Colors.black,
                      side: BorderSide(color: Colors.grey.shade600, width: 1.5),
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
                      'I agree that I am 18+ years old & accept the T&C and Privacy Policy.',
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 12, height: 1.3),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // CONTINUE BUTTON
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _is18PlusChecked ? const Color(0xFF38BDF8) : Colors.white10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                    elevation: _is18PlusChecked ? 4 : 0,
                  ),
                  onPressed: _is18PlusChecked ? _navigateToHome : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GET OTP',
                        style: TextStyle(
                          color: _is18PlusChecked ? Colors.black : Colors.white38,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 20, color: _is18PlusChecked ? Colors.black : Colors.white38),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // GOOGLE LOGIN BUTTON
              Center(
                child: Column(
                  children: [
                    Text('OR CONNECT WITH', style: TextStyle(color: Colors.grey.shade600, fontSize: 11, letterSpacing: 1)),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white.withOpacity(0.15)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      ),
                      onPressed: _navigateToHome,
                      icon: const Icon(Icons.g_mobiledata, color: Colors.white, size: 28),
                      label: const Text('Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- 3. HOME SCREEN ----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildCategoryChip(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF38BDF8) : const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget buildMatchCard({
    required String title,
    required String time,
    required String prizePool,
    required String entryFee,
    required int slotsJoined,
    required int totalSlots,
  }) {
    double progress = slotsJoined / totalSlots;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAlignment: CrossAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: const TextStyle(color: Color(0xFF38BDF8), fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'SOLO',
                  style: TextStyle(color: Colors.amber, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAlignment: CrossAlignment.start,
                children: [
                  Text('Prize Pool', style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                  Text(prizePool, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              Column(
                crossAlignment: CrossAlignment.end,
                children: [
                  Text('Entry Fee', style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                  Text(entryFee, style: const TextStyle(color: Color(0xFF38BDF8), fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white10,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF38BDF8)),
            minHeight: 6,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$slotsJoined / $totalSlots joined', style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
              Text('${totalSlots - slotsJoined} spots left', style: const TextStyle(color: Colors.amber, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0F12),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121418),
        elevation: 0,
        title: const Text(
          'CARCOS',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF38BDF8),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          Container(
            margin: const EdgeInsets.only(right: 12, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF1E242C),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF38BDF8).withOpacity(0.3)),
            ),
            child: const Row(
              children: [
                Icon(Icons.account_balance_wallet, color: Color(0xFF38BDF8), size: 16),
                SizedBox(width: 6),
                Text(
                  '₹0.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAlignment: CrossAlignment.start,
          children: [
            Row(
              children: [
                buildCategoryChip('BGMI', true),
                const SizedBox(width: 8),
                buildCategoryChip('Free Fire', false),
                const SizedBox(width: 8),
                buildCategoryChip('COD Mobile', false),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Upcoming Matches',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            buildMatchCard(
              title: 'BGMI Solo Erangel - Squad War #102',
              time: 'Today, 09:00 PM',
              prizePool: '₹5,000',
              entryFee: '₹50',
              slotsJoined: 38,
              totalSlots: 100,
            ),
          ],
        ),
      ),
    );
  }
}
