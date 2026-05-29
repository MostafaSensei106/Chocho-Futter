import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/utils/theme/app_theme.dart';
import '../../../../core/widgets/background/animated_star_background_component.dart';

import 'animated_nebula.dart';
import 'butterfly_painter.dart';

class SkyCanvas extends StatelessWidget {
  const SkyCanvas({
    required this.clock,
    required this.flapT,
    required this.driftT,
    required this.hueT,
    required this.shootT,
    super.key,
  });

  final double clock;
  final double flapT;
  final double driftT;
  final double hueT;
  final double shootT;

  @override
  Widget build(BuildContext context) {
    final cosmosTheme = Theme.of(context).extension<CosmosThemeExtension>()!;

    return SizedBox(
      height: 360 + kToolbarHeight + 24, // extend behind glass appbar
      child: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0, -0.3),
                radius: 0.9,
                colors: cosmosTheme.skyGradientColors,
              ),
            ),
          ),

          const AnimatedStarBackgroundComponent(),

          // Animated nebula blobs
          AnimatedNebula(
            color: cosmosTheme.nebulaColors[0],
            width: 220,
            height: 140,
            left: -40,
            top: 30,
            duration: const Duration(seconds: 9),
          ),
          AnimatedNebula(
            color: cosmosTheme.nebulaColors[1],
            width: 160,
            height: 110,
            right: -20,
            top: 80,
            duration: const Duration(seconds: 11),
          ),
          AnimatedNebula(
            color: cosmosTheme.nebulaColors[2],
            width: 120,
            height: 85,
            right: 50,
            top: 5,
            duration: const Duration(seconds: 7),
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
              cosmosTheme: cosmosTheme,
            ),
          ),

          // Label — fade+slide in
          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child:
                Text(
                      'Papilio Nebula  ·  M3E-7',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
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
