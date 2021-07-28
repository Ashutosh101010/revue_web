import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webrevue/constants/get_rating_percent.dart';

Widget overAllRating(double rating){
  return  Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      alignment: Alignment.center,
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 50.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 5.0,
            percent: getpercentage(rating),
            center: new Text(
             rating.toStringAsFixed(1),
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.black26,
            progressColor: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Overall Rating".toUpperCase(),
                style: const TextStyle(
                    color:  Colors.black87,
                    fontWeight: FontWeight.w700,

                    fontStyle:  FontStyle.normal,
                    fontSize: 12.0
                ),
                textAlign: TextAlign.left
            ),
          )
        ],
      ));

}