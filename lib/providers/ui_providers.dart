import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/invitation.dart';

/// Add Relative screen: which relationship chip is selected.
final selectedRelativeTypeProvider = StateProvider<RelativeType?>((ref) => null);

/// Invite Confirmation screen: which channel is selected.
final selectedInviteChannelProvider =
    StateProvider<InviteChannel>((ref) => InviteChannel.sms);

/// Registration wizard: collected across steps 1-4, read on the Finish step.
class RegistrationDraft {
  final String fullName;
  final String email;
  final String mobile;
  final String? country;
  final String? state;

  const RegistrationDraft({
    this.fullName = '',
    this.email = '',
    this.mobile = '',
    this.country,
    this.state,
  });

  RegistrationDraft copyWith({
    String? fullName,
    String? email,
    String? mobile,
    String? country,
    String? state,
  }) {
    return RegistrationDraft(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      country: country ?? this.country,
      state: state ?? this.state,
    );
  }
}

class RegistrationDraftNotifier extends StateNotifier<RegistrationDraft> {
  RegistrationDraftNotifier() : super(const RegistrationDraft());

  void update({
    String? fullName,
    String? email,
    String? mobile,
    String? country,
    String? state,
  }) {
    this.state = this.state.copyWith(
          fullName: fullName,
          email: email,
          mobile: mobile,
          country: country,
          state: state,
        );
  }
}

final registrationDraftProvider =
    StateNotifierProvider<RegistrationDraftNotifier, RegistrationDraft>(
  (ref) => RegistrationDraftNotifier(),
);
