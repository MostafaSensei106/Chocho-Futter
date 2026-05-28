import 'package:flutter/material.dart';

class AppBackgroundContainer extends StatelessWidget {
  const AppBackgroundContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
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
      child: child,
    );
  }
}
