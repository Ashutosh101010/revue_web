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

  ReviewsTab(this.reviewList);

  @override
  State<StatefulWidget> createState() {
    return ReviewTabState();
  }
}

class ReviewTabState extends State<ReviewsTab> {




  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.reviewList.length, itemBuilder: (context, index) {
          return ReviewCard(widget.reviewList[index] as ReviewModal);
        },),
    );
  }
}


