import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../mock_data/mock_people.dart';
import '../../themes/app_theme.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/person_node.dart';
import '../../widgets/relative_profile_sheet.dart';

class FamilyTreeScreen extends ConsumerWidget {
  const FamilyTreeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family tree'),
        actions: [
          IconButton(onPressed: () => context.push('/search'), icon: const Icon(Icons.search)),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
            children: [
              Center(
                child: PersonNode(
                  person: MockFamily.father,
                  onTap: () => showRelativeProfileSheet(context, MockFamily.father),
                ),
              ),
              const _Connector(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PersonNode(person: MockFamily.mother, onTap: () => showRelativeProfileSheet(context, MockFamily.mother)),
                  PersonNode(person: MockFamily.you, onTap: () => showRelativeProfileSheet(context, MockFamily.you)),
                  PersonNode(person: MockFamily.spouse, onTap: () => showRelativeProfileSheet(context, MockFamily.spouse)),
                ],
              ),
              const _Connector(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PersonNode(person: MockFamily.son, onTap: () => showRelativeProfileSheet(context, MockFamily.son)),
                  PersonNode(person: MockFamily.daughter, onTap: () => showRelativeProfileSheet(context, MockFamily.daughter)),
                ],
              ),
              const SizedBox(height: 22),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8, runSpacing: 8,
                children: [
                  _branchChip(context, 'Grandparents +12'),
                  _branchChip(context, 'Cousins +48'),
                  _branchChip(context, 'In-laws +22'),
                ],
              ),
              const SizedBox(height: 14),
              const Center(
                child: Text('Tap a branch to expand \u00b7 pinch to zoom',
                    style: TextStyle(fontSize: 11, color: AppColors.inkFaint)),
              ),
            ],
          ),
          Positioned(
            right: 20, bottom: 20,
            child: FloatingActionButton(
              backgroundColor: AppColors.clay,
              onPressed: () => context.push('/add-relative'),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(current: NavTab.tree),
    );
  }

  Widget _branchChip(BuildContext context, String label) {
    return InkWell(
      onTap: () => context.push('/tree/expanded'),
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.line, width: 1.4),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.account_tree_outlined, size: 13, color: AppColors.clay),
            const SizedBox(width: 6),
            Text(label, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class _Connector extends StatelessWidget {
  const _Connector();
  @override
  Widget build(BuildContext context) => Center(
        child: Container(width: 1.6, height: 22, color: AppColors.line),
      );
}
