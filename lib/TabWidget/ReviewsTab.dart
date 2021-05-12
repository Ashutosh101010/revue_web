import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webrevue/ColorClass.dart';
import 'package:webrevue/User/ReviewDetails.dart';

class ReviewsTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ReviewTabState();
  }
}

class ReviewTabState extends State{
  double valueRating = 4.0;
  String reviews =
      "The lobby is vey impressive and well designed with lots of seating"
      " for relaxing and working from home. There is a free coffee machine in the lobby and residents"
      " are provided with a free cup on arrival (along with other little gifts). There is well stocked"
      " gym on the ground floor and with personal trainer and classes available. On the mezzanine level, "
      "there is a raised garden with fabulous furniture and view over the water. Also on the mezzanine there"
      " is further indoor seating and a small library and painting gallery. Lifts are available from all floors."
      " Everything is kept well maintained and functioning. The staff are extremely friendly and welcoming from "
      "the moment you meet them. They give you a warm and genuinely friendly greeting every time you pass them.";

  bool viewMore = false;
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
   return Container(
     margin: EdgeInsets.only(left: 50,right: 30,top: 20,bottom: 20),
     decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Container(
           height: 220,
           decoration: BoxDecoration(image:
           DecorationImage(
             image: AssetImage("assets/images/house.png"),
             fit: BoxFit.fill,
           ),borderRadius: BorderRadius.circular(3)),
         ),

         Padding(
           padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),
           child:
           width>1000?
           Column(
             children: [
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                 priceWidget(),
                 bedRoomWidget(),
                 ratingWidget()
               ],),
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                 floorPlanWidget(),
                 bathRoomWidget(),
                 reviewDateWidget()
               ],)
             ],
           ):
           width>600?
           Column(
             children: [
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                 priceWidget(),
                 bedRoomWidget(),
               ],),
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                 floorPlanWidget(),
                 bathRoomWidget(),
               ],),
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                 ratingWidget(),
                 reviewDateWidget()
               ],)
             ],
           ):
           SizedBox(
             width: width,
             height: 300,
             child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              priceWidget(),
               floorPlanWidget(),
               bathRoomWidget(),
               reviewDateWidget(),
               bedRoomWidget(),
              ratingWidget()

             ],),
           ),
         ),


         // Padding(
         //   padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),
         //   child:
         //       width>1000?
         //   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
         //
         //   ],):
         //           width>600?
         //       SizedBox(
         //         width: width,
         //         height: 100,
         //         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
         //           floorPlanWidget(),
         //           bathRoomWidget(),
         //         ],),
         //       ):
         //           SizedBox(
         //             width: width,
         //             height: 100,
         //             child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
         //               floorPlanWidget(),
         //               bathRoomWidget(),
         //               reviewDateWidget()
         //             ],),
         //           )
         // ),


         Align(
           alignment: Alignment.topLeft,
           child: Padding(
             padding: const EdgeInsets.all(5.0),
             child: Text(
               "Description",
               style:  TextStyle(
                   color: Colors.black ,
                   fontWeight: FontWeight.w700,

                   fontStyle:  FontStyle.normal,
                   fontSize: 17.0
               ),
             ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(5.0),
           child: Text(
             reviews,
             maxLines: viewMore ?reviews.length:5,
             overflow:viewMore?TextOverflow.visible : TextOverflow.fade,
             textAlign: TextAlign.left,
             style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500),
           ),
         ),

         Container(
           alignment: Alignment.centerRight,
           margin: EdgeInsets.all(8),
           child: MouseRegion(
             cursor: SystemMouseCursors.click,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 GestureDetector(
                   onTap: (){
                     showDialog(
                         context: context,
                         builder: (BuildContext c){
                           return AlertDialog(
                             backgroundColor: Colors.white,
                             insetPadding: 
                             width>1000?
                             EdgeInsets.only(left: 100,right: 100,top: 50,bottom: 50):
                             EdgeInsets.all(15),
                             contentPadding: EdgeInsets.all(10),
                             clipBehavior: Clip.antiAliasWithSaveLayer,
                             content: ReviewDetails(),
                           );
                         }
                     );
                   },
                   child: Text("READ MORE",
                       textAlign: TextAlign.end,
                       style: TextStyle(color: ColorClass.redColor,fontWeight: FontWeight.w500)),
                 ),
                 GestureDetector(
                   onTap: (){
                     setState(() {
                       viewMore = !viewMore;
                     });
                   },
                     child: Icon(viewMore?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down_outlined,color: Colors.black,))
               ],
             ),
           ),
         ),
         // Divider(
         //   color: Color(0x66000000),
         //   thickness: 1,
         // ),
       ],
     ),
   );
  }

  Widget priceWidget(){
    return  Flexible(flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            AutoSizeText(
                "Price ",
                style: TextStyle(
                    color:  Colors.black,

                    fontWeight: FontWeight.w600,
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
            AutoSizeText(
                " 45000 /month",
                style:  TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,

                    fontStyle:  FontStyle.normal,
                    fontSize: 15.0
                ),
                textAlign: TextAlign.left
            ),
          ],
        ),
      ),);
  }

  Widget bedRoomWidget(){
    return  Flexible(flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Icon(Icons.king_bed),
            AutoSizeText(
                "  Bed Rooms :",
                style:  TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,

                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
            AutoSizeText(
                " 2",
                style:  TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,

                    fontStyle:  FontStyle.normal,
                    fontSize: 15.0
                ),
                textAlign: TextAlign.left
            ),
          ],
        ),
      ),);
  }

  Widget ratingWidget(){
    return   Flexible(
      flex: 1,
      child:  Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            GFRating(
              size: 20,
              value: valueRating,
              color: Colors.yellow,
              borderColor: Colors.yellow,
              onChanged: (value) {
                setState(() {
                  valueRating = value;
                });
              },
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  AutoSizeText(
                      "4.85",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,

                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0
                      ),
                      textAlign: TextAlign.left
                  ),

                  AutoSizeText(
                      " (54 reviews)",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
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
      ),);
  }

  Widget floorPlanWidget(){
    return  Flexible(flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            AutoSizeText(
                "Floor Plan ",
                style:  TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,

                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
            AutoSizeText(
                " 564 sqft / 52 sqm",
                style:  TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,

                    fontStyle:  FontStyle.normal,
                    fontSize: 15.0
                ),
                textAlign: TextAlign.left
            ),
          ],
        ),
      ),);
  }

  Widget reviewDateWidget(){
    return Flexible(flex: 1,child:  Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          AutoSizeText(
              "Review Date ",
              style:  TextStyle(
                  color:  Colors.black,

                  fontWeight: FontWeight.w600,
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.left
          ),

          AutoSizeText(
              " 23 Dec 2020",
              style:  TextStyle(


                  fontStyle:  FontStyle.normal,
                  fontSize: 15.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.left
          ),
        ],
      ),
    ),);
  }

  Widget bathRoomWidget(){
    return Flexible(flex: 1, child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Icon(Icons.bathtub_outlined),
          AutoSizeText(
              "  Bath Rooms :",
              style: TextStyle(
                  color:  Colors.black,

                  fontWeight: FontWeight.w600,
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.left
          ),
          AutoSizeText(
              " 2",
              style:  TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,

                  fontStyle:  FontStyle.normal,
                  fontSize: 15.0
              ),
              textAlign: TextAlign.left
          ),
        ],
      ),
    ),);
  }
}