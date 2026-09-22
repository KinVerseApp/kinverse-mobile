# Frontend \u2194 backend contracts

Maps each screen to the real `kinverse-api` endpoints it will call once
wired up (see that repo's `openapi.yaml` for full schemas). These are not
a proposal - they're the actual, tested endpoints built and verified this
session (34 passing integration tests in `kinverse-api/tests/`).

| Screen | Endpoint(s) | Notes |
|---|---|---|
| Register (steps 1\u20134) | `POST /api/v1/auth/register` | Sent once, on step 4's Finish - not per-step |
| Welcome \u2192 Sign in | `POST /api/v1/auth/login` | |
| First-time home | `GET /api/v1/tree/completeness?person_id=` | Powers the progress checklist |
| Dashboard | `GET /api/v1/tree?limit=50`, `GET /api/v1/notifications/unread-count` | Snapshot stats derived client-side from the tree response |
| Family tree | `GET /api/v1/tree?limit=50` | `root_id` + `nodes[]`, each with a derived `relationship` label |
| Expanded tree | `GET /api/v1/tree/ancestors?person_id=`, `GET /api/v1/tree/descendants?person_id=` | |
| Relative profile (sheet) | `GET /api/v1/profiles/{id}` | Lightweight - just what the sheet shows |
| Full profile | `GET /api/v1/profiles/{id}`, `GET /api/v1/profiles/{id}/heritage` | |
| Add relative | `POST /api/v1/profiles` then `POST /api/v1/relationships` | Two calls: create the person, then link them. See `profiles/service.py` for why |
| Invitation | `POST /api/v1/invitations/sms` \| `/email` \| `/link` \| `/qr` | Channel picked on this screen decides which |
| Notifications | `GET /api/v1/notifications`, `PATCH /api/v1/notifications/{id}/read` | |
| Search | `GET /api/v1/search/name?q=` | Falls back to `GET /api/v1/search/email?q=` server-side if no name match |
| My profile | `GET /api/v1/users/me` | |
| Privacy settings | `GET /api/v1/privacy`, `PATCH /api/v1/privacy` | Always returns all 6 fields, defaulting unset ones to the person's `default_visibility` |
| Side menu \u2192 Sign out | `POST /api/v1/auth/logout` | Currently a no-op server-side (see kinverse-api's known gaps) - still clear local tokens and route to `/welcome` |

## Response shapes actually used

```json
// GET /api/v1/tree
{
  "root_id": "uuid",
  "nodes": [
    { "id": "uuid", "first_name": "John", "last_name": "Smith", "relationship": "parent", "children": [] }
  ],
  "total_visible": 6
}

// GET /api/v1/tree/completeness
{ "score": 0.75, "coverage": "parent, spouse, child" }

// POST /api/v1/relationships
{
  "id": "uuid", "person_a_id": "uuid", "person_b_id": "uuid",
  "edge_type": "parent_child", "status": "confirmed", "source": "manual", "partner_type": null
}
```

## Auth

Every authenticated request needs `Authorization: Bearer <access_token>`
from `/auth/login` or `/auth/register`. Access tokens expire in 15
minutes; use `POST /api/v1/auth/refresh` with the refresh token (30-day
expiry) to get a new one - store both, refresh proactively or on a 401.

## Swapping mock data for real calls

Each provider in `lib/providers/` depends on a `*Service` interface
(`lib/services/`). To connect:

1. Write `HttpTreeService implements TreeService` (etc.) that calls the
   endpoints above with `http` or `dio`, using the shapes shown.
2. In the matching provider (e.g. `treeServiceProvider` in
   `tree_provider.dart`), swap `MockTreeService()` for the new
   `HttpTreeService(...)`.
3. No screen or widget changes - they only ever depend on the interface.

Do this module by module (tree first, since almost every screen touches
it), not all at once.
