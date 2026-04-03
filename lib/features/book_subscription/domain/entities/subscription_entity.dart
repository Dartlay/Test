import 'subscription_type.dart';

class SubscriptionEntity {
  final bool isActive;
  final SubscriptionType type;
  final DateTime? expiresAt;

  SubscriptionEntity({
    required this.isActive,
    required this.type,
    this.expiresAt,
  });

  SubscriptionEntity copyWith({
    bool? isActive,
    SubscriptionType? type,
    DateTime? expiresAt,
  }) {
    return SubscriptionEntity(
      isActive: isActive ?? this.isActive,
      type: type ?? this.type,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}
