import '../mock_data/mock_notifications.dart';
import '../models/notification_item.dart';

abstract class NotificationService {
  Future<List<NotificationItem>> list();
}

class MockNotificationService implements NotificationService {
  @override
  Future<List<NotificationItem>> list() async => mockNotifications;
}
