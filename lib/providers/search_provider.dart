import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/person.dart';
import '../services/search_service.dart';

final searchServiceProvider = Provider<SearchService>((ref) => MockSearchService());

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider<List<Person>>((ref) {
  final query = ref.watch(searchQueryProvider);
  return ref.watch(searchServiceProvider).search(query);
});
