import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/profile_provider.dart';
import '../../themes/app_theme.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/side_menu_drawer.dart';

class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(myProfileProvider);

    return Scaffold(
      drawer: const SideMenuDrawer(),
      appBar: AppBar(title: const Text('My profile')),
      body: profile.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => const SizedBox(),
        data: (person) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 8),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 46, backgroundColor: AppColors.parchmentDeep,
                    child: Text(person.initials,
                        style: const TextStyle(fontFamily: 'Fraunces', fontSize: 28, color: AppColors.forest)),
                  ),
                  const SizedBox(height: 12),
                  Text(person.fullName, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 2),
                  Text(person.location ?? '', style: const TextStyle(fontSize: 12, color: AppColors.inkFaint)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _row(Icons.person_outline, 'Personal info', () {}),
            _row(Icons.account_tree_outlined, 'Heritage info', () {}),
            _row(Icons.work_outline, 'Work info', () {}),
            _row(Icons.link, 'Social media', () {}),
            _row(Icons.shield_outlined, 'Privacy', () => context.push('/privacy')),
            const SizedBox(height: 20),
            OutlinedButton(onPressed: () {}, child: const Text('Edit profile')),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(current: NavTab.profile),
    );
  }

  Widget _row(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.lineSoft))),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.forest),
            const SizedBox(width: 12),
            Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5))),
            const Icon(Icons.chevron_right, size: 18, color: AppColors.inkFaint),
          ],
        ),
      ),
    );
  }
}
