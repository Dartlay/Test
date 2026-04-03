import '../../domain/entities/subscription_entity.dart';
import '../../domain/entities/subscription_type.dart';

class SubscriptionModel {
  final bool isActive;
  final String type;
  final int? expiresAtTimestamp;

  const SubscriptionModel({
    required this.isActive,
    required this.type,
    this.expiresAtTimestamp,
  });

  SubscriptionEntity toEntity() {
    return SubscriptionEntity(
      isActive: isActive,
      type: SubscriptionType.values.firstWhere(
        (e) => e.name == type,
        orElse: () => SubscriptionType.monthly,
      ),
      expiresAt: expiresAtTimestamp != null
          ? DateTime.fromMillisecondsSinceEpoch(expiresAtTimestamp!)
          : null,
    );
  }

  factory SubscriptionModel.fromEntity(SubscriptionEntity entity) {
    return SubscriptionModel(
      isActive: entity.isActive,
      type: entity.type.name,
      expiresAtTimestamp: entity.expiresAt?.millisecondsSinceEpoch,
    );
  }

  SubscriptionModel copyWith({
    bool? isActive,
    String? type,
    int? expiresAtTimestamp,
  }) {
    return SubscriptionModel(
      isActive: isActive ?? this.isActive,
      type: type ?? this.type,
      expiresAtTimestamp: expiresAtTimestamp ?? this.expiresAtTimestamp,
    );
  }

  Map<String, dynamic> toJson() => {
    'isActive': isActive,
    'type': type,
    'expiresAtTimestamp': expiresAtTimestamp,
  };

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      isActive: json['isActive'] as bool? ?? false,
      type: json['type'] as String? ?? 'monthly',
      expiresAtTimestamp: json['expiresAtTimestamp'] as int?,
    );
  }
}
