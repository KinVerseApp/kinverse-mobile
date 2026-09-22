import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../themes/app_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 260,
            width: double.infinity,
            color: AppColors.forest,
            child: const Icon(Icons.account_tree_outlined, color: AppColors.gold, size: 64),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 26, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Build your family tree', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 10),
                const Text(
                  "Connect generations, preserve your family's story, and keep everyone in one place.",
                  style: TextStyle(color: AppColors.inkSoft, fontSize: 13.8, height: 1.55),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.go('/register/1'),
                    child: const Text('Create account'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => context.go('/dashboard'),
                    child: const Text('Sign in'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
