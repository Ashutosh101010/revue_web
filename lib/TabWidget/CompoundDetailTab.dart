

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:webrevue/TabWidget/widget/AboutWidget.dart';
import 'package:webrevue/TabWidget/widget/AmenitiesWidget.dart';
import 'package:webrevue/TabWidget/widget/MapsWidget.dart';
import 'package:webrevue/TabWidget/widget/compound_rating.dart';
import 'package:webrevue/TabWidget/widget/compound_rating_bar.dart';
import 'package:webrevue/TabWidget/widget/star_rating.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/model/arguments/CompoundArgument.dart';
import 'package:webrevue/model/arguments/CompoundMessagingArgument.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/Webservice.dart';

class CompoundDetailTab extends StatefulWidget {
  String compoundID;

  CompoundDetailTab(this.compoundID);

  @override
  State<StatefulWidget> createState() {
    return CompoundDetailTabState();
  }

}

class CompoundDetailTabState extends State<CompoundDetailTab>{


    bool messagingHover = false;
  bool shareHover = false;
  bool favhover = false;
  double maxWidth;
  CompoundModal compoundModal;


  @override
  void initState() {
    super.initState();
    getCompoundDetails();
  }


  getCompoundDetails()async{
    CompoundModal value = await Webservice.getCompoundDetails(widget.compoundID);
    setState(() {
      compoundModal = value;
    });

  }




  @override
  Widget build(BuildContext context) {
     maxWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: maxWidth>800?EdgeInsets.only(left: 50,top: 10,):EdgeInsets.only(top: 10,),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Container(
          height: 400,width: 1000,
          child: Stack(
            children: [
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    compoundModal.images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: compoundModal.images.length,
                pagination: new SwiperPagination(),
              ),


              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){},
                  onHover: (value){
                    setState(() {
                      favhover = value;
                    });
                  },
                  child: Container(
                    width: 35,height: 35,alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    color: favhover?ColorClass.blueColor:Colors.white,),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:  Image.asset(
                        "assets/images/heart.png",color: favhover?Colors.white:ColorClass.blueColor,
                        fit: BoxFit.contain,height: 20,width: 20,),
                    ),
              ),
                ),),
            ],
          ),

        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              AutoSizeText(compoundModal.compoundname,softWrap: true,
                style:TextStyle(
                    color:  Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontStyle:  FontStyle.normal,
                    fontSize: 18.0
                ) ,),
                AutoSizeText(compoundModal.address,softWrap: true,
                style: TextStyle(
                    color:  Colors.black87,
                    fontSize: 16,fontWeight: FontWeight.w500),)
            ],),

          maxWidth>=800?
          Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,questionAns);
                      },
                      child: Icon(CupertinoIcons.chat_bubble_2_fill,size: 25,
                      color:ColorClass.blueColor,),
                    ),
                      AutoSizeText('Q and A',
                        style: TextStyle(
                            color:  ColorClass.blueColor,
                            fontSize: 14,fontWeight: FontWeight.w600),)
                    ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          // print(window.location.href);
                          },
                        child: Icon(Icons.share,size: 25,
                          color:  ColorClass.blueColor,),
                      ),
                      AutoSizeText('Share',
                        style: TextStyle(
                            color:  ColorClass.blueColor,
                            fontSize: 14,fontWeight: FontWeight.w600),)
                    ],),
                ),
              ],
            ):Container()
            ],),
        ),

        maxWidth>=800?Container():
        Row(
         mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){

                    Navigator.pushNamed(context,questionAns,
                        arguments:CompoundMessagingArgument(compoundModal));
                  },
                  child: Icon(CupertinoIcons.chat_bubble_2_fill,size: 25,
                    color:ColorClass.blueColor,),
                ),
                AutoSizeText('Q and A',
                  style: TextStyle(
                      color:  ColorClass.blueColor,
                      fontSize: 14,fontWeight: FontWeight.w600),)
              ],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    // print(window.location.href);
                  },
                  child: Icon(Icons.share,size: 25,
                    color:  ColorClass.blueColor,),
                ),
                AutoSizeText('Share',
                  style: TextStyle(
                      color:  ColorClass.blueColor,
                      fontSize: 14,fontWeight: FontWeight.w600),)
              ],),
          ),
        ],),

        Row(
          mainAxisAlignment: maxWidth>=1000?MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
          children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                  border: maxWidth>=800?
                  Border(right: BorderSide(color: Colors.grey,width: 1)):null),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StarRating(compoundModal.rating),

                  Container(
                    alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 10),
                      child:CompoundRating(compoundModal,maxWidth)),
                ],
              ),
            ),
          ),

            Container(width: 1,color: Colors.black87,),
            maxWidth>=800?
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: RatingBarWidget()
              ),
            ):Container(),

          ],),
          maxWidth>=800?Container():
          Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 10),
              child: RatingBarWidget()
          ),

        SizedBox(height: 20,),

        Row(
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: AmenitiesWidget(compoundModal.amenities)),

            maxWidth>=900?
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child:Padding(
                padding: const EdgeInsets.only(left:10,top:80.0,right:10),
                child: MapsWidget(maxWidth,compoundModal),
              )):Container()
          ],
        ),




        SizedBox(height: 20,),
        // About Property

        Padding(
          padding: const EdgeInsets.only(right: 10),
          child:  AboutWidget(compoundModal.description)

        ),



      ],),
    );
  }


}