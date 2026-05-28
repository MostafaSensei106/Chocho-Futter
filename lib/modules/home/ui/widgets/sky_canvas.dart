import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'butterfly_painter.dart';
import 'animated_nebula.dart';

class SkyCanvas extends StatelessWidget {
  const SkyCanvas({
    super.key,
    required this.clock,
    required this.flapT,
    required this.driftT,
    required this.hueT,
    required this.shootT,
  });

  final double clock;
  final double flapT;
  final double driftT;
  final double hueT;
  final double shootT;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360 + kToolbarHeight + 24, // extend behind glass appbar
      child: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -0.3),
                radius: 0.9,
                colors: [
                  Color(0xFF14093E),
                  Color(0xFF08051E),
                  Color(0xFF06060F),
                ],
              ),
            ),
          ),

          // Animated nebula blobs
          const AnimatedNebula(
            color: Color(0xFF5530CC),
            width: 220,
            height: 140,
            left: -40,
            top: 30,
            duration: Duration(seconds: 9),
          ),
          const AnimatedNebula(
            color: Color(0xFF2A1580),
            width: 160,
            height: 110,
            right: -20,
            top: 80,
            duration: Duration(seconds: 11),
          ),
          const AnimatedNebula(
            color: Color(0xFF7040DD),
            width: 120,
            height: 85,
            right: 50,
            top: 5,
            duration: Duration(seconds: 7),
          ),

          // Main animated painter
          CustomPaint(
            size: const Size(double.infinity, 360),
            painter: ButterflyPainter(
              clock: clock,
              flapT: flapT,
              driftT: driftT,
              hueT: hueT,
              shootT: shootT,
            ),
          ),

          // Label — fade+slide in
          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child: const Text(
              'Papilio Nebula  ·  M3E-7',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF5A4A8A),
                fontSize: 10,
                letterSpacing: 2.5,
              ),
            )
                .animate()
                .fadeIn(delay: 600.ms, duration: 800.ms)
                .slideY(begin: 0.4, end: 0),
          ),
        ],
      ),
    );
  }
}
