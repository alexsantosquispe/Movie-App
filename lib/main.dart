import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/blocs/blocs.dart';
import 'package:movie_app/src/core/services/services.dart';
import 'package:movie_app/src/ui/constants/base_colors.dart';
import 'package:movie_app/src/ui/routing/name_routes.dart';
import 'package:movie_app/src/ui/routing/router_manager.dart';

void main() {
  setupLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
          create: (BuildContext context) => MoviesBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primaryColor: PrimaryColor,
        accentColor: AccentColor,
        fontFamily: 'Nunito',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline3: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w700, color: TextColor),
          headline4: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w700, color: TextColor),
          bodyText1: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w600, color: TextColor),
          bodyText2: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.w600, color: TextColor),
        ),
      ),
      initialRoute: HOME,
      onGenerateRoute: RouterManager.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
