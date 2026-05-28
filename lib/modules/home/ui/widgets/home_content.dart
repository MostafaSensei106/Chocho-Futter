import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:m3e_collection/m3e_collection.dart';
import 'info_card.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
      child: Column(
        children: [
          const Text(
            'N I G H T  S K Y  E X P L O R E R',
            style: TextStyle(
              color: Color(0xFF6050AA),
              fontSize: 10,
              letterSpacing: 2.5,
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
          const SizedBox(height: 10),
          const Text(
                'Every star\ntells a story',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFE8D8FF),
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                  height: 1.3,
                  letterSpacing: 0.5,
                ),
              )
              .animate()
              .fadeIn(delay: 400.ms, duration: 700.ms)
              .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),
          const SizedBox(height: 24),
          Row(
                children: [
                  Expanded(
                    child: ButtonM3E(
                      onPressed: () {},
                      size: ButtonM3ESize.lg,
                      label: const Text('Explore Sky'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ButtonM3E(
                      onPressed: () {},
                      size: ButtonM3ESize.lg,
                      style: ButtonM3EStyle.outlined,
                      label: const Text('My Maps'),
                    ),
                  ),
                ],
              )
              .animate()
              .fadeIn(delay: 700.ms, duration: 500.ms)
              .slideY(begin: 0.2, end: 0),
          const SizedBox(height: 24),
          const InfoCard().animate().fadeIn(delay: 900.ms, duration: 500.ms),
        ],
      ),
    );
  }
}
