import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/get_rating_percent.dart';
import 'package:webrevue/model/CompoundModal.dart';

class CompoundRating extends StatelessWidget{
  CompoundModal compoundModal;double maxWidth;

  CompoundRating(@required this.compoundModal,this.maxWidth);

  @override
  Widget build(BuildContext context) {
    return  FittedBox(fit:BoxFit.fitWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircularPercentIndicator(
              radius:maxWidth>=900? 40.0:maxWidth>=600?35:30,
              lineWidth:maxWidth>=900? 4.3:maxWidth>=600?3.5:2.5,
              animation: false,

              percent: getpercentage(compoundModal.facility),
              center: new Text(
                compoundModal.facility.toStringAsFixed(1),
                style:
                new TextStyle(color:  Colors.black87,fontWeight: FontWeight.w700,
                    fontSize: 12.0),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.black26,
              progressColor:  ColorClass.redColor,
              fillColor: Colors.white,
              footer: Padding(
                padding: const EdgeInsets.only(
                    top: 8,right: 4),
                child: AutoSizeText(
                    "Facilities".toUpperCase(),
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 10.0
                    ),
                    textAlign: TextAlign.left
                ),
              ) ,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircularPercentIndicator(
              radius:maxWidth>=900? 40.0:maxWidth>=600?35:30,
              lineWidth:maxWidth>=900? 4.3:maxWidth>=600?3.5:2.5,

              animation: false,

              percent:getpercentage(compoundModal.design),
              center: new Text(
                compoundModal.design.toStringAsFixed(1),
                style:
                new TextStyle(color:  Colors.black87, fontSize: 12.0,fontWeight: FontWeight.w700),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.black26,
              progressColor:  ColorClass.blueColor,
              fillColor: Colors.white,
              footer:  Padding(
                padding: const EdgeInsets.only(
                    top: 8,right: 4),
                child: AutoSizeText(
                    "Design".toUpperCase(),
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 10.0
                    ),
                    textAlign: TextAlign.left
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircularPercentIndicator(
              radius:maxWidth>=900? 40.0:maxWidth>=600?35:30,
              lineWidth:maxWidth>=900? 4.3:maxWidth>=600?3.5:2.5,

              animation: false,
              percent: getpercentage(compoundModal.location),
              center: new Text(
                compoundModal.location.toStringAsFixed(1),
                style:
                new TextStyle(color:  Colors.black87, fontSize: 12.0,fontWeight: FontWeight.w700),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.black26,
              progressColor: Colors.green,
              fillColor: Colors.white,
              footer: Padding(
                padding: const EdgeInsets.only(
                    top: 8,right: 4),
                child: AutoSizeText(
                    "Location".toUpperCase(),
                    style: const TextStyle(
                        color:  const Color(0xff000000),
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 10.0,letterSpacing: 0.5
                    ),
                    textAlign: TextAlign.left
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircularPercentIndicator(
              animation: false,
              radius:maxWidth>=900? 40.0:maxWidth>=600?35:30,
              lineWidth:maxWidth>=900? 4.3:maxWidth>=600?3.5:2.5,

              percent:getpercentage( compoundModal.value),
              center: new Text(
                compoundModal.value.toStringAsFixed(1),
                style:
                new TextStyle(   color:  Colors.black87,fontSize: 12.0,fontWeight: FontWeight.w700),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.black26,
              progressColor:  Colors.orangeAccent,
              fillColor: Colors.white,
              footer: Padding(
                padding: const EdgeInsets.only(
                    top: 8,right: 4),
                child: AutoSizeText(
                    "Value".toUpperCase(),
                    style: const TextStyle(
                      color:  Colors.black87,
                      fontWeight: FontWeight.w700,

                      fontStyle:  FontStyle.normal,
                      fontSize: 10.0,
                    ),
                    textAlign: TextAlign.left
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircularPercentIndicator(
              radius:maxWidth>=900? 40.0:maxWidth>=600?35:30,
              lineWidth:maxWidth>=900? 4.3:maxWidth>=600?3.5:2.5,

              animation: false,
              percent:getpercentage(compoundModal.management),
              center: new Text(
                compoundModal.management.toStringAsFixed(1),
                style:
                new TextStyle(
                    color:  Colors.black87,fontSize: 12.0,fontWeight: FontWeight.w700),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.black26,
              progressColor: Colors.indigo.shade600,
              fillColor: Colors.white,
              footer: Padding(
                padding: const EdgeInsets.only(
                    top: 8,right: 4),
                child: AutoSizeText(
                    "Management".toUpperCase(),
                    style: const TextStyle(
                      color:  Colors.black87,
                      fontWeight: FontWeight.w700,

                      fontStyle:  FontStyle.normal,
                      fontSize: 10.0,
                    ),
                    textAlign: TextAlign.left
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}