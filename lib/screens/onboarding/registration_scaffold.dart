import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

/// Shared chrome for the 4 registration steps - back arrow, step dots,
/// scrollable body, and a pinned Next/Finish button at the bottom.
class RegistrationScaffold extends StatelessWidget {
  final int step; // 1-4
  final List<Widget> children;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final String nextLabel;
  final Widget? belowButton;

  const RegistrationScaffold({
    super.key,
    required this.step,
    required this.children,
    required this.onBack,
    required this.onNext,
    this.nextLabel = 'Next',
    this.belowButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 20, 6),
              child: Row(
                children: [
                  IconButton(onPressed: onBack, icon: const Icon(Icons.arrow_back)),
                  const SizedBox(width: 4),
                  Text('Create account', style: Theme.of(context).textTheme.titleMedium),
                  const Spacer(),
                  Text('Step $step / 4',
                      style: const TextStyle(fontSize: 11.5, color: AppColors.inkFaint, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(4, (i) {
                  final done = i < step;
                  return Expanded(
                    child: Container(
                      height: 3,
                      margin: EdgeInsets.only(right: i == 3 ? 0 : 5),
                      decoration: BoxDecoration(
                        color: done ? AppColors.clay : AppColors.line,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: onNext, child: Text(nextLabel)),
                  ),
                  if (belowButton != null) belowButton!,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
