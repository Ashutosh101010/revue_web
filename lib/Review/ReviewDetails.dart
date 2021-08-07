import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/Review/views/consWidget.dart';
import 'package:webrevue/Review/widget/address_widget.dart';
import 'package:webrevue/Review/widget/bathroom_widget.dart';
import 'package:webrevue/Review/widget/bedroom_widget.dart';
import 'package:webrevue/Review/widget/bottom_widget.dart';
import 'package:webrevue/Review/widget/floor_plan.dart';
import 'package:webrevue/Review/widget/image_widget.dart';
import 'package:webrevue/Review/widget/overall_rating.dart';
import 'package:webrevue/Review/widget/price_widget.dart';
import 'package:webrevue/Review/views/proWidget.dart';
import 'package:webrevue/Review/widget/rating_widget.dart';
import 'package:webrevue/Review/widget/review_description.dart';
import 'package:webrevue/Review/widget/review_ratings.dart';
import 'package:webrevue/Review/widget/reviewdate_widget.dart';
import 'package:webrevue/model/ReviewModal.dart';

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
          review_image(widget.reviewModal.images,context),
          addressWidget("xzsxzs"),
          overAllRating(widget.reviewModal.rating),
        ReviewRatings(design: widget.reviewModal.design,
          value: widget.reviewModal.value,
          facility: widget.reviewModal.facilities,
          location: widget.reviewModal.location,
          management: widget.reviewModal.management,),
          reviewDetail(widget.reviewModal.review),

          ProsWidget(widget.reviewModal.pros),
          ConsWidget(widget.reviewModal.cons),
          bottomNav(context,widget.reviewModal.id)




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

                overAllRating(widget.reviewModal.rating),
                ReviewRatings(design: widget.reviewModal.design,
                  value: widget.reviewModal.value,
                facility: widget.reviewModal.facilities,
                location: widget.reviewModal.location,
                management: widget.reviewModal.management,),

                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                addressWidget("sxd"),

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




  Widget rightReviewPanel(BuildContext context){
    return  Flexible(
      flex: 2,
      fit: FlexFit.loose,
      child: ListView(
        children: [

          review_image(widget.reviewModal.images,context),
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

          reviewDetail(widget.reviewModal.review),
          bottomNav(context,widget.reviewModal.id)
         
        ],
      ),
    );
  }
}
