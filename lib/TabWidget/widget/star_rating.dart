import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

// ignore: must_be_immutable
class StarRating extends StatelessWidget{
  double valueRating;
  int reviewCount;

  StarRating(this.valueRating,this.reviewCount);


  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Column(
       mainAxisAlignment:MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         GFRating(
           size: 30,
           value: valueRating,
           color: Colors.yellow,
           onChanged: (value) {
           print(value);
           },
         ),

         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             children: [
               AutoSizeText(
                   valueRating.toStringAsFixed(1),
                   style: TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.w700,
                       fontStyle:  FontStyle.normal,
                       fontSize: 16.0
                   ),
                   textAlign: TextAlign.left
               ),

               AutoSizeText(
                   " ($reviewCount reviews)",
                   style: TextStyle(
                       color: Colors.black54,

                       fontWeight: FontWeight.w700,
                       fontStyle:  FontStyle.normal,
                       fontSize: 16.0
                   ),
                   textAlign: TextAlign.left
               ),


             ],
           ),
         ),
       ],
     ),
   );
  }
}