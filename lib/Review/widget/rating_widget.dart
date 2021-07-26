import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:webrevue/constants/get_rating_percent.dart';

Widget ratingWidget(double rating){
  return   Flexible(
    flex: 1,
    child:  Padding(
      padding: const EdgeInsets.all(4.0),
      child: FittedBox(fit: BoxFit.fitWidth,
        child: Row(
          children: [
            GFRating(
              size: 20,
              value: getpercentage(rating),
              color: Colors.yellow,
              borderColor: Colors.yellow,
              onChanged: (value) {
                print(value);
              },
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(fit: BoxFit.fitWidth,
                child: Row(
                  children: [
                    AutoSizeText(
                       rating.toStringAsFixed(1),
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,

                            fontStyle:  FontStyle.normal,
                            fontSize: 16.0
                        ),
                        textAlign: TextAlign.left
                    ),

                    AutoSizeText(
                        " (54 reviews)",
                        style: TextStyle(
                            color: Colors.black54,
                            fontStyle:  FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0
                        ),
                        textAlign: TextAlign.left
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
}