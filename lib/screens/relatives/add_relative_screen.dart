import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../models/invitation.dart';
import '../../providers/ui_providers.dart';
import '../../themes/app_theme.dart';

class AddRelativeScreen extends ConsumerStatefulWidget {
  const AddRelativeScreen({super.key});

  @override
  ConsumerState<AddRelativeScreen> createState() => _AddRelativeScreenState();
}

class _AddRelativeScreenState extends ConsumerState<AddRelativeScreen> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(selectedRelativeTypeProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: const Text('Add relative'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(controller: _name, decoration: const InputDecoration(labelText: 'NAME', hintText: 'Full name')),
                  const SizedBox(height: 14),
                  TextField(controller: _phone, decoration: const InputDecoration(labelText: 'PHONE', hintText: 'Optional')),
                  const SizedBox(height: 14),
                  TextField(controller: _email, decoration: const InputDecoration(labelText: 'EMAIL', hintText: 'Optional')),
                  const SizedBox(height: 18),
                  const Text('RELATIONSHIP',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.inkSoft)),
                  const SizedBox(height: 10),
                  GridView.count(
                    crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 2.6,
                    children: RelativeType.values.map((type) {
                      final isSel = selected == type;
                      return InkWell(
                        onTap: () => ref.read(selectedRelativeTypeProvider.notifier).state = type,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSel ? AppColors.forest : AppColors.paper,
                            border: Border.all(color: isSel ? AppColors.forest : AppColors.line, width: 1.4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            type.label,
                            style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600,
                              color: isSel ? AppColors.gold : AppColors.ink,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: ElevatedButton(
              onPressed: () => context.push('/invite/new-relative'),
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
