import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:m3e_collection/m3e_collection.dart';

import '../../../../core/utils/theme/app_theme.dart';

class GlassBottomNav extends StatelessWidget {
  const GlassBottomNav({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final cosmosTheme = Theme.of(context).extension<CosmosThemeExtension>()!;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: cosmosTheme.glassBorderColor, width: 0.6),
            ),
          ),
          child: NavigationBarM3E(
            selectedIndex: selectedIndex,
            // fully transparent so the blur shows through
            backgroundColor: cosmosTheme.glassBackgroundColor.withValues(
              alpha: 0.3,
            ),
            shapeFamily: NavBarM3EShapeFamily.square,
            onDestinationSelected: onDestinationSelected,
            destinations: const [
              NavigationDestinationM3E(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestinationM3E(
                icon: Icon(Icons.search_outlined),
                label: 'Search',
              ),
              NavigationDestinationM3E(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
