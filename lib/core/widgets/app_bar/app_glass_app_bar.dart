import 'dart:ui';
import 'package:flutter/material.dart';

class AppGlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppGlassAppBar({
    super.key,
    required this.title,
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
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0D0828).withValues(alpha: 0.55),
            border: const Border(
              bottom: BorderSide(
                color: Color(0x33C8B4FF),
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
              style: const TextStyle(
                letterSpacing: 6,
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color(0xFFC8B4FF),
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
