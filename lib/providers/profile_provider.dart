import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/person.dart';
import '../services/profile_service.dart';

final profileServiceProvider = Provider<ProfileService>((ref) => MockProfileService());

final myProfileProvider = FutureProvider<Person>((ref) {
  return ref.watch(profileServiceProvider).getMyProfile();
});
