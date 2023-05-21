import 'package:flutter/material.dart';
import 'package:movies/core/locator/service_locator.dart';

import 'Moviemoduels/pressentation/movie_screen.dart';
import 'Moviemoduels/pressentation/views/movies_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: MainMoviesScreen(),
    );
  }
}
