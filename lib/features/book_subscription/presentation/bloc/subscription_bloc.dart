import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/subscription_repository.dart';
import 'subscription_event.dart';
import 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final SubscriptionRepository repository;

  SubscriptionBloc(this.repository) : super(SubscriptionInitial()) {
    on<CheckSubscriptionEvent>(_onCheck);
    on<ActivateSubscriptionEvent>(_onActivate);
  }

  Future<void> _onCheck(
    CheckSubscriptionEvent event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(SubscriptionLoading());
    try {
      final sub = await repository.checkStatus();
      emit(SubscriptionLoaded(sub));
    } catch (e) {
      emit(SubscriptionError(e.toString()));
    }
  }

  Future<void> _onActivate(
    ActivateSubscriptionEvent event,
    Emitter<SubscriptionState> emit,
  ) async {
    emit(SubscriptionLoading());
    try {
      await repository.activate(event.type);

      await Future.delayed(const Duration(seconds: 2));

      final sub = await repository.checkStatus();

      emit(SubscriptionSuccess(sub));
    } catch (e) {
      emit(SubscriptionError(e.toString()));
    }
  }
}
