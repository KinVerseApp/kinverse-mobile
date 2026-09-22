import '../mock_data/mock_people.dart';
import '../models/person.dart';

abstract class ProfileService {
  Future<Person> getMyProfile();
  Future<Person> getProfile(String id);
}

class MockProfileService implements ProfileService {
  @override
  Future<Person> getMyProfile() async => MockFamily.you;

  @override
  Future<Person> getProfile(String id) async => MockFamily.byId(id);
}
