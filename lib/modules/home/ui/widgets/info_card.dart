import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/utils/theme/app_theme.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cosmosTheme = Theme.of(context).extension<CosmosThemeExtension>()!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cosmosTheme.textFieldFillColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: cosmosTheme.textFieldBorderColor, width: 0.8),
      ),
      child: Row(
        children: [
          Icon(
                Icons.star_border,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scaleXY(
                begin: 1.0,
                end: 1.18,
                duration: 1200.ms,
                curve: Curves.easeInOut,
              ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Papilio Nebula visible tonight',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Best viewing: 22:30 – 02:00',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(
              context,
            ).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            size: 14,
          ),
        ],
      ),
    );
  }
}
