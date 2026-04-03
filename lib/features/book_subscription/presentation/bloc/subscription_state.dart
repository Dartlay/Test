import '../../domain/entities/subscription_entity.dart';

abstract class SubscriptionState {}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionLoading extends SubscriptionState {}

// ✅ НОВОЕ СОСТОЯНИЕ: Покупка прошла успешно
class SubscriptionSuccess extends SubscriptionState {
  final SubscriptionEntity subscription;
  SubscriptionSuccess(this.subscription);
}

class SubscriptionLoaded extends SubscriptionState {
  final SubscriptionEntity subscription;
  SubscriptionLoaded(this.subscription);
}

class SubscriptionError extends SubscriptionState {
  final String message;
  SubscriptionError(this.message);
}
