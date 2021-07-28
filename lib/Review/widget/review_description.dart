import 'package:flutter/material.dart';

Widget reviewDetail(String review){
  return Wrap(children: [
    Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "Review",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,

              fontStyle: FontStyle.normal,
              fontSize: 16.0),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(review,
          style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: 14),
          textAlign: TextAlign.left),
    ),
  ],);
}
