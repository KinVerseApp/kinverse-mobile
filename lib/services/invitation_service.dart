import '../models/invitation.dart';

abstract class InvitationService {
  Future<void> sendInvitation({required String personId, required InviteChannel channel});
}

class MockInvitationService implements InvitationService {
  @override
  Future<void> sendInvitation({required String personId, required InviteChannel channel}) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
