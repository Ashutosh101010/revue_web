import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webrevue/constants/get_rating_percent.dart';
import 'package:webrevue/model/CompoundModal.dart';

class CompoundRating extends StatelessWidget{
  CompoundModal compoundModal;

  CompoundRating(this.compoundModal);

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(top: 5,bottom: 5),
        child: FittedBox(fit: BoxFit.fitWidth,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,top:8),
                child: CircularPercentIndicator(
                  radius: 38.0,
                  lineWidth: 3.4,
                  backgroundColor: Colors.black26,
                  percent: getpercentage(compoundModal.facility),
                  center: new Text(
                    compoundModal.facility.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontWeight:
                        FontWeight.bold,
                        fontSize: 10.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  progressColor: Colors.blue,
                  footer:Padding(
                    padding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                    child: AutoSizeText("Facilities".toUpperCase(),
                        softWrap: true,
                        style: const TextStyle(
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                            decorationStyle: TextDecorationStyle.solid,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.0),
                        textAlign: TextAlign.left),
                  ) ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,top:8),
                child: CircularPercentIndicator(
                  radius: 38.0,
                  lineWidth: 3.4,
                  backgroundColor: Colors.black26,
                  percent: getpercentage(compoundModal.design),
                  center: new Text(
                    compoundModal.design.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontWeight:
                        FontWeight.bold,
                        fontSize: 10.0),
                  ),
                  circularStrokeCap:
                  CircularStrokeCap.butt,
                  progressColor:
                  Colors.redAccent,
                  footer: Padding(
                    padding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                    child: AutoSizeText("Design".toUpperCase(),
                        style:  TextStyle(
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                            decorationStyle: TextDecorationStyle.solid,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.0),
                        textAlign: TextAlign.left),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,top:8),
                child: CircularPercentIndicator(
                  radius: 38.0,
                  lineWidth: 3.4,
                  backgroundColor: Colors.black26,
                  percent: getpercentage(compoundModal.location),
                  center: new Text(compoundModal.location.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  progressColor: Colors.green,
                  footer: Padding(
                    padding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                    child: AutoSizeText("Location".toUpperCase(),
                        style:  TextStyle(
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                            decorationStyle: TextDecorationStyle.solid,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.0),
                        textAlign:
                        TextAlign.left),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,top:8),
                child: CircularPercentIndicator(
                  radius: 38.0,
                  lineWidth: 3.4,
                  backgroundColor: Colors.black26,
                  percent: getpercentage(compoundModal.management),
                  center: new Text(
                    compoundModal.management.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  progressColor: Colors.yellow,
                  footer: Padding(
                    padding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                    child: AutoSizeText("Management".toUpperCase(),
                        style:  TextStyle(
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                            decorationStyle: TextDecorationStyle.solid,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.0),
                        textAlign:
                        TextAlign.left),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}