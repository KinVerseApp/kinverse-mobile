import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../themes/app_theme.dart';
import 'registration_scaffold.dart';

class RegistrationStep2Screen extends StatelessWidget {
  const RegistrationStep2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      step: 2,
      onBack: () => context.go('/register/1'),
      onNext: () => context.go('/register/3'),
      belowButton: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: TextButton(onPressed: () => context.go('/register/3'), child: const Text('Skip for now')),
      ),
      children: [
        const SizedBox(height: 18),
        Center(
          child: Container(
            width: 104, height: 104,
            decoration: BoxDecoration(
              color: AppColors.parchmentDeep, shape: BoxShape.circle,
              border: Border.all(color: AppColors.line, width: 1.6),
            ),
            child: const Icon(Icons.camera_alt_outlined, color: AppColors.inkFaint, size: 30),
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Add a profile photo so relatives recognize you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.5, color: AppColors.inkSoft),
        ),
        const SizedBox(height: 18),
        OutlinedButton(onPressed: () {}, child: const Text('Take photo')),
        const SizedBox(height: 10),
        OutlinedButton(onPressed: () {}, child: const Text('Upload from device')),
      ],
    );
  }
}
