import 'package:flutter/material.dart';
import 'package:webrevue/MyReview/widget/myReview_details.dart';
import 'package:webrevue/Review/ReviewDetails.dart';
import 'package:webrevue/Review/widget/bathroom_widget.dart';
import 'package:webrevue/Review/widget/bedroom_widget.dart';
import 'package:webrevue/Review/widget/floor_plan.dart';
import 'package:webrevue/Review/widget/price_widget.dart';
import 'package:webrevue/Review/widget/rating_widget.dart';
import 'package:webrevue/Review/widget/reviewdate_widget.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/model/MyReviewsModal.dart';
import 'package:webrevue/service/ServerDetails.dart';

class MyReviewCard extends StatefulWidget{
  MyReviewsModal myReviewsModal;


  MyReviewCard(this.myReviewsModal);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyReviewCardState();
  }
}

class MyReviewCardState extends  State<MyReviewCard>{
  bool viewMore = false;
  @override
  Widget build(BuildContext context) {
    double maxWidth= MediaQuery.of(context).size.width;
    return Container(
      width: maxWidth>1000?maxWidth-600:
      maxWidth>700?maxWidth-100:maxWidth,
      margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(image:
                  DecorationImage(
                    image: NetworkImage(ServerDetails.get_images+widget.myReviewsModal.images[0]),
                    fit: BoxFit.fill,
                  ),borderRadius: BorderRadius.circular(3)),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),
                  child:
                  maxWidth>1000?
                  Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        priceWidget(widget.myReviewsModal.price),
                        bedRoomWidget(widget.myReviewsModal.bedRooms.toString()),
                        ratingWidget(widget.myReviewsModal.rating)
                      ],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        floorPlanWidget(widget.myReviewsModal.floorplan),
                        bathRoomWidget(widget.myReviewsModal.bathRooms.toString()),
                        reviewDateWidget(widget.myReviewsModal.reviewDate)
                      ],)
                    ],
                  ):
                  maxWidth>600?
                  Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        priceWidget(widget.myReviewsModal.price),
                        bedRoomWidget(widget.myReviewsModal.bedRooms.toString()),
                      ],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        floorPlanWidget(widget.myReviewsModal.floorplan),
                        bathRoomWidget(widget.myReviewsModal.bathRooms.toString()),
                      ],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        ratingWidget(widget.myReviewsModal.rating),
                        reviewDateWidget(widget.myReviewsModal.reviewDate)
                      ],)
                    ],
                  ):
                  SizedBox(
                    width: maxWidth,
                    height: 300,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      priceWidget(widget.myReviewsModal.price),
                      floorPlanWidget(widget.myReviewsModal.floorplan),
                      bathRoomWidget(widget.myReviewsModal.bathRooms.toString()),
                      reviewDateWidget(widget.myReviewsModal.reviewDate),
                      bedRoomWidget(widget.myReviewsModal.bedRooms.toString()),
                      ratingWidget(widget.myReviewsModal.rating)

                    ],),
                  ),
                ),
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
                          fontSize: 14.0
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0,right:10,bottom:10,top:30),
                  child: Text(
                    widget.myReviewsModal.review,
                    maxLines: viewMore ?widget.myReviewsModal.review.length:5,
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
                                    maxWidth>700?
                                    EdgeInsets.only(left: 100,right: 100,top: 50,bottom: 50):
                                    EdgeInsets.all(5),
                                    contentPadding: EdgeInsets.all(10),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    content: MyReviewDetails(widget.myReviewsModal ,),
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
                            child: Icon(
                              viewMore?Icons.keyboard_arrow_up:
                            Icons.keyboard_arrow_down_outlined,color: Colors.black,))
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
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: widget.myReviewsModal!=null?
            Divider(color: Colors.black12,thickness: 1,height: 2,):Container(),
          )
        ],
      ),
    );
  }
}