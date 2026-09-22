import 'package:go_router/go_router.dart';

import '../mock_data/mock_people.dart';
import '../models/person.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/notifications/notifications_screen.dart';
import '../screens/onboarding/first_time_home_screen.dart';
import '../screens/onboarding/registration_step1_screen.dart';
import '../screens/onboarding/registration_step2_screen.dart';
import '../screens/onboarding/registration_step3_screen.dart';
import '../screens/onboarding/registration_step4_screen.dart';
import '../screens/onboarding/splash_screen.dart';
import '../screens/onboarding/welcome_screen.dart';
import '../screens/profile/full_profile_screen.dart';
import '../screens/profile/my_profile_screen.dart';
import '../screens/profile/privacy_settings_screen.dart';
import '../screens/relatives/add_relative_screen.dart';
import '../screens/relatives/invite_confirmation_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/tree/family_tree_screen.dart';
import '../screens/tree/tree_expanded_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/welcome', builder: (context, state) => const WelcomeScreen()),
    GoRoute(path: '/register/1', builder: (context, state) => const RegistrationStep1Screen()),
    GoRoute(path: '/register/2', builder: (context, state) => const RegistrationStep2Screen()),
    GoRoute(path: '/register/3', builder: (context, state) => const RegistrationStep3Screen()),
    GoRoute(path: '/register/4', builder: (context, state) => const RegistrationStep4Screen()),
    GoRoute(path: '/first-time-home', builder: (context, state) => const FirstTimeHomeScreen()),
    GoRoute(path: '/dashboard', builder: (context, state) => const DashboardScreen()),
    GoRoute(path: '/tree', builder: (context, state) => const FamilyTreeScreen()),
    GoRoute(path: '/tree/expanded', builder: (context, state) => const TreeExpandedScreen()),
    GoRoute(
      path: '/profile/:id',
      builder: (context, state) {
        final passed = state.extra;
        final person = passed is Person ? passed : MockFamily.byId(state.pathParameters['id'] ?? '');
        return FullProfileScreen(person: person);
      },
    ),
    GoRoute(path: '/add-relative', builder: (context, state) => const AddRelativeScreen()),
    GoRoute(
      path: '/invite/:personId',
      builder: (context, state) =>
          InviteConfirmationScreen(personId: state.pathParameters['personId'] ?? ''),
    ),
    GoRoute(path: '/notifications', builder: (context, state) => const NotificationsScreen()),
    GoRoute(path: '/search', builder: (context, state) => const SearchScreen()),
    GoRoute(path: '/my-profile', builder: (context, state) => const MyProfileScreen()),
    GoRoute(path: '/privacy', builder: (context, state) => const PrivacySettingsScreen()),
  ],
);
