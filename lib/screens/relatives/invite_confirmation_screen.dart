import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../models/invitation.dart';
import '../../providers/ui_providers.dart';
import '../../themes/app_theme.dart';

class InviteConfirmationScreen extends ConsumerWidget {
  final String personId;

  const InviteConfirmationScreen({super.key, required this.personId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channel = ref.watch(selectedInviteChannelProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: const Text('Invite relative'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.line, width: 1.4),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const CircleAvatar(radius: 22, backgroundColor: AppColors.parchmentDeep, child: Text('?')),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Invite your new relative', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5)),
                        SizedBox(height: 2),
                        Text("They'll be added to your tree", style: TextStyle(fontSize: 12, color: AppColors.inkFaint)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('SEND VIA', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.inkSoft)),
            const SizedBox(height: 10),
            _viaOption(ref, InviteChannel.sms, Icons.sms_outlined, 'Text message'),
            const SizedBox(height: 10),
            _viaOption(ref, InviteChannel.email, Icons.mail_outline, 'Email'),
            const SizedBox(height: 10),
            _viaOption(ref, InviteChannel.link, Icons.link, 'Copy invite link'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invitation sent')),
                );
                Future.delayed(const Duration(milliseconds: 500), () {
                  if (context.mounted) context.go('/notifications');
                });
              },
              child: const Text('Send invitation'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _viaOption(WidgetRef ref, InviteChannel channel, IconData icon, String label) {
    final selected = ref.watch(selectedInviteChannelProvider) == channel;
    return InkWell(
      onTap: () => ref.read(selectedInviteChannelProvider.notifier).state = channel,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFBEDE5) : AppColors.paper,
          border: Border.all(color: selected ? AppColors.clay : AppColors.line, width: 1.4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.forest),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(fontSize: 13.8, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
