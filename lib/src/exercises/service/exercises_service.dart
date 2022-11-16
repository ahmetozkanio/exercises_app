import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../service/base_service.dart';
import '../model/exercises.dart';

class ExercisesService {
  final Uri _exercisesUrl = Uri.parse(BaseApi().getExercisesUrl());
  final Map<String, String> _headers = BaseApi().getHeaders();

  Future<List<ExercisesEntity>?> fetchExercises() async {
    try {
      final response = await http.get(_exercisesUrl, headers: _headers);

      if (response.statusCode == 200) {
        Iterable iterable = json.decode(response.body);
        List<ExercisesEntity> exercises = List<ExercisesEntity>.from(
            iterable.map((model) => ExercisesEntity.fromJson(model)));
        return exercises;
      }
    } catch (error) {
      if (kDebugMode) {
        print('Exercises Service Error : $error');
      }
      return null;
    }
    return null;
  }
}
