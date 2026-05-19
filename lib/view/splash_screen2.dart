import 'package:flutter/material.dart';
import 'package:flutter_application_29/view/login_page.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Jobspot',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B0061),
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 5,
              child: Center(
                child: Image.asset('assets/images/2.png', fit: BoxFit.contain),
              ),
            ),

            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Find Your ',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          height: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: 'Dream Job',
                            style: TextStyle(color: Color(0xFFF4A100)),
                          ),
                          TextSpan(text: ' Here!'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Explore all the most exciting job roles based\non your interest and study major.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 32),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginPage()),
                        );
                      },
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Color(0xFF1B0061),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 24),
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
