import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0B28),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2A1F5A), width: 0.8),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_border, color: Color(0xFF8860FF), size: 28)
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scaleXY(
                begin: 1.0,
                end: 1.18,
                duration: 1200.ms,
                curve: Curves.easeInOut,
              ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Papilio Nebula visible tonight',
                  style: TextStyle(color: Color(0xFFD0C0FF), fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  'Best viewing: 22:30 – 02:00',
                  style: TextStyle(color: Color(0xFF6050AA), fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF5040AA),
            size: 14,
          ),
        ],
      ),
    );
  }
}
