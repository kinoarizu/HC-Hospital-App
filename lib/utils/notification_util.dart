part of 'utils.dart';

///* Notification Utility Class - DateTime Custom Configuration
/// Class ini dibuat agar dapat membungkus method utilitas notifikasi pengguna

class NotificationUtil {
  /// Memunculkan notifikasi dari server onesignal ke aplikasi ini berdasarkan id pengguna
  static Future<void> pushNotification({String content, String heading}) async {
    OSPermissionSubscriptionState status = await OneSignal.shared.getPermissionSubscriptionState();

    String playerId = status.subscriptionStatus.userId;

    await OneSignal.shared.postNotification(OSCreateNotification(
      playerIds: [playerId],
      content: content,
      heading: heading,
      androidSmallIcon: "https://i.ibb.co/q9b4hSz/doctor-1.png",
      androidLargeIcon: "https://i.ibb.co/kc9FMh6/ic-launcher.png",
    ));
  }
}
