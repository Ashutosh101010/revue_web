import 'package:flutter/material.dart';
import 'package:webrevue/Review/views/consWidget.dart';
import 'package:webrevue/Review/views/proWidget.dart';
import 'package:webrevue/Review/widget/address_widget.dart';
import 'package:webrevue/Review/widget/bathroom_widget.dart';
import 'package:webrevue/Review/widget/bedroom_widget.dart';
import 'package:webrevue/Review/widget/bottom_widget.dart';
import 'package:webrevue/Review/widget/floor_plan.dart';
import 'package:webrevue/Review/widget/image_widget.dart';
import 'package:webrevue/Review/widget/overall_rating.dart';
import 'package:webrevue/Review/widget/price_widget.dart';
import 'package:webrevue/Review/widget/rating_widget.dart';
import 'package:webrevue/Review/widget/review_description.dart';
import 'package:webrevue/Review/widget/review_ratings.dart';
import 'package:webrevue/Review/widget/reviewdate_widget.dart';
import 'package:webrevue/model/MyReviewsModal.dart';

class MyReviewDetails extends StatefulWidget{
  MyReviewsModal myReviewsModal;

  MyReviewDetails(this.myReviewsModal);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
return MyReviewDetailState();
  }
}

class MyReviewDetailState extends State<MyReviewDetails>{
  double maxWidth;
  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topCenter,
      child: maxWidth>=700?

      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftReviewPanel(context),
          rightReviewPanel(context)

        ],
      ):ListView(
        shrinkWrap: true,
        children: [
          review_image(widget.myReviewsModal.images,context),
          // addressWidget("xzsxzs"),
          overAllRating(widget.myReviewsModal.rating),
          ReviewRatings(design: widget.myReviewsModal.design,
            value: widget.myReviewsModal.value,
            facility: widget.myReviewsModal.facilities,
            location: widget.myReviewsModal.location,
            management: widget.myReviewsModal.management,),
          reviewDetail(widget.myReviewsModal.review),

          ProsWidget(widget.myReviewsModal.pros),
          ConsWidget(widget.myReviewsModal.cons),
          bottomNav(context,widget.myReviewsModal.id)




        ],),
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

                overAllRating(widget.myReviewsModal.rating),
                ReviewRatings(design: widget.myReviewsModal.design,
                  value: widget.myReviewsModal.value,
                  facility: widget.myReviewsModal.facilities,
                  location: widget.myReviewsModal.location,
                  management: widget.myReviewsModal.management,),


                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                addressWidget("sxd"),

                SizedBox(
                  height: 20,
                ),

                ProsWidget(widget.myReviewsModal.pros),

                SizedBox(
                  height: 20,
                ),

                ConsWidget(widget.myReviewsModal.cons)

              ],
            ),
          ),
        ],
      ),
    );
  }




  Widget rightReviewPanel(BuildContext context){
    return  Flexible(
      flex: 2,
      fit: FlexFit.loose,
      child: ListView(
        children: [

          review_image(widget.myReviewsModal.images,context),
          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              priceWidget(widget.myReviewsModal.price),
              bedRoomWidget(widget.myReviewsModal.bedRooms.toString()),
              ratingWidget(widget.myReviewsModal.rating)
            ],),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),

            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              floorPlanWidget(widget.myReviewsModal.floorplan),
              bathRoomWidget(widget.myReviewsModal.bathRooms.toString()),
              reviewDateWidget(widget.myReviewsModal.reviewDate)

            ],),
          ),

          reviewDetail(widget.myReviewsModal.review),
          bottomNav(context,widget.myReviewsModal.id)

        ],
      ),
    );
  }
}