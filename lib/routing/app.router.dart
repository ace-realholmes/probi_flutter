import 'package:auto_route/auto_route.dart';

import 'app.router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: PostListRoute.page, path: "/post/list", initial: true),
        AutoRoute(page: PostViewRoute.page, path: "/post/view"),
        AutoRoute(page: PostAddRoute.page, path: "/post/add"),
        AutoRoute(page: PostUpdateRoute.page, path: "/post/update"),
        AutoRoute(page: PostFavoriteRoute.page, path: "/post/favorites"),
        AutoRoute(page: PostDraftRoute.page, path: "/post/draft"),
        AutoRoute(page: SamplePostCreateRoute.page, path: "/post/sample", )
      ];
}
