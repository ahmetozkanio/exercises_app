import 'package:exercises_app/src/exercises/model/exercises.dart';
import 'package:flutter/material.dart';
import './exercises_detail_view.dart';

class ExercisesDetail extends StatefulWidget {
  ExercisesDetail(this.arguments, {super.key});
  ExercisesEntity arguments;
  @override
  ExercisesDetailView createState() => ExercisesDetailView(this.arguments);
}
