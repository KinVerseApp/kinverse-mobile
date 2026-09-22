import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../themes/app_theme.dart';

/// The prototype's side menu - a Drawer, not a route. Add to any Scaffold
/// that shows the hamburger icon (dashboard, my profile) via `drawer:`.
class SideMenuDrawer extends StatelessWidget {
  const SideMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.forest,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 26, 22, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sunil Narayanan',
                style: TextStyle(
                  fontFamily: 'Fraunces', fontWeight: FontWeight.w600,
                  fontSize: 18, color: AppColors.paper,
                ),
              ),
              const SizedBox(height: 2),
              const Text('sunil@email.com', style: TextStyle(color: Color(0xFFB9C9BD), fontSize: 11.5)),
              const SizedBox(height: 26),
              _item(context, Icons.person_outline, 'Profile', '/my-profile'),
              _item(context, Icons.account_tree_outlined, 'Family tree', '/tree'),
              _item(context, Icons.notifications_none, 'Notifications', '/notifications'),
              _item(context, Icons.shield_outlined, 'Privacy', '/privacy'),
              _item(context, Icons.help_outline, 'Help', null),
              _item(context, Icons.group_add_outlined, 'Refer family', '/invite'),
              const Spacer(),
              _item(context, Icons.logout, 'Sign out', '/welcome', danger: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(BuildContext context, IconData icon, String label, String? route, {bool danger = false}) {
    final color = danger ? const Color(0xFFD3876C) : const Color(0xFFC9BFA6);
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (route != null) context.go(route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(color: danger ? color : const Color(0xFFE7E1CF), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
