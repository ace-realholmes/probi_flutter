// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
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
import 'package:probi_flutter/features/practice/screens/practice.screen.dart'
    as _i7;
import 'package:probi_flutter/features/sample/screens/sample_post_create.screen.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    PostAddRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PostAddScreen(),
      );
    },
    PostDraftRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PostDraftScreen(),
      );
    },
    PostFavoriteRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PostFavoriteScreen(),
      );
    },
    PostListRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PostListScreen(),
      );
    },
    PostUpdateRoute.name: (routeData) {
      final args = routeData.argsAs<PostUpdateRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.PostUpdateScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PostViewRoute.name: (routeData) {
      final args = routeData.argsAs<PostViewRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.PostViewScreen(
          key: args.key,
          id: args.id,
          index: args.index,
        ),
      );
    },
    PracticeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PracticeScreen(),
      );
    },
    SamplePostCreateRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SamplePostCreateScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.PostAddScreen]
class PostAddRoute extends _i9.PageRouteInfo<void> {
  const PostAddRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PostAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostAddRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PostDraftScreen]
class PostDraftRoute extends _i9.PageRouteInfo<void> {
  const PostDraftRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PostDraftRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostDraftRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PostFavoriteScreen]
class PostFavoriteRoute extends _i9.PageRouteInfo<void> {
  const PostFavoriteRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PostFavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostFavoriteRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PostListScreen]
class PostListRoute extends _i9.PageRouteInfo<void> {
  const PostListRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PostListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostListRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PostUpdateScreen]
class PostUpdateRoute extends _i9.PageRouteInfo<PostUpdateRouteArgs> {
  PostUpdateRoute({
    _i10.Key? key,
    required int id,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          PostUpdateRoute.name,
          args: PostUpdateRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'PostUpdateRoute';

  static const _i9.PageInfo<PostUpdateRouteArgs> page =
      _i9.PageInfo<PostUpdateRouteArgs>(name);
}

class PostUpdateRouteArgs {
  const PostUpdateRouteArgs({
    this.key,
    required this.id,
  });

  final _i10.Key? key;

  final int id;

  @override
  String toString() {
    return 'PostUpdateRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.PostViewScreen]
class PostViewRoute extends _i9.PageRouteInfo<PostViewRouteArgs> {
  PostViewRoute({
    _i10.Key? key,
    required int id,
    required int index,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          PostViewRoute.name,
          args: PostViewRouteArgs(
            key: key,
            id: id,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'PostViewRoute';

  static const _i9.PageInfo<PostViewRouteArgs> page =
      _i9.PageInfo<PostViewRouteArgs>(name);
}

class PostViewRouteArgs {
  const PostViewRouteArgs({
    this.key,
    required this.id,
    required this.index,
  });

  final _i10.Key? key;

  final int id;

  final int index;

  @override
  String toString() {
    return 'PostViewRouteArgs{key: $key, id: $id, index: $index}';
  }
}

/// generated route for
/// [_i7.PracticeScreen]
class PracticeRoute extends _i9.PageRouteInfo<void> {
  const PracticeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PracticeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PracticeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SamplePostCreateScreen]
class SamplePostCreateRoute extends _i9.PageRouteInfo<void> {
  const SamplePostCreateRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SamplePostCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'SamplePostCreateRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
