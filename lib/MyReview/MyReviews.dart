import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:webrevue/MyReview/widget/myreview_card.dart';
import 'package:webrevue/model/MyReviewsModal.dart';
import 'package:webrevue/service/Webservice.dart';

import '../AppBar/AppBarSec.dart';
import '../constants/ColorClass.dart';
import '../footer/FooterWidget.dart';
import '../Review/ReviewDetails.dart';
import 'dart:html' as html;

class MyReviews extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyReviewState();
  }
}

class MyReviewState extends State<MyReviews>{

  List myReviewList = [];

  onRefresh(){
    html.window.onBeforeUnload.listen((event) async{
      setState(() {

      });
    });
  }


  @override
  void initState() {
    super.initState();

    Webservice.getMyReviews(myReviewList).then((value) => this.setState(() {

    }));
  }

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
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),

                        // Question & Answers
                        Text(" My Reviews",
                            style: TextStyle(
                                color: ColorClass.redColor,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            textAlign: TextAlign.left),

                        Expanded(child: Align(alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 40,width: 200,
                            child: MaterialButton(
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
                      itemCount: myReviewList.length,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return Center(
                          child: MyReviewCard(myReviewList[index] as MyReviewsModal),
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

}