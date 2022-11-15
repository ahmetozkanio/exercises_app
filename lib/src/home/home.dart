import 'package:exercises_app/src/exercises/exercises.dart';
import 'package:exercises_app/src/exercises/model/exercises.dart';
import 'package:exercises_app/src/exercises_detail/exercises_detail.dart';
import 'package:exercises_app/src/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../routes/route_generator.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
