import 'package:exercises_app/src/exercises/service/exercises_service.dart';
import 'package:flutter/material.dart';
import './exercises.dart';
import 'model/exercises.dart';

abstract class ExercisesViewModel extends State<Exercises> {
  List<ExercisesEntity> exercisesList = [];
  List<ExercisesEntity> searchExercisesList = [];

  @override
  void initState() {
    //
    getExercisesService();
    super.initState();
  }

  void getExercisesService() async {
    try {
      final List<ExercisesEntity>? exercisesItems =
          await ExercisesService().fetchExercises();

      if (exercisesItems != null) {
        setState(() {
          exercisesList = exercisesItems;
          searchExercisesList = exercisesList;
        });
      }
      print(exercisesItems);
    } finally {}
  }

  void search(String value) {
    setState(() {
      if (value.isNotEmpty) {
        List<ExercisesEntity> searchListData = [];
        for (ExercisesEntity item in exercisesList) {
          if (item.type != null &&
              item.type!.toLowerCase().contains(value.toLowerCase())) {
            searchListData.add(item);
          } else if (item.muscle != null &&
              item.muscle!.toLowerCase().contains(value.toLowerCase())) {
            searchListData.add(item);
          }
        }
        searchExercisesList = searchListData;
      } else {
        searchExercisesList = exercisesList;
      }
    });
  }
}
