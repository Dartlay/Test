import 'package:testovoe/features/book_subscription/domain/entities/subscription_type.dart';
import 'package:testovoe/features/book_subscription/domain/repositories/subscription_repository.dart';

class ActivateSubscription {
  final SubscriptionRepository repository;

  ActivateSubscription(this.repository);

  Future<void> call(SubscriptionType type) async {
    await repository.activate(type);
  }
}
