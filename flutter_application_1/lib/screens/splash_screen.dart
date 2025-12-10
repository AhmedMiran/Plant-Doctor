import 'dart:async';
import 'package:flutter/material.dart';
// using bundled/theme fonts instead of google_fonts
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait 2 seconds then go to HomeScreen
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      // Give the splash a strong primary background for branding
      backgroundColor: cs.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Use the placeholder asset as the app logo for now; fallback to icon
            SizedBox(
              width: 180,
              height: 180,
              child: ClipOval(
                child: Container(
                  color: cs.onPrimary.withAlpha((0.12 * 255).round()),
                  child: Center(
                    child: Image.asset(
                      'assets/images/plantDoctor.png',
                      width: 182,
                      height: 182,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.image_not_supported,
                        size: 64,
                        color: cs.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Builder(builder: (context) {
              final base = Theme.of(context).textTheme.titleLarge;
              final style = base?.copyWith(
                    color: cs.onPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    letterSpacing: 0.4,
                  ) ?? TextStyle(color: cs.onPrimary, fontSize: 22, fontWeight: FontWeight.w700);
              return Text('Plant Disease Detector', style: style);
            }),
          ],
        ),
      ),
    );
  }
}
