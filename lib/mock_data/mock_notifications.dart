import '../models/notification_item.dart';

const mockNotifications = [
  NotificationItem(
    id: 'n1', type: NotificationType.birthday,
    title: "Ravi's birthday is tomorrow", subtitle: 'Send a note before you forget',
  ),
  NotificationItem(
    id: 'n2', type: NotificationType.memberJoined,
    title: 'Anita joined the tree', subtitle: 'Accepted your invitation \u00b7 1d ago',
  ),
  NotificationItem(
    id: 'n3', type: NotificationType.newBranch,
    title: 'New branch created', subtitle: 'Kumar family \u00b7 2d ago',
  ),
  NotificationItem(
    id: 'n4', type: NotificationType.invitationAccepted,
    title: 'Invitation accepted', subtitle: 'John Smith is now connected \u00b7 3d ago',
  ),
];
