import 'dart:ui';
import 'package:flutter/material.dart';

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlassAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            decoration: BoxDecoration(
              // frosted glass tint
              color: const Color(0xFF0D0828).withValues(alpha: 0.55),
              border: const Border(
                bottom: BorderSide(
                  color: Color(0x33C8B4FF), // subtle purple shimmer line
                  width: 0.6,
                ),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: kToolbarHeight,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Color(0xFF8870BB)),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                    const Expanded(
                      child: Text(
                        'C O S M O S',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 6,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFC8B4FF),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.lens,
                        color: Color(0xFF8870BB),
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
