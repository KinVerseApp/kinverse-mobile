import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../themes/app_theme.dart';

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  String _email = 'Family';
  String _phone = 'Direct relatives';
  String _birthday = 'Public';

  static const _options = ['Public', 'Family', 'Direct relatives', 'Private'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: const Text('Privacy settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text('Choose who can see each detail on your profile.',
                style: TextStyle(fontSize: 12.5, color: AppColors.inkSoft)),
          ),
          _group('Email', _email, (v) => setState(() => _email = v)),
          _group('Phone', _phone, (v) => setState(() => _phone = v)),
          _group('Birthday', _birthday, (v) => setState(() => _birthday = v)),
        ],
      ),
    );
  }

  Widget _group(String title, String value, ValueChanged<String> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
          ..._options.map((option) => RadioListTile<String>(
                value: option,
                groupValue: value,
                onChanged: (v) => onChanged(v ?? value),
                title: Text(option, style: const TextStyle(fontSize: 13.6)),
                dense: true,
                contentPadding: EdgeInsets.zero,
                activeColor: AppColors.clay,
              )),
        ],
      ),
    );
  }
}
