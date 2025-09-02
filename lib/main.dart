import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MindChatApp());
}

class MindChatApp extends StatelessWidget {
  const MindChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindChat AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.nunitoTextTheme(
          ThemeData.dark().textTheme,
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const LandingScreen(),
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Logo + title + slogan
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 70,
                    height: 70,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'MindChat AI',
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Your Mind, Your Safe Space',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Animated wording
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FadeAnimatedText(
                  'Your go-to AI therapist',
                  textStyle: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.cyanAccent,
                  ),
                  duration: const Duration(seconds: 3),
                ),
                FadeAnimatedText(
                  'Safe. Private. Always there.',
                  textStyle: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.cyanAccent,
                  ),
                  duration: const Duration(seconds: 3),
                ),
                FadeAnimatedText(
                  'Talk anytime, anywhere.',
                  textStyle: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.cyanAccent,
                  ),
                  duration: const Duration(seconds: 3),
                ),
              ],
            ),

            const Spacer(),

            // Sign Up Button
            SizedBox(
              width: 220,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // TODO: Navigate to SignupScreen
                },
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Divider with OR
            Row(
              children: [
                const Expanded(
                  child: Divider(color: Colors.white24, thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'OR',
                    style: GoogleFonts.nunito(color: Colors.white70),
                  ),
                ),
                const Expanded(
                  child: Divider(color: Colors.white24, thickness: 1),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Login Link
            GestureDetector(
              onTap: () {
                // TODO: Navigate to LoginScreen
              },
              child: Text(
                'Already have an account? Log In',
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  color: Colors.cyanAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
