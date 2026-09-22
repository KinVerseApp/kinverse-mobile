import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../themes/app_theme.dart';

class FirstTimeHomeScreen extends StatelessWidget {
  const FirstTimeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome, Sunil'),
        actions: [
          IconButton(
            onPressed: () => context.push('/notifications'),
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 6, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.line, width: 1.4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Family tree progress',
                          style: TextStyle(fontSize: 12, color: AppColors.inkSoft, fontWeight: FontWeight.w600)),
                      Text('20%',
                          style: TextStyle(fontSize: 12, color: AppColors.inkSoft, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: 0.2, minHeight: 7,
                      backgroundColor: AppColors.parchmentDeep,
                      valueColor: const AlwaysStoppedAnimation(AppColors.clay),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _checkItem('Profile created', done: true),
                  _checkItem('Add parents'),
                  _checkItem('Add siblings'),
                  _checkItem('Add spouse'),
                  _checkItem('Invite a relative'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "A tree starts with one branch. Add someone close to you first — you can fill in the rest later.",
              style: TextStyle(fontSize: 12.8, color: AppColors.inkSoft, height: 1.5),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.go('/add-relative'),
              child: const Text('Add first relative'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkItem(String label, {bool done = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Container(
            width: 20, height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: done ? AppColors.sage : Colors.transparent,
              border: done ? null : Border.all(color: AppColors.line, width: 1.6),
            ),
            child: done ? const Icon(Icons.check, size: 12, color: Colors.white) : null,
          ),
          const SizedBox(width: 11),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: done ? AppColors.inkFaint : AppColors.ink,
              decoration: done ? TextDecoration.lineThrough : null,
            ),
          ),
        ],
      ),
    );
  }
}
