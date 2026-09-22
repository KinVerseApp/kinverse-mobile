import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/notification_item.dart';
import '../services/notification_service.dart';

final notificationServiceProvider =
    Provider<NotificationService>((ref) => MockNotificationService());

final notificationsProvider = FutureProvider<List<NotificationItem>>((ref) {
  return ref.watch(notificationServiceProvider).list();
});
