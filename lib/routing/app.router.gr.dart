// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:probi_flutter/features/post/screens/posts.add.screen.dart'
    as _i1;
import 'package:probi_flutter/features/post/screens/posts.list.screen.dart'
    as _i2;
import 'package:probi_flutter/features/post/screens/posts.update.screen.dart'
    as _i3;
import 'package:probi_flutter/features/post/screens/posts.view.screen.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    PostRouteAdd.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PostScreenAdd(),
      );
    },
    PostRouteList.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PostScreenList(),
      );
    },
    PostRouteUpdate.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PostScreenUpdate(),
      );
    },
    PostRouteView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PostScreenView(),
      );
    },
  };
}

/// generated route for
/// [_i1.PostScreenAdd]
class PostRouteAdd extends _i5.PageRouteInfo<void> {
  const PostRouteAdd({List<_i5.PageRouteInfo>? children})
      : super(
          PostRouteAdd.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteAdd';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PostScreenList]
class PostRouteList extends _i5.PageRouteInfo<void> {
  const PostRouteList({List<_i5.PageRouteInfo>? children})
      : super(
          PostRouteList.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteList';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PostScreenUpdate]
class PostRouteUpdate extends _i5.PageRouteInfo<void> {
  const PostRouteUpdate({List<_i5.PageRouteInfo>? children})
      : super(
          PostRouteUpdate.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteUpdate';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PostScreenView]
class PostRouteView extends _i5.PageRouteInfo<void> {
  const PostRouteView({List<_i5.PageRouteInfo>? children})
      : super(
          PostRouteView.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
