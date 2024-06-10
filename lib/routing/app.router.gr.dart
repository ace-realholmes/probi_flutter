// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:probi_flutter/features/post/screens/posts.add.screen.dart'
    as _i1;
import 'package:probi_flutter/features/post/screens/posts.favorites.screen.dart'
    as _i2;
import 'package:probi_flutter/features/post/screens/posts.list.screen.dart'
    as _i3;
import 'package:probi_flutter/features/post/screens/posts.update.screen.dart'
    as _i4;
import 'package:probi_flutter/features/post/screens/posts.view.screen.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    PostRouteAdd.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PostScreenAdd(),
      );
    },
    PostRouteFavorites.name: (routeData) {
      final args = routeData.argsAs<PostRouteFavoritesArgs>(
          orElse: () => const PostRouteFavoritesArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PostScreenFavorites(key: args.key),
      );
    },
    PostRouteList.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PostScreenList(),
      );
    },
    PostRouteUpdate.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PostScreenUpdate(),
      );
    },
    PostRouteView.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PostScreenView(),
      );
    },
  };
}

/// generated route for
/// [_i1.PostScreenAdd]
class PostRouteAdd extends _i6.PageRouteInfo<void> {
  const PostRouteAdd({List<_i6.PageRouteInfo>? children})
      : super(
          PostRouteAdd.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteAdd';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PostScreenFavorites]
class PostRouteFavorites extends _i6.PageRouteInfo<PostRouteFavoritesArgs> {
  PostRouteFavorites({
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          PostRouteFavorites.name,
          args: PostRouteFavoritesArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PostRouteFavorites';

  static const _i6.PageInfo<PostRouteFavoritesArgs> page =
      _i6.PageInfo<PostRouteFavoritesArgs>(name);
}

class PostRouteFavoritesArgs {
  const PostRouteFavoritesArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'PostRouteFavoritesArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.PostScreenList]
class PostRouteList extends _i6.PageRouteInfo<void> {
  const PostRouteList({List<_i6.PageRouteInfo>? children})
      : super(
          PostRouteList.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteList';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PostScreenUpdate]
class PostRouteUpdate extends _i6.PageRouteInfo<void> {
  const PostRouteUpdate({List<_i6.PageRouteInfo>? children})
      : super(
          PostRouteUpdate.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteUpdate';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PostScreenView]
class PostRouteView extends _i6.PageRouteInfo<void> {
  const PostRouteView({List<_i6.PageRouteInfo>? children})
      : super(
          PostRouteView.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteView';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
