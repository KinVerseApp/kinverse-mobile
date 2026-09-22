import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../mock_data/mock_people.dart';
import '../../themes/app_theme.dart';
import '../../widgets/person_node.dart';
import '../../widgets/relative_profile_sheet.dart';

class TreeExpandedScreen extends StatelessWidget {
  const TreeExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: const Text('Grandparents branch'),
        actions: [IconButton(onPressed: () => context.push('/search'), icon: const Icon(Icons.search))],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
            children: [
              Center(
                child: PersonNode(
                  person: MockFamily.grandfather,
                  onTap: () => showRelativeProfileSheet(context, MockFamily.grandfather),
                ),
              ),
              Center(child: Container(width: 1.6, height: 22, color: AppColors.line)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PersonNode(person: MockFamily.grandmother, onTap: () => showRelativeProfileSheet(context, MockFamily.grandmother)),
                  PersonNode(person: MockFamily.father, onTap: () => showRelativeProfileSheet(context, MockFamily.father)),
                  PersonNode(person: MockFamily.aunt, onTap: () => showRelativeProfileSheet(context, MockFamily.aunt)),
                ],
              ),
              Center(child: Container(width: 1.6, height: 22, color: AppColors.line)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PersonNode(person: MockFamily.you, onTap: () => showRelativeProfileSheet(context, MockFamily.you)),
                  PersonNode(person: MockFamily.cousin, onTap: () => showRelativeProfileSheet(context, MockFamily.cousin)),
                ],
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text('Pinch to zoom \u00b7 drag to pan', style: TextStyle(fontSize: 11, color: AppColors.inkFaint)),
              ),
            ],
          ),
          Positioned(
            right: 20, bottom: 20,
            child: Column(
              children: [
                _zoomBtn(Icons.add),
                const SizedBox(height: 8),
                _zoomBtn(Icons.remove),
              ],
            ),
          ),
          Positioned(
            right: 20, bottom: 100,
            child: FloatingActionButton(
              backgroundColor: AppColors.clay,
              onPressed: () => context.push('/add-relative'),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _zoomBtn(IconData icon) => Container(
        width: 38, height: 38,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.line, width: 1.4),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.paper,
        ),
        child: Icon(icon, size: 18),
      );
}
