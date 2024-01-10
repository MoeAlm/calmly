import 'package:flutter/material.dart';

import '../constant.dart';

Widget defaultTextField({String? hintText, int? maxLines = 1}) {
  return TextField(
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
    ),
  );
}
