import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../themes/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.forest,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => context.go('/welcome'),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150, height: 150,
                  child: CustomPaint(painter: _RingsPainter()),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Rootline',
                  style: TextStyle(
                    fontFamily: 'Fraunces', fontWeight: FontWeight.w600,
                    fontSize: 30, color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'DISCOVER YOUR ROOTS',
                  style: TextStyle(
                    fontSize: 12.5, letterSpacing: 2, color: Color(0xFFC9BFA6),
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 46,
              child: Text(
                'Tap anywhere to continue',
                style: TextStyle(fontSize: 11.5, letterSpacing: 1, color: Color(0xFF8FA396)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RingsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final rings = [
      (52.0, const Color(0xFF3E5747)),
      (40.0, const Color(0xFF4C6B56)),
      (28.0, const Color(0xFF5A7D63)),
      (16.0, AppColors.gold),
    ];
    for (final (radius, color) in rings) {
      canvas.drawCircle(
        center, radius * (size.width / 120),
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.4,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
