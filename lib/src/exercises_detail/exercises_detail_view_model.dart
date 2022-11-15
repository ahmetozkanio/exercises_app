import 'package:exercises_app/src/exercises/model/exercises.dart';
import 'package:flutter/material.dart';
import './exercises_detail.dart';

abstract class ExercisesDetailViewModel extends State<ExercisesDetail> {
  ExercisesDetailViewModel(this.arguments);

  ExercisesEntity? arguments;

  @override
  void initState() {
    super.initState();
  }
}
