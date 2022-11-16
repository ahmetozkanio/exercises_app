import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../theme/color.dart';
import './exercises_view_model.dart';

class ExercisesView extends ExercisesViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backGroundColor,
        child: CustomScrollView(
          slivers: [
            sliverAppBar(context),
            exercisesSliverList(),
            const SliverPadding(padding: EdgeInsets.only(bottom: 32.0))
          ],
        ),
      ),
    );
  }

  SliverAppBar sliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backGroundColor,
      toolbarHeight: 96,
      pinned: true,
      title: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                height: 48.0,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  onChanged: (value) {
                    search(value);
                  },
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      contentPadding: const EdgeInsets.all(16.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.0,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.0,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.0,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      labelStyle: const TextStyle(fontSize: 18),
                      hintStyle: TextStyle(fontSize: 18, color: textColor),
                      hintText: "search"),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: IconButton(
                    icon: Icon(CupertinoIcons.slider_horizontal_3,
                        color: iconColor),
                    onPressed: null),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Center(
            child: Text(
              '${searchExercisesList.length} results found.',
              style: TextStyle(color: textColor),
            ),
          )
        ],
      ),
    );
  }

  SliverList exercisesSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.exercisesDetail,
            arguments: searchExercisesList[index],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            child: exercisesCustomCard(index),
          ),
        ),
        childCount: searchExercisesList.length,
      ),
    );
  }

  Card exercisesCustomCard(int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Text(
              searchExercisesList[index].name ?? "exercise name",
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: backGroundColor,
                    borderRadius: BorderRadius.circular(16.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    searchExercisesList[index].type ?? "type",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              searchExercisesList[index].muscle ?? "muscle",
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
