import 'package:auto_route/auto_route.dart';

import 'app.router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override  
  List<AutoRoute> get routes => [
    AutoRoute(page: PostRouteList.page, path: "/post/list", initial: true),
    AutoRoute(page: PostRouteView.page, path: "/post/view/:id"),
    AutoRoute(page: PostRouteAdd.page, path: "/post/add/:userId"),
    AutoRoute(page: PostRouteUpdate.page, path: "/post/update/:id")
  ];
}