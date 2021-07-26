
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget priceWidget(String price){
  return  Flexible(flex: 1,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: FittedBox(fit: BoxFit.fitWidth,
        child: Row(
          children: [
            AutoSizeText(
                "Price ",
                style: TextStyle(
                    color:  Colors.black87,

                    fontWeight: FontWeight.w700,
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
            AutoSizeText(
               price+" QAR",
                style:  TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,

                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
          ],
        ),
      ),
    ),);
}