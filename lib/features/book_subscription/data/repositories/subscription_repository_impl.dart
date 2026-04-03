import '../../domain/entities/subscription_entity.dart';
import '../../domain/entities/subscription_type.dart';
import '../../domain/repositories/subscription_repository.dart';
import '../datasources/subscription_local_datasource.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionLocalDataSource local;
  SubscriptionRepositoryImpl(this.local);

  @override
  Future<SubscriptionEntity> checkStatus() async {
    final isActive = await local.getIsActive();
    if (!isActive) {
      return SubscriptionEntity(
        isActive: false,
        type: SubscriptionType.monthly,
      );
    }

    final typeStr = await local.getType() ?? 'monthly';
    final expiresTs = await local.getExpiresTimestamp();
    final expiresAt = expiresTs != null
        ? DateTime.fromMillisecondsSinceEpoch(expiresTs)
        : null;

    final type = typeStr == 'yearly'
        ? SubscriptionType.yearly
        : SubscriptionType.monthly;
    return SubscriptionEntity(isActive: true, type: type, expiresAt: expiresAt);
  }

  @override
  Future<void> activate(SubscriptionType type) async {
    final expires = type == SubscriptionType.yearly
        ? DateTime.now().add(const Duration(days: 365))
        : DateTime.now().add(const Duration(days: 30));
    await local.saveActive(type.name, expires);
  }
}
