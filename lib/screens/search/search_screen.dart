import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/search_provider.dart';
import '../../themes/app_theme.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(searchResultsProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: const Text('Search family'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.parchmentDeep, borderRadius: BorderRadius.circular(12)),
              child: TextField(
                onChanged: (v) => ref.read(searchQueryProvider.notifier).state = v,
                decoration: const InputDecoration(
                  hintText: 'Search a name...', prefixIcon: Icon(Icons.search, size: 18),
                  border: InputBorder.none, filled: false,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: results.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => const SizedBox(),
                data: (people) => ListView.separated(
                  itemCount: people.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final p = people[i];
                    return InkWell(
                      onTap: () => context.push('/profile/${p.id}', extra: p),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: Row(
                          children: [
                            CircleAvatar(backgroundColor: AppColors.parchmentDeep, child: Text(p.initials)),
                            const SizedBox(width: 13),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(p.fullName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                                const SizedBox(height: 2),
                                Text(p.relationship ?? '', style: const TextStyle(fontSize: 11.6, color: AppColors.inkFaint)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
