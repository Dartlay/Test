import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/book_subscription/data/datasources/subscription_local_datasource.dart';
import '../../features/book_subscription/data/repositories/subscription_repository_impl.dart';
import '../../features/book_subscription/domain/repositories/subscription_repository.dart'; // ← Импорт абстракции
import '../../features/book_subscription/presentation/bloc/subscription_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);

  getIt.registerLazySingleton(() => SubscriptionLocalDataSource(getIt()));

  getIt.registerLazySingleton<SubscriptionRepository>(
    () => SubscriptionRepositoryImpl(getIt()),
  );

  getIt.registerFactory(() => SubscriptionBloc(getIt()));
}
