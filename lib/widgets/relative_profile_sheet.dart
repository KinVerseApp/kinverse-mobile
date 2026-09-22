import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/person.dart';
import '../themes/app_theme.dart';

/// The prototype's "relative profile card" - a bottom sheet, not a route.
/// Call showRelativeProfileSheet(context, person) from anywhere a person
/// node is tapped (the tree screen, search results, ...).
Future<void> showRelativeProfileSheet(BuildContext context, Person person) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.paper,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
    ),
    builder: (sheetContext) => _RelativeProfileSheet(person: person),
  );
}

class _RelativeProfileSheet extends StatelessWidget {
  final Person person;

  const _RelativeProfileSheet({required this.person});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 10, 22, 26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 38, height: 4,
              decoration: BoxDecoration(
                color: AppColors.line, borderRadius: BorderRadius.circular(3),
              ),
            ),
            const SizedBox(height: 18),
            CircleAvatar(
              radius: 37,
              backgroundColor: AppColors.parchmentDeep,
              child: Text(
                person.initials,
                style: const TextStyle(
                  fontFamily: 'Fraunces', fontWeight: FontWeight.w600,
                  fontSize: 22, color: AppColors.forest,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(person.fullName, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 3),
            Text(
              person.relationship ?? '',
              style: const TextStyle(color: AppColors.clayDark, fontWeight: FontWeight.w600, fontSize: 12.5),
            ),
            if (person.location != null) ...[
              const SizedBox(height: 3),
              Text(person.location!, style: const TextStyle(color: AppColors.inkFaint, fontSize: 12)),
            ],
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.push('/profile/${person.id}', extra: person);
                },
                child: const Text('View profile'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.push('/add-relative');
                },
                child: const Text('Add relative'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.push('/tree/expanded');
                },
                child: const Text('View branch'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
