import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/screens/detail.dart';
import 'package:movie_app/src/ui/screens/main_container.dart';
import 'name_routes.dart';

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return _getPage(settings, MainContainer());
      case DETAIL:
        return _getPage(settings, DetailPage());
      default:
        return _errorRoute();
    }
  }

  static PageRoute<dynamic> _getPage(RouteSettings settings, Widget page) {
    return _createPageRoute(settings, page);
  }

  static PageRouteBuilder<dynamic> _createPageRoute(
      RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return child;
      },
      settings: settings,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Error Route'),
        ),
      ),
    );
  }
}
