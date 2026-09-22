import '../mock_data/mock_people.dart';
import '../models/person.dart';

abstract class TreeService {
  Future<List<Person>> getImmediateFamily();
  Future<List<Person>> getExtendedFamily();
  Future<Person> getPerson(String id);
}

/// Swap for an HttpTreeService hitting GET /api/v1/tree once the backend
/// is wired up - see API_CONTRACTS.md. No screen depends on this class
/// directly, only on the TreeService interface via providers/tree_provider.dart.
class MockTreeService implements TreeService {
  @override
  Future<List<Person>> getImmediateFamily() async => MockFamily.immediate;

  @override
  Future<List<Person>> getExtendedFamily() async => MockFamily.extended;

  @override
  Future<Person> getPerson(String id) async => MockFamily.byId(id);
}
