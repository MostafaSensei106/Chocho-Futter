import 'dart:ui';
import 'package:flutter/material.dart';
import '../../utils/theme/app_theme.dart';

class GlassAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  const GlassAppBarComponent({
    required this.title,
    super.key,
    this.leading,
    this.actions,
    this.centerTitle = true,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final cosmosTheme =
        Theme.of(context).extension<CosmosThemeExtension>() ??
        const CosmosThemeExtension(
          glassBackgroundColor: Colors.white,
          glassBorderColor: Colors.white54,
          glassTextColor: Colors.white,
          skyGradientColors: [],
          nebulaColors: [],
          textFieldFillColor: Colors.white,
          textFieldBorderColor: Colors.white,
          textFieldFocusedBorderColor: Colors.white,
        );

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          decoration: BoxDecoration(
            color: cosmosTheme.glassBackgroundColor.withValues(alpha: 0.55),
            border: Border(
              bottom: BorderSide(
                color: cosmosTheme.glassBorderColor,
                width: 0.6,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
            title: Text(
              title,
              style: TextStyle(
                letterSpacing: 6,
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: cosmosTheme.glassTextColor,
              ),
            ),
            centerTitle: centerTitle,
            leading: leading,
            actions: actions,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
