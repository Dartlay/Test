class AppRoutes {
  static const onboarding = AppRoute('onboarding');
  static const paywall = AppRoute('paywall');
  static const mainBooks = AppRoute('main_books');
  static const books = AppRoute('books');
}

class AppRoute {
  final String name;
  final String? _segment;
  final AppRoute? parent;

  const AppRoute(this.name, {String? segment, this.parent})
    : _segment = segment;

  String get segment => _segment ?? name;

  String get path {
    if (parent == null) {
      return '/$segment';
    }
    return '${parent!.path}/$segment';
  }

  String get relativePath => segment;
}
