import 'package:flutter/material.dart';

Widget titlesRow(String title, String subtitle) {
  return Row(
    children: [
      detailTitleText(title),
      Expanded(child: detailSubtitleText(subtitle))
    ],
  );
}

Widget detailTitleText(String title) {
  return Text(
    "$title: ",
    overflow: TextOverflow.clip,
    style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
  );
}

Widget detailSubtitleText(String subTitle) {
  return Text(
    subTitle,
    overflow: TextOverflow.clip,
    style: const TextStyle(
      fontSize: 22.0,
    ),
  );
}
