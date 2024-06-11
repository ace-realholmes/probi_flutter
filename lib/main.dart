import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:probi_flutter/features/post/providers/post.provider.dart';
import 'package:probi_flutter/features/post/providers/theme.provider.dart';
import 'package:probi_flutter/features/post/services/navigator.service.dart';
import 'package:probi_flutter/routing/app.router.dart';
import 'package:probi_flutter/themes/global.themes.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(
          create: (_) => PostProvider(NavigationService.instance)),
        ChangeNotifierProvider<ThemeProvider>(create: (_)=> ThemeProvider())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: GlobalThemData.lightThemeData,
        darkTheme: GlobalThemData.darkThemeData,
        themeMode: ThemeProvider().themeMode,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
