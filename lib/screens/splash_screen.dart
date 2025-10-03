import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.6, curve: Curves.easeIn)),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.2, 0.8, curve: Curves.elasticOut)),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.3, 1.0, curve: Curves.easeOut)),
    );

    _controller.forward();

    // Delay 3 seconds then go to onboarding
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFEF8F5),
              Color(0xFFFFF0F5),
              Color(0xFFF5F0FF),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background decorative elements
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFf283b6).withOpacity(0.1),
                      const Color(0xFFe06c9f).withOpacity(0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            
            Positioned(
              bottom: -80,
              left: -80,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFb5bfa1).withOpacity(0.1),
                      const Color(0xFF6e9887).withOpacity(0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            
            // Floating particles
            Positioned(
              top: 150,
              left: 80,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _controller.value * -20),
                    child: child,
                  );
                },
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFedbfb7).withOpacity(0.6),
                  ),
                ),
              ),
            ),
            
            Positioned(
              top: 300,
              right: 60,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _controller.value * 15),
                    child: child,
                  );
                },
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFf283b6).withOpacity(0.5),
                  ),
                ),
              ),
            ),
            
            Positioned(
              bottom: 200,
              left: 40,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_controller.value * 25, 0),
                    child: child,
                  );
                },
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFb5bfa1).withOpacity(0.4),
                  ),
                ),
              ),
            ),

            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Transform.translate(
                        offset: _slideAnimation.value,
                        child: child,
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo/Icon
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFf283b6), Color(0xFFe06c9f)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFe06c9f).withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.eco_rounded,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // App Name
                    const Text(
                      "BeHer",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2D2D2D),
                        letterSpacing: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Tagline
                    Text(
                      "Your Personal Skincare Journey",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF6e9887).withOpacity(0.8),
                        letterSpacing: 0.5,
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Loading indicator
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          const Color(0xFFe06c9f).withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom brand text
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _controller.value,
                    child: child,
                  );
                },
                child: Column(
                  children: [
                    Text(
                      "Empowering Your Natural Beauty",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF6B7280).withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "🌸 Skincare • Wellness • Confidence 🌸",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF6B7280).withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}