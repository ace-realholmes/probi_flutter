import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:probi_flutter/common/env.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/providers/theme.provider.dart';
import 'package:probi_flutter/features/post/services/post.service.dart';
import 'package:probi_flutter/features/post/utils/dio_interceptor.utils.dart';
import 'package:probi_flutter/routing/app.router.dart';
import 'package:probi_flutter/themes/dark.theme.dart';
import 'package:probi_flutter/themes/default.theme.dart';
import 'package:provider/provider.dart';

/// The entry point of the application.
///
/// Loads environment variables and runs the app.
Future main() async {

  final baseConfig = Dio(BaseOptions(baseUrl: Env.baseUrl));
  PostService.instance.init(baseConfig);
  baseConfig.interceptors.add(dioInterceptor);
  Logger().d('Base URL: ${Env.baseUrl}');

  // Run the Flutter application.
  runApp(const MyApp());
}

/// The main widget of the application.
///
/// Sets up the app's theme, routing, and global providers.
class MyApp extends StatefulWidget {
  /// Creates a `MyApp` widget.
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

/// State for the `MyApp` widget.
///
/// Manages the application's routing and provides global state management
/// through `MultiProvider`.
class _MyAppState extends State<MyApp> {
  /// The router for managing navigation and routing in the application.
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// Provides global state management for the application.
      ///
      /// Includes providers for `PostProvider` and `ThemeProvider`.
      providers: [
        ChangeNotifierProvider<PostProvider>(
          create: (_) => PostProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,

            /// Sets the light theme for the application.
            theme: lightThemeData,

            /// Sets the dark theme for the application.
            darkTheme: darkThemeData,

            /// Controls the theme mode (light or dark) based on `ThemeProvider`.
            themeMode: themeProvider.themeMode,

            /// Configures the router for navigation.
            routerConfig: _appRouter.config(),

            /// Initializes the EasyLoading builder for global loading indicators.
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
