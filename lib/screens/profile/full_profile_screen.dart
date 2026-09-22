import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/person.dart';
import '../../themes/app_theme.dart';

class FullProfileScreen extends StatelessWidget {
  final Person person;

  const FullProfileScreen({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: Text(person.fullName),
      ),
      body: ListView(
        children: [
          Container(
            height: 180, width: double.infinity, color: AppColors.forest,
            child: Center(
              child: CircleAvatar(
                radius: 44,
                backgroundColor: Colors.white.withValues(alpha: 0.1),
                child: Text(
                  person.initials,
                  style: const TextStyle(fontFamily: 'Fraunces', fontSize: 26, color: AppColors.gold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _row('Relationship', person.relationship ?? '\u2014'),
                _row('Birthday', person.birthday ?? 'Not set'),
                _row('Location', person.location ?? 'Not set'),
                _row('Occupation', person.occupation ?? 'Not set'),
                const SizedBox(height: 22),
                ElevatedButton(onPressed: () => context.push('/add-relative'), child: const Text('Add relative')),
                const SizedBox(height: 10),
                OutlinedButton(onPressed: () {}, child: const Text('Edit relationship')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) => Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.lineSoft))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: AppColors.inkSoft, fontSize: 13.8)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.8)),
          ],
        ),
      );
}
