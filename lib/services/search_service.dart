import '../mock_data/mock_search_results.dart';
import '../models/person.dart';

abstract class SearchService {
  Future<List<Person>> search(String query);
}

class MockSearchService implements SearchService {
  @override
  Future<List<Person>> search(String query) async {
    if (query.trim().isEmpty) return const [];
    return mockSearchResults
        .where((p) => p.fullName.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
