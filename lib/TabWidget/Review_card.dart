import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:webrevue/Review/widget/bathroom_widget.dart';
import 'package:webrevue/Review/widget/price_widget.dart';
import 'package:webrevue/Review/widget/rating_widget.dart';
import 'package:webrevue/Review/widget/reviewdate_widget.dart';
import 'package:webrevue/Review/ReviewDetails.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/get_rating_percent.dart';
import 'package:webrevue/model/ReviewModal.dart';

import '../Review/widget/bedroom_widget.dart';
import '../Review/widget/floor_plan.dart';

class ReviewCard extends StatefulWidget{
  ReviewModal reviewModal;

  ReviewCard(this.reviewModal);

  @override
  State<StatefulWidget> createState() {
    return ReviewCardState();
  }
}

class ReviewCardState extends State<ReviewCard>{

  bool viewMore = false;
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: width>800?50:0,right: width>800?30:0,top: 20,bottom: 20),
      decoration: BoxDecoration(border: Border(bottom:BorderSide(color: Colors.black12,width: 1))),
      child: Padding(
        padding: const EdgeInsets.only(bottom:12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(image:
              DecorationImage(
                image: AssetImage("assets/images/house.png"),
                fit: BoxFit.fill,
              ),borderRadius: BorderRadius.circular(3)),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),
              child:
              width>800?
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    priceWidget(widget.reviewModal.price),
                    bedRoomWidget(widget.reviewModal.bedRooms.toString()),
                    ratingWidget(widget.reviewModal.rating)
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    floorPlanWidget(widget.reviewModal.floorplan),
                    bathRoomWidget(widget.reviewModal.bathRooms.toString()),
                    reviewDateWidget(widget.reviewModal.reviewDate)
                  ],)
                ],
              ):
              width>600?
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    priceWidget(widget.reviewModal.price),
                    bedRoomWidget(widget.reviewModal.bedRooms.toString()),
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    floorPlanWidget(widget.reviewModal.floorplan),
                    bathRoomWidget(widget.reviewModal.bathRooms.toString()),
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    ratingWidget(widget.reviewModal.rating),
                    reviewDateWidget(widget.reviewModal.reviewDate)
                  ],)
                ],
              ):
              SizedBox(
                width: width,
                height: 300,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  priceWidget(widget.reviewModal.price),
                  floorPlanWidget(widget.reviewModal.floorplan),
                  bathRoomWidget(widget.reviewModal.bathRooms.toString()),
                  reviewDateWidget(widget.reviewModal.reviewDate),
                  bedRoomWidget(widget.reviewModal.bedRooms.toString()),
                  ratingWidget(widget.reviewModal.rating)

                ],),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:10.0,right:10,bottom:10,top:30),
              child: Text(
                widget.reviewModal.review,
                maxLines: viewMore ?widget.reviewModal.review.length:5,
                overflow:viewMore?TextOverflow.visible : TextOverflow.fade,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: 14),
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
                                width>700?
                                EdgeInsets.only(left: 100,right: 100,top: 50,bottom: 50):
                                EdgeInsets.all(5),
                                contentPadding: EdgeInsets.all(10),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                content: ReviewDetails(reviewModal:widget.reviewModal ,),
                              );
                            }
                        );
                      },
                      child: Text("READ MORE",
                          textAlign: TextAlign.end,
                          style: TextStyle(color: ColorClass.redColor,fontWeight: FontWeight.w600,fontSize: 12)),
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
      ),
    );
  }












}