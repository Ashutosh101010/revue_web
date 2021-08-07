import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webrevue/AppBar/AppBarSec.dart';
import 'package:webrevue/LoginDashboard/LoginScreen.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/circular_rating.dart';
import 'package:webrevue/constants/get_rating_percent.dart';
import 'package:webrevue/footer/FooterWidget.dart';
import 'package:webrevue/home/CompoundList.dart';
import 'package:webrevue/home/compound_card.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/model/FavoriteModal.dart';
import 'package:webrevue/model/arguments/CompoundArgument.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/ServerDetails.dart';
import 'package:webrevue/service/Webservice.dart';

class FavoriteCompound extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FavoriteCompoundState();
  }
}
List favouriteIDList = [];
class FavoriteCompoundState extends State<FavoriteCompound>{

  @override
  void initState() {
    super.initState();
    if(favList.isEmpty){

      Webservice.getAllFavoritesCompoundRequest().whenComplete(() => this.setState(() {

      }));
    }

  }
  double width;
  @override
  Widget build(BuildContext context) {
     width = MediaQuery.of(context).size.width;
    return Material(
      child: Scaffold(
        appBar:
        width>=600?
        PreferredSize(preferredSize: Size.fromHeight(60),child: AppBarSec(),):
        AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
        ),

        body: Column(children: [

        Expanded(child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
        child: Column(children: [
         width>700 ?Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12)),
            margin: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.only(left: 50,right: 100,top: 20,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Text("Favorite Compounds",
                      style: TextStyle(
                          color: ColorClass.redColor,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                      textAlign: TextAlign.left),

                ],
              ),
            ),
          ):Container(),

          Container(
            margin: width>=600?EdgeInsets.only(left: 130,right: 130, top:20,bottom: 20):
            EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),

            child: Column(
              children: [
                favList.isEmpty?Text("No Property added",
                    style: TextStyle(
                        color:  Colors.black,
                        fontStyle:  FontStyle.normal,
                        fontSize:14.0
                    ),
                    textAlign: TextAlign.left
                ):


                    ListView.builder(
                      itemCount: favList.length,shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return compoundCard(index);

                      },
                    )
              ],
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
        ],),)),


            ],),),
    );
  }

  Widget compoundCard(int index){
    bool viewmore = false;
    return Container(
      margin: width>=600?EdgeInsets.only(left: 20,right: 20,top:10,bottom: 10):
      EdgeInsets.only(left: 5,right: 5,top: 5,bottom:5),
      width: width>=600?width/2:width,
      // height: width>=600?300:450,
      child:   width>=600?
      Column(
        children: [
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width:width/2,
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 150, alignment: Alignment.topCenter,
                        width: width/2,  margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
                        child:  Swiper(
                          itemBuilder: (BuildContext context, int ind) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(ServerDetails.get_images
                                  +(favList[index]as CompoundModal).images[ind],fit: BoxFit.cover,),
                            );
                          },
                          autoplay: false,
                          itemCount:  (favList[index]as CompoundModal).images.length,
                          pagination: new SwiperPagination(),


                        ),
                      ),

                      width>=700?
                      Container(width: width/2,
                        child: FittedBox(fit:BoxFit.fitWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 100,
                                width: width/4,
                                margin: EdgeInsets.only(left: 5,right: 5),
                                decoration: BoxDecoration(
                                    borderRadius:BorderRadius.circular(5), image: DecorationImage(
                                  image: NetworkImage(
                                      ServerDetails.get_images+(favList[index]as CompoundModal).images[0]),
                                  fit: BoxFit.cover,
                                )),
                              ),
                              Container(
                                height: 100,
                                width:width/4,
                                margin: EdgeInsets.only(left: 5,right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5), image: DecorationImage(
                                  image: NetworkImage(
                                      ServerDetails.get_images+(favList[index]as CompoundModal).images[1]),
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ):Container()
                    ],),
                ),
                Container(
                  width: width/2,alignment: Alignment.topCenter,
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // assets/images/userLocation.png
                      SizedBox(width: width/2,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Trishla Villa
                            Column( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: AutoSizeText(
                                      (favList[index]as CompoundModal).compoundname.toUpperCase(),
                                      style: const TextStyle(
                                          color:  Colors.black87,
                                          fontWeight: FontWeight.w700,
                                          fontFeatures: [FontFeature.proportionalFigures()],
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 18
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ), Padding(
                                  padding: const EdgeInsets.only(left:8,top:10),
                                  child: AutoSizeText(
                                      "Address: ",
                                      style: TextStyle(
                                          color:Colors.black87,
                                          fontWeight: FontWeight.w600,
                                          fontFeatures: [FontFeature.proportionalFigures()],
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.0
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8,top:20),
                              child: CircularPercentIndicator(
                                radius: width>=600?40.0:25,
                                lineWidth:width>=600? 4.0:2.0,
                                backgroundColor: Colors.black26,
                                percent: getpercentage( (favList[index]as CompoundModal).rating),
                                center: new Text(
                                  (favList[index]as CompoundModal).rating.toStringAsFixed(1),
                                  textAlign: TextAlign.center,

                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12.0,
                                    fontFeatures: [FontFeature.proportionalFigures()],),
                                ),
                                circularStrokeCap: CircularStrokeCap.butt,
                                progressColor: Colors.red,
                                footer: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: AutoSizeText("${(favList[index]as CompoundModal).reviewCount.toString()} Reviews",
                                      style:  TextStyle(
                                        color:Colors.black54,
                                        fontWeight: FontWeight.w600,
                                        decorationStyle: TextDecorationStyle.solid,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0,
                                        fontFeatures: [FontFeature.proportionalFigures()],),
                                      textAlign:
                                      TextAlign.left),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: AutoSizeText(
                            (favList[index]as CompoundModal).address,
                            style:  TextStyle(
                              color:Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontFeatures: [FontFeature.proportionalFigures()],
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.center),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left:16.0,right: 16,top:16,bottom:10),
                        child: CompoundRating((favList[index]as CompoundModal)),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.chat_bubble_2,
                                    color: Colors.black,size: 20,),
                                  Padding(padding: const EdgeInsets.only(left: 5,right: 20,),
                                    child: AutoSizeText("Q & A",
                                        style: const TextStyle(shadows: [Shadow(blurRadius: 5,color: Colors.black12,offset: Offset(1.0, 1.0))],
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0,
                                          fontFeatures: [FontFeature.proportionalFigures()],),
                                        textAlign: TextAlign.left),
                                  )
                                ],
                              ),
                            ),
                            FittedBox(
                              child: Container(
                                child: Row(
                                  children: [

                                    InkWell(
                                        mouseCursor: SystemMouseCursors.click,
                                        onTap: (){

                                          FavoriteModal favModal = new FavoriteModal();
                                          favModal.compoundID =(favList[index] as CompoundModal).id;
                                          Webservice.removeFavoriteRequest(context,favModal)
                                              .then((value) => this.setState(() {}));
                                          favouriteIDList.remove((favList[index] as CompoundModal).id);
                                          favList.remove(favList[index] as CompoundModal);

                                        },
                                        child : Icon(CupertinoIcons.heart_solid,
                                            color: ColorClass.blueColor,
                                        size: 20,)),

                                    // Padding(
                                    //   padding: const EdgeInsets.only(left:20.0,right:5),
                                    //   child: Icon(CupertinoIcons.heart,color: Colors.black,size: 18,),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5,right: 20,),
                                      child: AutoSizeText("Save",
                                          style: const TextStyle(shadows: [Shadow(blurRadius: 5,color: Colors.black12,offset: Offset(1.0, 1.0))],
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.0),
                                          textAlign: TextAlign.left),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(right: 10,top: 10),
                        width: width/2,alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, compoundDetails,
                                arguments: CompoundArgument(
                                    compoundId: (favList[index]as CompoundModal).id,
                                    compoundName: (favList[index]as CompoundModal).compoundname,
                                    images: (favList[index]as CompoundModal).images,
                                    address:(favList[index]as CompoundModal).address));
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context)=>CompoundDetails()));
                          },onHover: (value){
                          viewmore = value;
                          (context as Element).markNeedsBuild();
                        },
                          child: AutoSizeText("View more".toUpperCase(),
                              style: TextStyle(
                                  color:viewmore?Colors.blue.shade900:
                                  ColorClass.blueColor,
                                  fontWeight: viewmore?FontWeight.w700:FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: favList!=null?Divider(color: Colors.black12,thickness: 1,height: 2,):Container(),
          )
        ],
      ):
      Column(children: [
        Container(
          height: 150, alignment: Alignment.topCenter,
          width: width,  margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
          child: Swiper(
            itemBuilder: (BuildContext context, int ind) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: new Image.network(
                  ServerDetails.get_images+(favList[index]as CompoundModal).images[ind],
                  fit: BoxFit.fill,
                ),
              );
            },
            autoplay: false,
            itemCount:  (favList[index]as CompoundModal).images.length,
            pagination: new SwiperPagination(),


          ),

        ),

        Container(
          width: width,alignment: Alignment.topCenter,
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // assets/images/userLocation.png
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Trishla Villa
                    Column( crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: AutoSizeText(
                              (favList[index]as CompoundModal).compoundname.toUpperCase(),
                              style: const TextStyle(
                                  color:  Colors.black87,
                                  fontWeight: FontWeight.w700,

                                  fontStyle:  FontStyle.normal,
                                  fontSize: 16.0
                              ),
                              textAlign: TextAlign.left
                          ),
                        ), Padding(
                          padding: const EdgeInsets.only(left:8,top:10),
                          child: AutoSizeText(
                              "Address: ",
                              style: TextStyle(
                                  color:Colors.black87,
                                  fontWeight: FontWeight.w600,

                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.0
                              ),
                              textAlign: TextAlign.left
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 8,top:20),
                      child: CircularPercentIndicator(
                        radius: width>=600?38.0:25,
                        lineWidth:width>=600? 4.0:2.0,
                        backgroundColor: Colors.black26,
                        percent:getpercentage((favList[index]as CompoundModal).rating),
                        center: new Text(
                          (favList[index]as CompoundModal).rating.toStringAsFixed(1),
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10.0),
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        progressColor: Colors.red,
                        footer: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: AutoSizeText("${(favList[index]as CompoundModal).reviewCount.toString()} Reviews",
                              style:  TextStyle(
                                  color:Colors.black54,
                                  fontWeight: FontWeight.w600,
                                  decorationStyle: TextDecorationStyle.solid,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 10.0),
                              textAlign:
                              TextAlign.left),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: AutoSizeText(
                    (favList[index]as CompoundModal).address,
                    style:  TextStyle(
                      color:Colors.black87,
                      fontWeight: FontWeight.w600,

                      fontStyle: FontStyle.normal,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center),
              ),

              Padding(
                padding: EdgeInsets.only(left:16.0,right: 16,top:16,bottom:10),
                child: CompoundRating((favList[index]as CompoundModal)),
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.chat_bubble_2,
                            color: Colors.black,size: 18,),
                          Padding(padding: const EdgeInsets.only(left: 5,right: 20,),
                            child: AutoSizeText("Q & A",
                                style: const TextStyle(shadows: [Shadow(blurRadius: 5,color: Colors.black12,offset: Offset(1.0, 1.0))],
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left),
                          )
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20.0,right:5),
                              child: Icon(CupertinoIcons.heart_fill,color: ColorClass.blueColor,size: 18,),
                            ),
                            AutoSizeText("Save",
                                style: const TextStyle(shadows: [Shadow(blurRadius: 5,color: Colors.black12,offset: Offset(1.0, 1.0))],
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.left)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(right: 10,top: 10),
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){

                    Navigator.pushNamed(context, compoundDetails,
                        arguments: CompoundArgument(
                            compoundId: (favList[index]as CompoundModal).id,
                            compoundName: (favList[index]as CompoundModal).compoundname,
                            images: (favList[index]as CompoundModal).images,
                            address: (favList[index]as CompoundModal).address));

                  },onHover: (value){
                  viewmore = value;
                  (context as Element).markNeedsBuild();
                },
                  child: AutoSizeText("View more".toUpperCase(),
                      style: TextStyle(
                          color:viewmore?Colors.blue.shade900:
                          ColorClass.blueColor,
                          fontWeight: viewmore?FontWeight.w700:FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 10.0),
                      textAlign: TextAlign.left),
                ),
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: favList!=null?Divider(color: Colors.black12,thickness: 1,height: 2,):Container(),
        )
      ],),
    );
  }

}