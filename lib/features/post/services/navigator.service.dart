import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();
  

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  navigate(String path) {
    return navigationKey.currentContext!.router.pushNamed(path);
  }

  void goBack() {
    if (navigationKey.currentContext != null) {
      navigationKey.currentContext!.router.back();
    } else {
      print('Context is null, cannot go back');
    }
  }

  showLoader() {
    Future.delayed(Duration(seconds: 2), () {
      showDialog(
          context: navigationKey.currentContext!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          });
    });
  }
}
