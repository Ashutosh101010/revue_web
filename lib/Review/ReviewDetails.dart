import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webrevue/Review/views/consWidget.dart';
import 'package:webrevue/Review/widget/bathroom_widget.dart';
import 'package:webrevue/Review/widget/bedroom_widget.dart';
import 'package:webrevue/Review/widget/floor_plan.dart';
import 'package:webrevue/Review/widget/price_widget.dart';
import 'package:webrevue/Review/views/proWidget.dart';
import 'package:webrevue/Review/widget/rating_widget.dart';
import 'package:webrevue/Review/widget/review_ratings.dart';
import 'package:webrevue/Review/widget/reviewdate_widget.dart';
import 'package:webrevue/constants/get_rating_percent.dart';
import 'package:webrevue/model/ReviewModal.dart';

import '../constants/ColorClass.dart';

class ReviewDetails extends StatefulWidget {
  ReviewModal reviewModal;

  ReviewDetails({this.reviewModal});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return ReviewDetailState();
  }
}

class ReviewDetailState extends State<ReviewDetails> {
  double maxWidth;
  @override
  Widget build(BuildContext context) {
     maxWidth = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: maxWidth>=700?
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leftReviewPanel(context),
          rightReviewPanel(context)
         
        ],
      ):ListView(
        shrinkWrap: true,
        children: [
          compoundImage(context),
          addressWidget(BuildContext),
          overAllRating(BuildContext),
          ReviewRatings(widget.reviewModal),
          reviewDetail(context),

          ProsWidget(widget.reviewModal.pros),
          ConsWidget(widget.reviewModal.cons),
          bottomNav(context)




      ],),
    );
  }


  // Widget priceWidget(){
  //   return  Flexible(flex: 1,
  //     child: Padding(
  //       padding: const EdgeInsets.all(4.0),
  //       child: Row(
  //         children: [
  //           AutoSizeText(
  //               "Price ",
  //               style: TextStyle(
  //                   color:  Colors.black87,
  //
  //                   fontWeight: FontWeight.w700,
  //                   fontStyle:  FontStyle.normal,
  //                   fontSize: 16.0
  //               ),
  //               textAlign: TextAlign.left
  //           ),
  //           AutoSizeText(
  //               " 45000 /month",
  //               style:  TextStyle(
  //                   color: Colors.black54,
  //                   fontWeight: FontWeight.w600,
  //
  //                   fontStyle:  FontStyle.normal,
  //                   fontSize: 16.0
  //               ),
  //               textAlign: TextAlign.left
  //           ),
  //         ],
  //       ),
  //     ),);
  // }

  // Widget bedRoomWidget(){
  //   return  Flexible(flex: 1,
  //     child: Padding(
  //       padding: const EdgeInsets.all(4.0),
  //       child: Row(
  //         children: [
  //           Icon(Icons.king_bed,size: 22,),
  //           AutoSizeText(
  //               "  Bed Rooms :",
  //               style:  TextStyle(
  //                   color:  Colors.black87,
  //                   fontWeight: FontWeight.w700,
  //
  //                   fontStyle:  FontStyle.normal,
  //                   fontSize: 16.0
  //               ),
  //               textAlign: TextAlign.left
  //           ),
  //           AutoSizeText(
  //               widget.reviewModal.bedRooms.toString(),
  //               style:  TextStyle(
  //                   color: Colors.black54,
  //                   fontWeight: FontWeight.w600,
  //
  //                   fontStyle:  FontStyle.normal,
  //                   fontSize: 16.0
  //               ),
  //               textAlign: TextAlign.left
  //           ),
  //         ],
  //       ),
  //     ),);
  // }

  // Widget ratingWidget(){
  //   return   FittedBox(fit: BoxFit.fitWidth,
  //     child: Padding(
  //       padding: const EdgeInsets.all(4.0),
  //       child: Row(
  //         children: [
  //           GFRating(
  //             size: 20,
  //             value: getpercentage(widget.reviewModal.rating),
  //             color: Colors.yellow,
  //             borderColor: Colors.yellow,
  //             onChanged: (value) {
  //              print(value);
  //             },
  //           ),
  //
  //
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Row(
  //               children: [
  //                 AutoSizeText(
  //                     widget.reviewModal.rating.toStringAsFixed(1),
  //                     style: TextStyle(
  //                         color: Colors.black87,
  //                         fontWeight: FontWeight.w700,
  //
  //                         fontStyle:  FontStyle.normal,
  //                         fontSize: 16.0
  //                     ),
  //                     textAlign: TextAlign.left
  //                 ),
  //
  //                 AutoSizeText(
  //                     " (54 reviews)",
  //                     style: TextStyle(
  //                         color: Colors.black54,
  //                         fontStyle:  FontStyle.normal,
  //                         fontWeight: FontWeight.w600,
  //                         fontSize: 16.0
  //                     ),
  //                     textAlign: TextAlign.left
  //                 ),
  //
  //
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget floorPlan(){
  //   return  Flexible(flex: 1,
  //     child: Padding(
  //       padding: const EdgeInsets.all(4.0),
  //       child: FittedBox(fit: BoxFit.fitWidth,
  //         child: Row(
  //           children: [
  //             AutoSizeText(
  //                 "Floor Plan ",
  //                 style:  TextStyle(
  //                     color:  Colors.black87,
  //                     fontWeight: FontWeight.w700,
  //
  //                     fontStyle:  FontStyle.normal,
  //                     fontSize: 16.0
  //                 ),
  //                 textAlign: TextAlign.left
  //             ),
  //             AutoSizeText(
  //                 " 564 sqft / 52 sqm",
  //                 style:  TextStyle(
  //                     color: Colors.black54,
  //                     fontWeight: FontWeight.w600,
  //
  //                     fontStyle:  FontStyle.normal,
  //                     fontSize: 16.0
  //                 ),
  //                 textAlign: TextAlign.left
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),);
  // }
  //
  // Widget reviewDateWidget(){
  //   return Flexible(flex: 1,child:  Padding(
  //     padding: const EdgeInsets.all(4.0),
  //     child: FittedBox(fit: BoxFit.fitWidth,
  //       child: Row(
  //         children: [
  //           AutoSizeText(
  //               "Review Date ",
  //               style:  TextStyle(
  //                   color:  Colors.black87,
  //
  //                   fontWeight: FontWeight.w700,
  //                   fontStyle:  FontStyle.normal,
  //                   fontSize: 16.0
  //               ),
  //               textAlign: TextAlign.left
  //           ),
  //
  //           AutoSizeText(
  //               " 23 Dec 2020",
  //               style:  TextStyle(
  //
  //
  //                   fontStyle:  FontStyle.normal,
  //                   fontSize: 16.0,
  //                   color: Colors.black54,
  //                   fontWeight: FontWeight.w600
  //               ),
  //               textAlign: TextAlign.left
  //           ),
  //         ],
  //       ),
  //     ),
  //   ),);
  // }
  //
  // Widget bathRoomWidget(){
  //   return Flexible(flex: 1, child: Padding(
  //     padding: const EdgeInsets.all(4.0),
  //     child: Row(
  //       children: [
  //         Icon(Icons.bathtub_outlined),
  //         AutoSizeText(
  //             "  Bath Rooms :",
  //             style: TextStyle(
  //                 color:  Colors.black87,
  //
  //                 fontWeight: FontWeight.w700,
  //                 fontStyle:  FontStyle.normal,
  //                 fontSize: 16.0
  //             ),
  //             textAlign: TextAlign.left
  //         ),
  //         AutoSizeText(
  //             " 2",
  //             style:  TextStyle(
  //                 color: Colors.black54,
  //                 fontWeight: FontWeight.w600,
  //
  //                 fontStyle:  FontStyle.normal,
  //                 fontSize: 16.0
  //             ),
  //             textAlign: TextAlign.left
  //         ),
  //       ],
  //     ),
  //   ),);
  // }
  //
  // Widget consWidget(BuildContext context){
  //  return Container(
  //     margin: EdgeInsets.only(top: 5, bottom: 10,left:10),
  //     width: MediaQuery.of(context).size.width,
  //     child: Column(
  //       children: [
  //         Align(
  //           alignment: Alignment.topLeft,
  //           child: Text(
  //             "Cons",
  //             style: TextStyle(
  //                 color: Colors.black87,
  //                 fontWeight: FontWeight.w700,
  //                 fontStyle: FontStyle.normal,
  //                 fontSize: 18),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: ListView.builder(
  //             physics: NeverScrollableScrollPhysics(),
  //             itemBuilder: (context, index) {
  //               return Text(
  //                 "- " + consList[index],
  //                 style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 14),
  //               );
  //             },
  //             shrinkWrap: true,
  //             itemCount: consList.length,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //


  Widget overAllRating(BuildContext){
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
              percent: 0.4,
              center: new Text(
                "3.2",
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
  Widget addressWidget(BuildContext){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                "Location",
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,

                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: AutoSizeText(
                "Southwest apartments, Green community West,Green Community,Dubai",
                style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
  
  
  Widget leftReviewPanel(BuildContext context){
    return Flexible(
      flex: 1,
      fit: FlexFit.loose,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.black12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                overAllRating(BuildContext),
                ReviewRatings(widget.reviewModal),

                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                addressWidget(BuildContext),

                SizedBox(
                  height: 20,
                ),

                ProsWidget(widget.reviewModal.pros),

                SizedBox(
                  height: 20,
                ),

                ConsWidget(widget.reviewModal.cons)

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget reviewDetail(BuildContext context){
    return Wrap(children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Review",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,

                fontStyle: FontStyle.normal,
                fontSize: 16.0),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(widget.reviewModal.review,
            style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: 14),
            textAlign: TextAlign.left),
      ),
    ],);
  }
  
  Widget compoundImage(BuildContext context){
    return  Container(
      height: 230,
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 30,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.black,
                )),
          ),
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/house.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
  
  Widget bottomNav(BuildContext context){
    return  Padding(
        padding: const EdgeInsets.all(10.0),
        child:
        maxWidth>=1000?
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Was this review helpful?",
                          style: const TextStyle(
                              color: Colors.black,

                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidFlag,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Report",
                          style: const TextStyle(
                              color: Colors.black,

                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Share",
                          style: const TextStyle(
                              color: Colors.black,

                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
            ]):
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Was this review helpful?",
                          style: const TextStyle(
                              color: Colors.black,

                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidFlag,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Report",
                          style: const TextStyle(
                              color: Colors.black,

                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Share",
                          style: const TextStyle(
                              color: Colors.black,

                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
            ])
    );
  }
  
  Widget rightReviewPanel(BuildContext context){
    return  Flexible(
      flex: 2,
      fit: FlexFit.loose,
      child: ListView(
        children: [
         
          compoundImage(context),
          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              priceWidget(widget.reviewModal.price),
              bedRoomWidget(widget.reviewModal.bedRooms.toString()),
              ratingWidget(widget.reviewModal.rating)
            ],),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),

            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              floorPlanWidget(widget.reviewModal.floorplan),
              bathRoomWidget(widget.reviewModal.bathRooms.toString()),
              reviewDateWidget(widget.reviewModal.reviewDate)

            ],),
          ),

          reviewDetail(context),
          bottomNav(context)
         
        ],
      ),
    );
  }
}
