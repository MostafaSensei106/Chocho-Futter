import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedNebula extends StatelessWidget {
  const AnimatedNebula({
    required this.color, required this.width, required this.height, required this.duration, super.key,
    this.left,
    this.right,
    this.top,
  });

  final Color color;
  final double width, height;
  final double? left, right, top;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    Widget blob = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color.withValues(alpha: 0.22),
      ),
    );

    // Gentle float using flutter_animate
    blob = blob
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .moveY(
          begin: 0,
          end: 12,
          duration: duration,
          curve: Curves.easeInOutSine,
        )
        .fade(
          begin: 0.7,
          end: 1.0,
          duration: duration,
          curve: Curves.easeInOut,
        );

    return Positioned(left: left, right: right, top: top, child: blob);
  }
}
