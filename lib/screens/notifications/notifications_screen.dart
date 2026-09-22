import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/notification_item.dart';
import '../../providers/notification_provider.dart';
import '../../themes/app_theme.dart';
import '../../widgets/app_bottom_nav.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: notifications.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Could not load notifications')),
        data: (items) => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) => _tile(items[i]),
        ),
      ),
      bottomNavigationBar: const AppBottomNav(current: NavTab.activity),
    );
  }

  Widget _tile(NotificationItem n) {
    final icon = switch (n.type) {
      NotificationType.birthday => Icons.cake_outlined,
      NotificationType.memberJoined => Icons.check_circle_outline,
      NotificationType.newBranch => Icons.account_tree_outlined,
      NotificationType.invitationAccepted => Icons.mail_outline,
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(color: AppColors.parchmentDeep, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, size: 17, color: AppColors.clay),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(n.title, style: const TextStyle(fontSize: 13.6)),
                const SizedBox(height: 3),
                Text(n.subtitle, style: const TextStyle(fontSize: 11.3, color: AppColors.inkFaint)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
