import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/injection_container.dart' as di;
import 'core/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  final prefs = di.getIt<SharedPreferences>();
  final isActive = prefs.getBool('sub_active') ?? false;

  final startRoute = isActive ? '/main' : '/onboarding';

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(BookApp(initialRoute: startRoute));
}

class BookApp extends StatelessWidget {
  final String initialRoute;
  const BookApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(initialLocation: initialRoute);

    return MaterialApp.router(
      title: 'Book Subscription',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      routerConfig: appRouter.router,
    );
  }
}
