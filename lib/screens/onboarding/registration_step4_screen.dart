import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../themes/app_theme.dart';
import 'registration_scaffold.dart';

class RegistrationStep4Screen extends StatefulWidget {
  const RegistrationStep4Screen({super.key});

  @override
  State<RegistrationStep4Screen> createState() => _RegistrationStep4ScreenState();
}

class _RegistrationStep4ScreenState extends State<RegistrationStep4Screen> {
  String _country = 'India';
  String _state = 'Tamil Nadu';

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      step: 4,
      nextLabel: 'Finish',
      onBack: () => context.go('/register/3'),
      onNext: () => context.go('/first-time-home'),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text(
            "Where your family comes from — this helps relatives find the right branch.",
            style: TextStyle(fontSize: 12.8, color: AppColors.inkSoft),
          ),
        ),
        DropdownButtonFormField<String>(
          initialValue: _country,
          decoration: const InputDecoration(labelText: 'COUNTRY'),
          items: const [
            DropdownMenuItem(value: 'India', child: Text('India')),
            DropdownMenuItem(value: 'United States', child: Text('United States')),
            DropdownMenuItem(value: 'United Kingdom', child: Text('United Kingdom')),
          ],
          onChanged: (v) => setState(() => _country = v ?? _country),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: _state,
          decoration: const InputDecoration(labelText: 'STATE / REGION'),
          items: const [
            DropdownMenuItem(value: 'Tamil Nadu', child: Text('Tamil Nadu')),
            DropdownMenuItem(value: 'New Jersey', child: Text('New Jersey')),
          ],
          onChanged: (v) => setState(() => _state = v ?? _state),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: null,
          decoration: const InputDecoration(labelText: 'VILLAGE / TOWN OF ORIGIN'),
          items: const [
            DropdownMenuItem(value: 'add', child: Text('Add your ancestral village')),
          ],
          onChanged: (_) {},
        ),
      ],
    );
  }
}
