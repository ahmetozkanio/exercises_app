import 'package:exercises_app/src/exercises/model/exercises.dart';
import 'package:flutter/material.dart';
import './exercises_detail_view.dart';

// ignore: must_be_immutable
class ExercisesDetail extends StatefulWidget {
  ExercisesDetail(this.arguments, {super.key});
  ExercisesEntity arguments;
  @override
  // ignore: no_logic_in_create_state
  ExercisesDetailView createState() => ExercisesDetailView(arguments);
}
