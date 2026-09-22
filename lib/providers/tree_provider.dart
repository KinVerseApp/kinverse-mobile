import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/person.dart';
import '../services/tree_service.dart';

final treeServiceProvider = Provider<TreeService>((ref) => MockTreeService());

final immediateFamilyProvider = FutureProvider<List<Person>>((ref) {
  return ref.watch(treeServiceProvider).getImmediateFamily();
});

final extendedFamilyProvider = FutureProvider<List<Person>>((ref) {
  return ref.watch(treeServiceProvider).getExtendedFamily();
});

/// The person currently shown in the relative profile bottom sheet / full
/// profile screen. Set when a tree node (or a search result) is tapped.
final selectedPersonProvider = StateProvider<Person?>((ref) => null);
