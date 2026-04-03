import 'package:testovoe/features/book_subscription/domain/repositories/subscription_repository.dart';

import '../entities/subscription_entity.dart';

class CheckSubscriptionStatus {
  final SubscriptionRepository repository;

  CheckSubscriptionStatus(this.repository);

  Future<SubscriptionEntity> call() async {
    return await repository.checkStatus();
  }
}
