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
        scaffoldBackgroundColor: const Color(0xFF000000), // Pure Black Dream11 Style
      ),
      home: const Dream11LoginScreen(),
    );
  }
}

// ---------------------------------------------------------------------------
// 1. DREAM11 STYLE LOGIN SCREEN
// ---------------------------------------------------------------------------
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

              // 🏆 CARCOS DIRECT IMAGE LOGO (No Glowing Box)
              Image.asset(
                'assets/logo.png',
                height: 48,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/Logo.png',
                    height: 48,
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

// ---------------------------------------------------------------------------
// 2. HOME SCREEN (ESPORTS DASHBOARD)
// ---------------------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0F12),
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
          crossAxisAlignment: CrossAlignment.start,
          children: [
            // 🎮 CATEGORY TABS
            Row(
              children: [
                _buildCategoryChip('BGMI', true),
                const SizedBox(width: 8),
                _buildCategoryChip('Free Fire', false),
                const SizedBox(width: 8),
                _buildCategoryChip('COD Mobile', false),
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

            // 🏆 MATCH CARD SAMPLE
            _buildMatchCard(
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

  static Widget _buildCategoryChip(String title, bool isSelected) {
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

  static Widget _buildMatchCard({
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
        crossAxisAlignment: CrossAlignment.start,
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
                crossAxisAlignment: CrossAlignment.start,
                children: [
                  Text('Prize Pool', style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                  Text(prizePool, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAlignment.end,
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
}
