import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/get_rating_percent.dart';
import 'package:webrevue/model/ReviewModal.dart';

class ReviewRatings extends StatelessWidget{
  ReviewModal reviewModal;

  ReviewRatings(this.reviewModal);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 8,right: 8),
      child: FittedBox(fit: BoxFit.fitWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircularPercentIndicator(
                radius: 40.0,
                animation: false,
                lineWidth: 4.0,
                percent: getpercentage(reviewModal.facilities),
                center: new Text(
                  reviewModal.facilities.toStringAsFixed(1),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.black26,
                progressColor: Colors.red,
                footer: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text("Facilities",
                      style: const TextStyle(
                          color: const Color(0xff000000),

                          fontStyle: FontStyle.normal,
                          fontSize: 14),
                      textAlign: TextAlign.left),
                ) ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircularPercentIndicator(
                radius: 40.0,
                animation: false,
                lineWidth: 4.0,
                percent: getpercentage(reviewModal.design),
                center: new Text(
                  reviewModal.design.toStringAsFixed(1),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.black26,
                progressColor: Colors.green.shade500,
                footer: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text("Design",
                      style: const TextStyle(
                          color: const Color(0xff000000),

                          fontStyle: FontStyle.normal,
                          fontSize: 14),
                      textAlign: TextAlign.left),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircularPercentIndicator(
                radius: 40.0,
                animation: false,
                lineWidth: 4.0,
                percent: getpercentage(reviewModal.location),
                center: new Text(
                  reviewModal.location.toStringAsFixed(1),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.black26,
                progressColor: Colors.orangeAccent.shade400,
                footer: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text("Location",
                      style: const TextStyle(
                          color: const Color(0xff000000),

                          fontStyle: FontStyle.normal,
                          fontSize: 14),
                      textAlign: TextAlign.left),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircularPercentIndicator(
                radius: 40.0,
                animation: false,
                lineWidth: 4.0,
                percent: getpercentage(reviewModal.value),
                center: new Text(
                  reviewModal.value.toStringAsFixed(1),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.black26,
                progressColor: Colors.yellow,
                footer: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text("Value",
                      style: const TextStyle(
                          color: const Color(0xff000000),

                          fontStyle: FontStyle.normal,
                          fontSize: 14),
                      textAlign: TextAlign.left),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircularPercentIndicator(
                radius: 40.0,
                animation: false,
                lineWidth: 4.0,
                percent: getpercentage(reviewModal.management),
                center: new Text(
                  reviewModal.management.toStringAsFixed(1),
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.black26,
                progressColor: Colors.indigo.shade600,
                footer: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text("Management",
                      style: const TextStyle(
                          color: const Color(0xff000000),

                          fontStyle: FontStyle.normal,
                          fontSize: 14),
                      textAlign: TextAlign.left),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}