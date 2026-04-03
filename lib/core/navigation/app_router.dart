import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../di/injection_container.dart';
import '../../features/book_subscription/presentation/bloc/subscription_bloc.dart';
import '../../features/book_subscription/presentation/pages/onboarding_page.dart';
import '../../features/book_subscription/presentation/pages/paywall_page.dart';
import '../../features/book_subscription/presentation/pages/main_books_page.dart';

class AppRouter {
  late final GoRouter router;

  AppRouter({required String initialLocation}) {
    router = GoRouter(
      initialLocation: initialLocation,

      redirect: (context, state) {
        final prefs = getIt<SharedPreferences>();
        final isActive = prefs.getBool('sub_active') ?? false;

        final isGoingToPublic =
            state.uri.path == '/onboarding' || state.uri.path == '/paywall';
        final isGoingToPrivate = state.uri.path == '/main';

        if (isActive && isGoingToPublic) {
          return '/main';
        }
        if (!isActive && isGoingToPrivate) {
          return '/onboarding';
        }

        return null;
      },

      routes: [
        GoRoute(
          path: '/onboarding',
          name: 'onboarding',
          builder: (_, __) => const OnboardingPage(),
        ),
        GoRoute(
          path: '/paywall',
          name: 'paywall',
          builder: (_, __) => BlocProvider(
            create: (context) => getIt<SubscriptionBloc>(),
            child: const PaywallPage(),
          ),
        ),
        GoRoute(
          path: '/main',
          name: 'main',
          builder: (_, __) => const MainBooksPage(),
        ),
      ],
    );
  }
}
