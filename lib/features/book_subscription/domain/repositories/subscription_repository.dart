import '../entities/subscription_entity.dart';
import '../entities/subscription_type.dart';

abstract class SubscriptionRepository {
  Future<SubscriptionEntity> checkStatus();
  Future<void> activate(SubscriptionType type);
}
