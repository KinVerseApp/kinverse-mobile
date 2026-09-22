# KinVerse mobile — UI build (mock data, no API calls)

This is a screen-by-screen Flutter recreation of the KinVerse clickable
prototype (`rootline-prototype.html`). It matches that prototype's visuals,
navigation flow, and interactions, running entirely on mock/sample data.

## Structure

```
lib/
├── screens/        one folder per feature area, one file per prototype screen
├── widgets/         shared widgets (bottom nav, node, buttons, sheet, drawer)
├── models/           Person, NotificationItem, InvitationDraft, RelativeType
├── services/          abstract *Service classes + MockXService implementations
├── providers/         Riverpod providers wiring services -> screens
├── navigation/         GoRouter route table (app_router.dart)
├── themes/             color tokens + ThemeData (matches the HTML prototype)
└── mock_data/          the sample family tree used for every screen
```

## Design tokens (matches the HTML prototype 1:1)

| Token | Hex | Use |
|---|---|---|
| Parchment | `#F3ECDC` | app background |
| Paper | `#FBF7ED` | cards, sheets |
| Forest | `#243B31` | primary dark surfaces, "you" node |
| Clay | `#B85C38` | primary actions |
| Gold | `#C79A4B` | accents |
| Sage | `#7C9473` | success / completeness |
| Ink | `#2A241D` | primary text |

Typography: `Fraunces` (display/serif) + `Inter` (body/UI), via `google_fonts`.

## Screens → routes

| Prototype screen | Route | File |
|---|---|---|
| Splash | `/splash` | `screens/onboarding/splash_screen.dart` |
| Welcome | `/welcome` | `screens/onboarding/welcome_screen.dart` |
| Register step 1–4 | `/register/1`…`/register/4` | `screens/onboarding/registration_step*_screen.dart` |
| First-time home | `/first-time-home` | `screens/onboarding/first_time_home_screen.dart` |
| Dashboard | `/dashboard` | `screens/dashboard/dashboard_screen.dart` |
| Family tree | `/tree` | `screens/tree/family_tree_screen.dart` |
| Expanded tree | `/tree/expanded` | `screens/tree/tree_expanded_screen.dart` |
| Relative card | *bottom sheet, not a route* | `widgets/relative_profile_sheet.dart` |
| Full profile | `/profile/:id` | `screens/profile/full_profile_screen.dart` |
| Add relative | `/add-relative` | `screens/relatives/add_relative_screen.dart` |
| Invitation | `/invite/:id` | `screens/relatives/invite_confirmation_screen.dart` |
| Notifications | `/notifications` | `screens/notifications/notifications_screen.dart` |
| Search | `/search` | `screens/search/search_screen.dart` |
| My profile | `/my-profile` | `screens/profile/my_profile_screen.dart` |
| Privacy settings | `/privacy` | `screens/profile/privacy_settings_screen.dart` |
| Side menu | *drawer, not a route* | `widgets/side_menu_drawer.dart` |

## Swapping mock data for the real API

Every screen reads through a Riverpod provider (`providers/*.dart`) that
depends on a `Service` interface (`services/*.dart`). Right now each provider
is wired to a `Mock*Service`. To connect FastAPI:

1. Write `Http*Service implements *Service` calling the endpoints in
   `API_CONTRACTS.md` (repo root).
2. Swap the implementation in the relevant `Provider<...Service>` in
   `providers/*.dart`.
3. No screen or widget code changes — they only ever depend on the
   interface, not the mock.

Not wired to a real backend yet — see `API_CONTRACTS.md` for the endpoint
contracts this UI was built against.
