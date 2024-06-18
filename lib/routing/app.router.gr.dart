// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
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
import 'package:probi_flutter/features/sample/screens/sample_post_create.screen.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    PostRouteAdd.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PostScreenAdd(),
      );
    },
    PostRouteDraft.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PostScreenDraft(),
      );
    },
    PostRouteFavorites.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PostScreenFavorites(),
      );
    },
    PostRouteList.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PostScreenList(),
      );
    },
    PostRouteUpdate.name: (routeData) {
      final args = routeData.argsAs<PostRouteUpdateArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.PostScreenUpdate(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PostRouteView.name: (routeData) {
      final args = routeData.argsAs<PostRouteViewArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.PostScreenView(
          key: args.key,
          id: args.id,
          index: args.index,
        ),
      );
    },
    SamplePostCreateRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SamplePostCreateScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.PostScreenAdd]
class PostRouteAdd extends _i8.PageRouteInfo<void> {
  const PostRouteAdd({List<_i8.PageRouteInfo>? children})
      : super(
          PostRouteAdd.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteAdd';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PostScreenDraft]
class PostRouteDraft extends _i8.PageRouteInfo<void> {
  const PostRouteDraft({List<_i8.PageRouteInfo>? children})
      : super(
          PostRouteDraft.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteDraft';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PostScreenFavorites]
class PostRouteFavorites extends _i8.PageRouteInfo<void> {
  const PostRouteFavorites({List<_i8.PageRouteInfo>? children})
      : super(
          PostRouteFavorites.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteFavorites';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PostScreenList]
class PostRouteList extends _i8.PageRouteInfo<void> {
  const PostRouteList({List<_i8.PageRouteInfo>? children})
      : super(
          PostRouteList.name,
          initialChildren: children,
        );

  static const String name = 'PostRouteList';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PostScreenUpdate]
class PostRouteUpdate extends _i8.PageRouteInfo<PostRouteUpdateArgs> {
  PostRouteUpdate({
    _i9.Key? key,
    required int id,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          PostRouteUpdate.name,
          args: PostRouteUpdateArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'PostRouteUpdate';

  static const _i8.PageInfo<PostRouteUpdateArgs> page =
      _i8.PageInfo<PostRouteUpdateArgs>(name);
}

class PostRouteUpdateArgs {
  const PostRouteUpdateArgs({
    this.key,
    required this.id,
  });

  final _i9.Key? key;

  final int id;

  @override
  String toString() {
    return 'PostRouteUpdateArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.PostScreenView]
class PostRouteView extends _i8.PageRouteInfo<PostRouteViewArgs> {
  PostRouteView({
    _i9.Key? key,
    required int id,
    required int index,
    List<_i8.PageRouteInfo>? children,
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

  static const _i8.PageInfo<PostRouteViewArgs> page =
      _i8.PageInfo<PostRouteViewArgs>(name);
}

class PostRouteViewArgs {
  const PostRouteViewArgs({
    this.key,
    required this.id,
    required this.index,
  });

  final _i9.Key? key;

  final int id;

  final int index;

  @override
  String toString() {
    return 'PostRouteViewArgs{key: $key, id: $id, index: $index}';
  }
}

/// generated route for
/// [_i7.SamplePostCreateScreen]
class SamplePostCreateRoute extends _i8.PageRouteInfo<void> {
  const SamplePostCreateRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SamplePostCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'SamplePostCreateRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
