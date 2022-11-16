import 'package:exercises_app/src/exercises/exercises.dart';
import 'package:exercises_app/src/exercises/model/exercises.dart';
import 'package:exercises_app/src/exercises_detail/exercises_detail.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return buildRoute(const Exercises(), settings: settings);
      case AppRoutes.exercisesDetail:
        final arguments = settings.arguments as ExercisesEntity;
        return buildRoute(ExercisesDetail(arguments), settings: settings);
      default:
        return null;
    }
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }
}
