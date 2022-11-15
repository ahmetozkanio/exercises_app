import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../theme/color.dart';
import './exercises_view_model.dart';

class ExercisesView extends ExercisesViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: Container(
        color: backGroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: backGroundColor,
              toolbarHeight: 96,
              pinned: true,
              title: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        height: 48.0,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          onChanged: (value) {
                            search(value);
                          },
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              contentPadding: EdgeInsets.all(16.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              labelStyle: TextStyle(fontSize: 18),
                              hintStyle:
                                  TextStyle(fontSize: 18, color: textColor),
                              hintText: "search"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                            icon: Icon(CupertinoIcons.slider_horizontal_3,
                                color: iconColor),
                            onPressed: null),
                      ),
                    ],
                  ),
                  SizedBox(
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
            ),
            SliverList(
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
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.0),
                            Text(
                              searchExercisesList[index].name ??
                                  "exercise name",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                childCount: searchExercisesList.length,
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 32.0))
          ],
        ),
      ),
    );
  }
}
