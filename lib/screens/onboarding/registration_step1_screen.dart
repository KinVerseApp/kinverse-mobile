import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/ui_providers.dart';
import '../../themes/app_theme.dart';
import 'registration_scaffold.dart';

class RegistrationStep1Screen extends ConsumerStatefulWidget {
  const RegistrationStep1Screen({super.key});

  @override
  ConsumerState<RegistrationStep1Screen> createState() => _RegistrationStep1ScreenState();
}

class _RegistrationStep1ScreenState extends ConsumerState<RegistrationStep1Screen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      step: 1,
      onBack: () => context.go('/welcome'),
      children: [
        const SizedBox(height: 14),
        TextField(controller: _name, decoration: const InputDecoration(labelText: 'FULL NAME', hintText: 'e.g. Sunil Narayanan')),
        const SizedBox(height: 16),
        TextField(controller: _email, decoration: const InputDecoration(labelText: 'EMAIL', hintText: 'you@email.com')),
        const SizedBox(height: 16),
        TextField(controller: _mobile, decoration: const InputDecoration(labelText: 'MOBILE NUMBER', hintText: '+1 (___) ___ ____')),
      ],
      onNext: () {
        ref.read(registrationDraftProvider.notifier).update(
              fullName: _name.text, email: _email.text, mobile: _mobile.text,
            );
        context.go('/register/2');
      },
    );
  }
}
