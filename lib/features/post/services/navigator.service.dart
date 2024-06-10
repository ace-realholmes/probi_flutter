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

  goBack() {
    return navigationKey.currentContext!.router.back();
  }

  showLoader() {
    Future.delayed(Duration.zero, () {
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
