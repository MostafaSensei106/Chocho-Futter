import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedStarBackgroundComponent extends StatefulWidget {
  const AnimatedStarBackgroundComponent({super.key});

  @override
  State<AnimatedStarBackgroundComponent> createState() =>
      _AnimatedStarBackgroundComponentState();
}

class _AnimatedStarBackgroundComponentState
    extends State<AnimatedStarBackgroundComponent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<Star> _stars = List.generate(120, (index) => Star());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    unawaited(_controller.repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _StarPainter(progress: _controller.value, stars: _stars),
          child: Container(),
        );
      },
    );
  }
}

class _StarPainter extends CustomPainter {
  _StarPainter({required this.progress, required this.stars});
  final double progress;
  final List<Star> stars;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    for (final star in stars) {
      // Gentle twinkle
      final twinkle =
          0.4 +
          0.6 *
              math.sin(
                progress * math.pi * 2 * star.twinkleSpeed + star.offset,
              );

      // Slight drifting movement
      final x =
          (star.x * size.width +
              math.sin(progress * math.pi * 2 * 0.5 + star.offset) * 10) %
          size.width;
      final y =
          (star.y * size.height +
              math.cos(progress * math.pi * 2 * 0.5 + star.offset) * 10) %
          size.height;

      paint.color = Colors.white.withValues(alpha: twinkle * star.opacity);
      canvas.drawCircle(Offset(x, y), star.size, paint);

      // Subtle glow for brighter stars
      if (star.size > 1.1) {
        canvas.drawCircle(
          Offset(x, y),
          star.size * 2.5,
          Paint()
            ..color = Colors.white.withValues(
              alpha: twinkle * star.opacity * 0.2,
            )
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
        );
      }
    }

    // Add periodic shooting star
    if (progress % 0.2 < 0.01) {
      _drawShootingStar(canvas, size, (progress % 0.2) / 0.01);
    }
  }

  void _drawShootingStar(Canvas canvas, Size size, double t) {
    final random = math.Random(progress.toInt());
    final startX = size.width * (random.nextDouble() * 0.8);
    final startY = size.height * (random.nextDouble() * 0.4);

    final endX = startX + 150;
    final endY = startY + 50;

    final currentX = startX + (endX - startX) * t;
    final currentY = startY + (endY - startY) * t;

    final trailPaint = Paint()
      ..shader =
          LinearGradient(
            colors: [Colors.white.withValues(alpha: 0.8), Colors.transparent],
          ).createShader(
            Rect.fromPoints(Offset(currentX, currentY), Offset(startX, startY)),
          );

    canvas.drawLine(
      Offset(startX, startY),
      Offset(currentX, currentY),
      trailPaint..strokeWidth = 2.0,
    );
  }

  @override
  bool shouldRepaint(covariant _StarPainter oldDelegate) => true;
}

class Star {
  Star() {
    final random = math.Random();
    x = random.nextDouble();
    y = random.nextDouble();
    size = random.nextDouble() * 1.8 + 0.4;
    opacity = random.nextDouble() * 0.6 + 0.2;
    twinkleSpeed = random.nextDouble() * 3 + 1;
    offset = random.nextDouble() * math.pi * 2;
  }
  late double x;
  late double y;
  late double size;
  late double opacity;
  late double twinkleSpeed;
  late double offset;
}
