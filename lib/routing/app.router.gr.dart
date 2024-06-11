// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:probi_flutter/features/post/screens/posts_add.screen.dart'
    as _i1;
import 'package:probi_flutter/features/post/screens/posts_draft.screen.dart'
    as _i2;
import 'package:probi_flutter/features/post/screens/posts_favorites.screen.dart'
    as _i3;
import 'package:probi_flutter/features/post/screens/posts_list.screen.dart'
    as _i4;
import 'package:probi_flutter/features/post/screens/posts_update.screen.dart'
    as _i5;
import 'package:probi_flutter/features/post/screens/posts_view.screen.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    PostRouteAdd.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PostScreenAdd(),
      );
    },
    PostRouteDraft.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PostScreenDraft(),
      );
    },
    PostRouteFavorites.name: (routeData) {
      final args = routeData.argsAs<PostRouteFavoritesArgs>(
          orElse: () => const PostRouteFavoritesArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PostScreenFavorites(key: args.key),
      );
    },
    PostRouteList.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PostScreenList(),
      );
    },
    PostRouteUpdate.name: (routeData) {
      final args = routeData.argsAs<PostRouteUpdateArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.PostScreenUpdate(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PostRouteView.name: (routeData) {
      final args = routeData.argsAs<PostRouteViewArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.PostScreenView(
          key: args.key,
          id: args.id,
          index: args.index,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.PostScreenAdd]
class PostRouteAdd extends _i7.PageRouteInfo<void> {
  const PostRouteAdd({List<_i7.PageRouteInfo>? children})
      : super(
          PostRouteAdd.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteAdd';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PostScreenDraft]
class PostRouteDraft extends _i7.PageRouteInfo<void> {
  const PostRouteDraft({List<_i7.PageRouteInfo>? children})
      : super(
          PostRouteDraft.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteDraft';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PostScreenFavorites]
class PostRouteFavorites extends _i7.PageRouteInfo<PostRouteFavoritesArgs> {
  PostRouteFavorites({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          PostRouteFavorites.name,
          args: PostRouteFavoritesArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PostRouteFavorites';

  static const _i7.PageInfo<PostRouteFavoritesArgs> page =
      _i7.PageInfo<PostRouteFavoritesArgs>(name);
}

class PostRouteFavoritesArgs {
  const PostRouteFavoritesArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'PostRouteFavoritesArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.PostScreenList]
class PostRouteList extends _i7.PageRouteInfo<void> {
  const PostRouteList({List<_i7.PageRouteInfo>? children})
      : super(
          PostRouteList.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteList';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PostScreenUpdate]
class PostRouteUpdate extends _i7.PageRouteInfo<PostRouteUpdateArgs> {
  PostRouteUpdate({
    _i8.Key? key,
    required int id,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          PostRouteUpdate.name,
          args: PostRouteUpdateArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'PostRouteUpdate';

  static const _i7.PageInfo<PostRouteUpdateArgs> page =
      _i7.PageInfo<PostRouteUpdateArgs>(name);
}

class PostRouteUpdateArgs {
  const PostRouteUpdateArgs({
    this.key,
    required this.id,
  });

  final _i8.Key? key;

  final int id;

  @override
  String toString() {
    return 'PostRouteUpdateArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.PostScreenView]
class PostRouteView extends _i7.PageRouteInfo<PostRouteViewArgs> {
  PostRouteView({
    _i8.Key? key,
    required int id,
    required int index,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          PostRouteView.name,
          args: PostRouteViewArgs(
            key: key,
            id: id,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'PostRouteView';

  static const _i7.PageInfo<PostRouteViewArgs> page =
      _i7.PageInfo<PostRouteViewArgs>(name);
}

class PostRouteViewArgs {
  const PostRouteViewArgs({
    this.key,
    required this.id,
    required this.index,
  });

  final _i8.Key? key;

  final int id;

  final int index;

  @override
  String toString() {
    return 'PostRouteViewArgs{key: $key, id: $id, index: $index}';
  }
}
