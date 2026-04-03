import 'package:testovoe/features/book_subscription/domain/entities/subscription_type.dart';

abstract class SubscriptionEvent {}

class CheckSubscriptionEvent extends SubscriptionEvent {}

class ActivateSubscriptionEvent extends SubscriptionEvent {
  final SubscriptionType type;
  ActivateSubscriptionEvent(this.type);
}
