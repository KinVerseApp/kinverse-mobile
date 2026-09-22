enum NotificationType { birthday, memberJoined, newBranch, invitationAccepted }

class NotificationItem {
  final String id;
  final NotificationType type;
  final String title;
  final String subtitle;

  const NotificationItem({
    required this.id,
    required this.type,
    required this.title,
    required this.subtitle,
  });
}
