import 'package:flutter/material.dart';
import 'package:probi_flutter/routing/app.router.dart';
import 'package:probi_flutter/themes/default.themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
