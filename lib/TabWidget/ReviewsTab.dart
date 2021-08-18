import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webrevue/TabWidget/Review_card.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/Review/ReviewDetails.dart';
import 'package:webrevue/model/ReviewModal.dart';
import 'package:webrevue/service/Webservice.dart';

class ReviewsTab extends StatefulWidget{
  String compoundID;
  List reviewList = [];
  String compoundAddress;

  ReviewsTab(this.reviewList,this.compoundAddress);

  @override
  State<StatefulWidget> createState() {
    return ReviewTabState();
  }
}

class ReviewTabState extends State<ReviewsTab> {



  @override
  void initState() {
    super.initState();
    checkReview();
  }

  bool exists;
  checkReview()async{
    exists = await Webservice.checkReview(widget.compoundID);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        widget.reviewList.isEmpty?
        Text("No Review Posted for this Compound"):
        ListView.builder(shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: exists?
            widget.reviewList.length:
            widget.reviewList.length>2?2:widget.reviewList.length, itemBuilder: (context, index) {
              return ReviewCard(widget.reviewList[index] as ReviewModal,widget.compoundAddress);
            },),

        SizedBox(
            child:
            widget.reviewList.isEmpty?
            Text("No Review Posted for this Compound"):
            exists?Container():Text("To view more review! Post your review",
              style: TextStyle(color: ColorClass.redColor),)),
        ],
    );
  }
}


