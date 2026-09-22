import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../themes/app_theme.dart';

enum NavTab { home, tree, activity, profile }

class AppBottomNav extends StatelessWidget {
  final NavTab current;

  const AppBottomNav({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.paper,
        border: Border(top: BorderSide(color: AppColors.lineSoft)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _item(context, NavTab.home, Icons.home_outlined, 'Home', '/dashboard'),
              _item(context, NavTab.tree, Icons.account_tree_outlined, 'Tree', '/tree'),
              _fab(context),
              _item(context, NavTab.activity, Icons.notifications_none, 'Activity', '/notifications'),
              _item(context, NavTab.profile, Icons.person_outline, 'Profile', '/my-profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(BuildContext context, NavTab tab, IconData icon, String label, String route) {
    final active = tab == current;
    final color = active ? AppColors.forest : AppColors.inkFaint;
    return InkWell(
      onTap: () => context.go(route),
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fab(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/add-relative'),
      customBorder: const CircleBorder(),
      child: Container(
        width: 44,
        height: 44,
        margin: const EdgeInsets.only(top: -18),
        decoration: const BoxDecoration(color: AppColors.clay, shape: BoxShape.circle),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
