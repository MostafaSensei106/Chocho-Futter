import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF08081A),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF12083A), Color(0xFF08060F)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'C O S M O S',
                  style: TextStyle(
                    color: Color(0xFFC8B4FF),
                    fontSize: 22,
                    letterSpacing: 5,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Navigate the universe',
                  style: TextStyle(color: Color(0xFF6A5A9A), fontSize: 12),
                ),
              ],
            ),
          ),
          _drawerItem(Icons.explore_outlined, 'Sky Map'),
          _drawerItem(Icons.collections_bookmark_outlined, 'Constellations'),
          _drawerItem(Icons.event_outlined, 'Sky Events'),
          _drawerItem(Icons.settings_outlined, 'Settings'),
        ],
      ),
    );
  }

  ListTile _drawerItem(IconData icon, String label) => ListTile(
        leading: Icon(icon, color: const Color(0xFF6A5A9A)),
        title: Text(
          label,
          style: const TextStyle(color: Color(0xFFB0A0E0), letterSpacing: 0.5),
        ),
        onTap: () {},
      );
}
