import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/components/rating/gf_rating.dart';

import '../AppBar/AppBarSec.dart';
import '../constants/ColorClass.dart';
import '../footer/FooterWidget.dart';
import 'ReviewDetails.dart';

class MyReviews extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyReviewState();
  }
}

class MyReviewState extends State<MyReviews>{
  double valueRating = 4.0;
  String reviews = "The lobby is vey impressive and well designed with lots "
      "of seating for relaxing and working from home. There is a free coffee machine in"
      " the lobby and residents are provided with a free cup on arrival (along with other little gifts)."
      " There is well stocked gym on the ground floor and with personal trainer and classes available."
      "On the mezzanine level, there is a raised garden with fabulous furniture and view over the water."
      " Also on the mezzanine there is further indoor seating and"
      " is further indoor seating and a small library and painting gallery. Lifts are available from all floors."
      " Everything is kept well maintained and functioning. The staff are extremely friendly and welcoming from "
      "the moment you meet them. They give you a warm and genuinely friendly greeting every time you pass them.";
  bool viewMore = false;
  bool back= false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context,constraints){
          var maxWidth = constraints.maxWidth>700;
          return Scaffold(
            appBar:
            maxWidth?
            PreferredSize(
              preferredSize: Size.fromHeight(60),child: AppBarSec(),):
            AppBar(
              backgroundColor: Colors.white,
              leading: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
            ),),
            body: Container(
              color: Colors.white,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: ListView(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                 maxWidth?
                 Padding(
                    padding: EdgeInsets.only(left: 50,right: 20,top: 20,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios_outlined,
                              size:  20,color: Colors.black,)),
                        // Question & Answers
                        Text(
                            " My Reviews",
                            style: TextStyle(
                                color:  ColorClass.redColor,
                                fontWeight: FontWeight.w700,

                                fontStyle:  FontStyle.normal,
                                fontSize: 25.0
                            ),
                            textAlign: TextAlign.left
                        ),
                        Expanded(child: Align(alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 40,width: 200,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              onPressed: () {},
                              color: ColorClass.blueColor,
                              hoverColor: Colors.blue.shade900,
                              textColor: Colors.white,
                              child: Text(
                                "Latest",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                          ),),)

                      ],),
                  ):Container(),

                  Container(
                    width: constraints.maxWidth,alignment: Alignment.center,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return Center(
                          child: Container(
                            width: constraints.maxWidth>1000?constraints.maxWidth-600:
                            constraints.maxWidth>700?constraints.maxWidth-100:constraints.maxWidth,
                            margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
                            child: Column(
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
                                  constraints.maxWidth>1000?
                                  Column(
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                        priceWidget(),
                                        bedRoomWidget(),
                                        ratingWidget()
                                      ],),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                        floorPlan(),
                                        bathroomWidget(),
                                        reviewDateWidget()
                                      ],)
                                    ],
                                  ):
                                  constraints.maxWidth>600?
                                  Column(
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                        priceWidget(),
                                        bedRoomWidget(),
                                      ],),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                        floorPlan(),
                                        bathroomWidget(),
                                      ],),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                        ratingWidget(),
                                        reviewDateWidget()
                                      ],)
                                    ],
                                  ):
                                  SizedBox(
                                    width: constraints.maxWidth,
                                    height: 300,
                                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                      priceWidget(),
                                      floorPlan(),
                                      bathroomWidget(),
                                      reviewDateWidget(),
                                      bedRoomWidget(),
                                      ratingWidget()

                                    ],),
                                  ),
                                ),



                                // Padding(
                                //   padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),
                                //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                //     priceWidget(),
                                //     bedRoomWidget(),
                                //     ratingWidget()
                                //
                                //   ],),
                                // ),
                                //
                                //
                                // Padding(
                                //   padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),
                                //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                //     floorPlan(),
                                //     bathroomWidget(),
                                //     reviewDateWidget()
                                //
                                //   ],),
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      reviews,maxLines: viewMore ?reviews.length:5,
                                      overflow:viewMore?TextOverflow.visible : TextOverflow.fade,
                                      textAlign: TextAlign.left
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
                                                    maxWidth?
                                                    EdgeInsets.only(left: 100,right: 100,top: 50,bottom: 50):
                                                    EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
                                                    contentPadding: EdgeInsets.all(10),
                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                    content: ReviewDetails(),
                                                  );
                                                }
                                            );
                                          },
                                          child: Text(
                                              "Edit Review".toUpperCase(),
                                              style: TextStyle(
                                                  color:ColorClass.blueColor,
                                                  fontWeight:FontWeight.w500,
                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 16.0
                                              ),
                                              textAlign: TextAlign.end
                                          ),
                                        ),
                                        GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                viewMore = !viewMore;
                                              });
                                            },
                                            child: Icon(viewMore?Icons.keyboard_arrow_up:
                                            Icons.keyboard_arrow_down_outlined,color: Colors.black,))
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black12,
                                  thickness: 1,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 60,),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: const Color(0x40000000),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0)
                      ], color: const Color(0x4d000000))),
                  FooterWidget()


                ],
              ),
            ),
          );

        },
      ),
    );
  }

  Widget priceWidget(){
    return  Flexible(flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Text(
                "Price ",
                style: TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
            Text(
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
            Text(
                "  Bed Rooms :",
                style:  TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
            Text(
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
    return  Flexible(
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


            Row(
              children: [
                AutoSizeText(
                    "4.85",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontStyle:  FontStyle.normal,
                        fontSize: 14.0
                    ),
                    textAlign: TextAlign.left
                ),

                AutoSizeText(
                    " (54 reviews)",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontStyle:  FontStyle.normal,
                        fontSize: 14.0
                    ),
                    textAlign: TextAlign.left
                ),


              ],
            ),
          ],
        ),
      ),);
  }

  Widget floorPlan(){
    return  Flexible(flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Text(
                "Floor Plan ",
                style:  TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
            Text(
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

  Widget bathroomWidget(){
    return Flexible(flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Icon(Icons.bathtub_outlined),
            Text(
                "  Bath Rooms :",
                style: TextStyle(
                    color:  Colors.black,
                    fontWeight: FontWeight.w600,
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
            Text(
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
}