import 'package:flutter/material.dart';
import '../../utils/theme/app_theme.dart';
import '../background/animated_star_background_component.dart';

class BackgroundContainerComponent extends StatelessWidget {
  const BackgroundContainerComponent({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cosmosTheme = Theme.of(context).extension<CosmosThemeExtension>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0, -0.3),
          radius: 0.9,
          colors: cosmosTheme!.skyGradientColors,
        ),
      ),
      child: Stack(children: [const AnimatedStarBackgroundComponent(), child]),
    );
  }
}
