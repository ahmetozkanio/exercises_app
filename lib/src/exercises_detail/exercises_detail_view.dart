import 'package:exercises_app/src/exercises_detail/widgets/detail_text_widgets.dart';
import 'package:exercises_app/src/theme/color.dart';
import 'package:flutter/material.dart';
import './exercises_detail_view_model.dart';

class ExercisesDetailView extends ExercisesDetailViewModel {
  ExercisesDetailView(super.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: iconColor),
        backgroundColor: backGroundColor,
        title: Text(
          arguments?.name ?? "adi",
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: detailBody(),
    );
  }

  Padding detailBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 48.0,
          ),
          titlesRow("Name", arguments?.name ?? "name"),
          const Divider(),
          titlesRow("Type", arguments?.type ?? "type"),
          Divider(),
          titlesRow("Muscle", arguments?.muscle ?? "muscle"),
          Divider(),
          titlesRow("Equipment", arguments?.equipment ?? "equipment"),
          Divider(),
          titlesRow("Difficulty", arguments?.difficulty ?? "difficulty"),
          Divider(),
          detailTitleText("Instructions"),
          SizedBox(
            height: 8.0,
          ),
          Text(
            arguments?.instructions ?? "instructions",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
