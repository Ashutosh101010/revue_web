import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget addressWidget(String address){
  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AutoSizeText(
              "Location",
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,

                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AutoSizeText(
              address,
              style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 14),
            ),
          )
        ],
      ),
    ),
  );
}