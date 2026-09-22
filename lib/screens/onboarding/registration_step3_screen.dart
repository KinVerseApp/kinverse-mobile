import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'registration_scaffold.dart';

class RegistrationStep3Screen extends StatefulWidget {
  const RegistrationStep3Screen({super.key});

  @override
  State<RegistrationStep3Screen> createState() => _RegistrationStep3ScreenState();
}

class _RegistrationStep3ScreenState extends State<RegistrationStep3Screen> {
  final _dob = TextEditingController();
  String _gender = 'Prefer not to say';

  @override
  Widget build(BuildContext context) {
    return RegistrationScaffold(
      step: 3,
      onBack: () => context.go('/register/2'),
      onNext: () => context.go('/register/4'),
      children: [
        const SizedBox(height: 14),
        TextField(controller: _dob, decoration: const InputDecoration(labelText: 'DATE OF BIRTH', hintText: 'MM / DD / YYYY')),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: _gender,
          decoration: const InputDecoration(labelText: 'GENDER'),
          items: const [
            DropdownMenuItem(value: 'Prefer not to say', child: Text('Prefer not to say')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Non-binary', child: Text('Non-binary')),
          ],
          onChanged: (v) => setState(() => _gender = v ?? _gender),
        ),
      ],
    );
  }
}
