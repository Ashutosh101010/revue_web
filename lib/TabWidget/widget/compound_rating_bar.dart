import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RatingBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween
            ,
            children: [
              Text("Excellent".toUpperCase(), style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w700,

                  fontStyle:  FontStyle.normal,
                  fontSize: 12.0
              ),),
              LinearPercentIndicator(
                trailing: Text(
                    "70%",
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                ),
                progressColor: Color(0xff0c5324),
                linearStrokeCap: LinearStrokeCap.butt,
                fillColor: Colors.white,
                backgroundColor: Color(0xcce5e5e5),
                lineHeight: 15,
                width: 170,
                percent: 0.7,

              ),

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Very Good".toUpperCase(), style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w700,

                  fontStyle:  FontStyle.normal,
                  fontSize: 12.0
              ),),
              LinearPercentIndicator(
                trailing: Text(
                    "80%",
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                ),
                progressColor: Color(0xff0c5324),
                linearStrokeCap: LinearStrokeCap.butt,
                fillColor: Colors.white,
                backgroundColor: Color(0xcce5e5e5),
                lineHeight: 15,
                width: 170,
                percent: 0.8,

              ),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Average".toUpperCase(), style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontStyle:  FontStyle.normal,
                  fontSize: 12.0
              ),),
              LinearPercentIndicator(
                trailing: Text(
                    "09%",
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                ),
                progressColor: Color(0xff0c5324),
                linearStrokeCap: LinearStrokeCap.butt,
                fillColor: Colors.white,
                backgroundColor: Color(0xcce5e5e5),
                lineHeight: 15,
                width: 170,
                percent: 0.2,

              ),

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Poor".toUpperCase(), style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w700,

                  fontStyle:  FontStyle.normal,
                  fontSize: 12.0
              ),),
              LinearPercentIndicator(
                trailing: Text(
                    "02%",
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                ),
                progressColor: Color(0xff0c5324),
                linearStrokeCap: LinearStrokeCap.butt,
                fillColor: Colors.white,
                backgroundColor: Color(0xcce5e5e5),
                lineHeight: 15,
                width: 170,
                percent: 0.1,

              ),

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Very Poor".toUpperCase(), style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w700,

                  fontStyle:  FontStyle.normal,
                  fontSize: 12.0
              ),),
              LinearPercentIndicator(
                trailing: Text(
                    "00%",
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                ),
                progressColor: Color(0xff0c5324),
                linearStrokeCap: LinearStrokeCap.butt,
                fillColor: Colors.white,
                backgroundColor: Color(0xcce5e5e5),
                lineHeight: 15,
                width: 170,
                percent: 0.0,

              ),

            ],
          ),
        ),


      ],
    );
  }
}