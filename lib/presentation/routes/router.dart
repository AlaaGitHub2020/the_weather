import 'package:auto_route/annotations.dart';
import 'package:the_weather/presentation/home/home_page.dart';

@MaterialAutoRouter(
  preferRelativeImports: true,
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
  ],
)
class $AppRouter {}
