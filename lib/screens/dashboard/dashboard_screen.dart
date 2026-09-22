import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../themes/app_theme.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/side_menu_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenuDrawer(),
      appBar: AppBar(
        title: const Text('Hello, Sunil'),
        actions: [
          IconButton(onPressed: () => context.push('/notifications'), icon: const Icon(Icons.notifications_none)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.forest, borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('FAMILY SNAPSHOT',
                    style: TextStyle(fontSize: 11.5, letterSpacing: 1, color: Color(0xFFB9C9BD))),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _stat('24', 'Members'),
                    const SizedBox(width: 22),
                    _stat('4', 'Generations'),
                    const SizedBox(width: 22),
                    _stat('3', 'Pending invites'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('QUICK ACTIONS',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft, letterSpacing: .5)),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 2.2,
            children: [
              _quickAction(context, Icons.person_add_alt_outlined, 'Add relative', () => context.push('/add-relative')),
              _quickAction(context, Icons.account_tree_outlined, 'Open tree', () => context.go('/tree')),
              _quickAction(context, Icons.mail_outline, 'Invite', () => context.push('/invite/priya')),
              _quickAction(context, Icons.cake_outlined, 'Birthdays', () => context.push('/notifications')),
            ],
          ),
          const SizedBox(height: 24),
          const Text('RECENT ACTIVITY',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.inkSoft, letterSpacing: .5)),
          _activity('Ravi joined the family tree', '2 hours ago'),
          _activity('Anita accepted your invite', 'Yesterday'),
          _activity('New relative added to the Kumar branch', '2 days ago'),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(current: NavTab.home),
    );
  }

  Widget _stat(String value, String label) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value,
              style: const TextStyle(fontFamily: 'Fraunces', fontWeight: FontWeight.w600, fontSize: 23, color: Colors.white)),
          Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFFAEC0B3))),
        ],
      );

  Widget _quickAction(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.line, width: 1.4),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 32, height: 32,
              decoration: BoxDecoration(color: AppColors.parchmentDeep, borderRadius: BorderRadius.circular(9)),
              child: Icon(icon, size: 16, color: AppColors.forest),
            ),
            Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _activity(String text, String time) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 7, height: 7,
              margin: const EdgeInsets.only(top: 6),
              decoration: const BoxDecoration(color: AppColors.clay, shape: BoxShape.circle),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: const TextStyle(fontSize: 13.4)),
                  const SizedBox(height: 2),
                  Text(time, style: const TextStyle(fontSize: 11.5, color: AppColors.inkFaint)),
                ],
              ),
            ),
          ],
        ),
      );
}
