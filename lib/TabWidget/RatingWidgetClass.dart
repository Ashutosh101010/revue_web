import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:getwidget/getwidget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webrevue/ColorClass.dart';
import 'package:webrevue/route/routing_constant.dart';

class RatingWidgetClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RatingWidgetClassState();
  }

}

class RatingWidgetClassState extends State<RatingWidgetClass>{
  double valueRating = 4.3;
  List amenitiesList = ['Furnished','Built in Wordrobes','Concierge','Security','Shared Pool','View of water',
    'View of landmark','Shared Gym','Kitchen Appliannce ','Central A/C'];

  String aboutProperty ="Duet is a revue award-winning More."
      " ‘Superenting’ scheme by Moorfield, managed by Allsop Letting & Management,"
      " adjacent to the bustling MediaCityUK on the waterfront in Salford Quays."
      " There are range of local amenities, which include 15 bars/restaurants, four shopping outlets,"
      " six leisure facilities, a cinema, a theatre, and a nursery. "
      "The development comprises 270 pet-friendly one, two and three-bedroom apartments to rent."
      " In addition, the building also provides a 24-hour concierge service and offers extensive communal spaces,"
      " including a fully equipped private gym."
      "The lobby is vey impressive and well designed with lots of seating for relaxing and working from home."
      " There is a free coffee machine in the lobby and residents are provided with a free cup on arrival"
      " (along with other little gifts). "
      "There is well stocked gym on the ground floor and with personal trainer and classes available.";
  bool descTextShowFlag = false;
  bool messagingHover = false;
  bool shareHover = false;
  bool favhover = false;
  double maxWidth;
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
          child: Align(
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
          decoration: BoxDecoration(image:
          DecorationImage(image: Image.asset("assets/images/hdimg.png").image,
            fit: BoxFit.fill,),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              AutoSizeText('Duet MediaCityUK, M50.',softWrap: true,
                style:TextStyle(
                    color:  Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontStyle:  FontStyle.normal,
                    fontSize: 18.0
                ) ,),
                AutoSizeText('‘Superenting’, Allsop Letting and Management',softWrap: true,
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
                          print(window.location.href);
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
                    print(window.location.href);
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GFRating(
                          size: 30,
                          value: valueRating,
                          color: Colors.yellow,
                          onChanged: (value) {
                            setState(() {
                              valueRating = value;
                            });
                          },
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              AutoSizeText(
                                  "4.85",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 16.0
                                  ),
                                  textAlign: TextAlign.left
                              ),

                              AutoSizeText(
                                  " (54 reviews)",
                                  style: TextStyle(
                                      color: Colors.black54,

                                      fontWeight: FontWeight.w700,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 16.0
                                  ),
                                  textAlign: TextAlign.left
                              ),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 10),
                      child:circularRatingWidget(context)),
                ],
              ),
            ),
          ),

            Container(width: 1,color: Colors.black87,),
            maxWidth>=800?
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: ratingBarWidget(context)
              ),
            ):Container(),

          ],),
          maxWidth>=800?Container():
          Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 10),
              child: ratingBarWidget(context)
          ),

        SizedBox(height: 20,),

        Row(
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: amenityWidget(context)),

            maxWidth>=900?
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child:Padding(
                padding: const EdgeInsets.only(left:10,top:80.0,right:10),
                child: mapWidget(context),
              )):Container()
          ],
        ),

          // maxWidth>=800?Container():
          // Padding(
          //     padding: const EdgeInsets.only(top: 10,bottom: 10),
          //     child: mapWidget(context),
          // ),



        SizedBox(height: 20,),
        // About Property

        Padding(
          padding: const EdgeInsets.only(right: 10),
          child:  aboutWidget(context)

        ),



      ],),
    );
  }


  Widget ratingBarWidget(BuildContext context){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween
            ,
            children: [
              Text("Excellent".toUpperCase(), style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w700,

                  fontStyle:  FontStyle.normal,
                  fontSize: 12.0
              ),),
              LinearPercentIndicator(
                trailing: Text(
                    "70%",
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                ),
                progressColor: Color(0xff0c5324),
                linearStrokeCap: LinearStrokeCap.butt,
                fillColor: Colors.white,
                backgroundColor: Color(0xcce5e5e5),
                lineHeight: 15,
                width: 170,
                percent: 0.7,

              ),

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Very Good".toUpperCase(), style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w700,

                  fontStyle:  FontStyle.normal,
                  fontSize: 12.0
              ),),
              LinearPercentIndicator(
                trailing: Text(
                    "80%",
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                ),
                progressColor: Color(0xff0c5324),
                linearStrokeCap: LinearStrokeCap.butt,
                fillColor: Colors.white,
                backgroundColor: Color(0xcce5e5e5),
                lineHeight: 15,
                width: 170,
                percent: 0.8,

              ),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Average".toUpperCase(), style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w700,
                  fontStyle:  FontStyle.normal,
                  fontSize: 12.0
              ),),
              LinearPercentIndicator(
                trailing: Text(
                    "09%",
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                ),
                progressColor: Color(0xff0c5324),
                linearStrokeCap: LinearStrokeCap.butt,
                fillColor: Colors.white,
                backgroundColor: Color(0xcce5e5e5),
                lineHeight: 15,
                width: 170,
                percent: 0.2,

              ),

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Poor".toUpperCase(), style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w700,

                  fontStyle:  FontStyle.normal,
                  fontSize: 12.0
              ),),
              LinearPercentIndicator(
                trailing: Text(
                    "02%",
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                ),
                progressColor: Color(0xff0c5324),
                linearStrokeCap: LinearStrokeCap.butt,
                fillColor: Colors.white,
                backgroundColor: Color(0xcce5e5e5),
                lineHeight: 15,
                width: 170,
                percent: 0.1,

              ),

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Very Poor".toUpperCase(), style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w700,

                  fontStyle:  FontStyle.normal,
                  fontSize: 12.0
              ),),
              LinearPercentIndicator(
                trailing: Text(
                    "00%",
                    style: const TextStyle(
                        color:  Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                ),
                progressColor: Color(0xff0c5324),
                linearStrokeCap: LinearStrokeCap.butt,
                fillColor: Colors.white,
                backgroundColor: Color(0xcce5e5e5),
                lineHeight: 15,
                width: 170,
                percent: 0.0,

              ),

            ],
          ),
        ),


      ],
    );
  }

  Widget circularRatingWidget(BuildContext context){
    return  FittedBox(fit:BoxFit.fitWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularPercentIndicator(
            radius:maxWidth>=900? 40.0:maxWidth>=600?35:30,
            lineWidth:maxWidth>=900? 4.3:maxWidth>=600?3.5:2.5,
            animation: false,

            percent: 0.6,
            center: new Text(
              "3.6",
              style:
              new TextStyle(color:  Colors.black87,fontWeight: FontWeight.w700,
                  fontSize: 12.0),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.black26,
            progressColor:  ColorClass.redColor,
            fillColor: Colors.white,
            footer: Padding(
              padding: const EdgeInsets.only(
                top: 8,right: 4),
              child: AutoSizeText(
                  "Facilities".toUpperCase(),
                  style: const TextStyle(
                      color:  Colors.black87,
                      fontWeight: FontWeight.w700,

                      fontStyle:  FontStyle.normal,
                      fontSize: 10.0
                  ),
                  textAlign: TextAlign.left
              ),
            ) ,
          ),
          CircularPercentIndicator(
            radius:maxWidth>=900? 40.0:maxWidth>=600?35:30,
            lineWidth:maxWidth>=900? 4.3:maxWidth>=600?3.5:2.5,

            animation: false,

            percent: 0.2,
            center: new Text(
              "3.2",
              style:
              new TextStyle(color:  Colors.black87, fontSize: 12.0,fontWeight: FontWeight.w700),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.black26,
            progressColor:  ColorClass.blueColor,
            fillColor: Colors.white,
            footer:  Padding(
              padding: const EdgeInsets.only(
                  top: 8,right: 4),
              child: AutoSizeText(
                  "Design".toUpperCase(),
                  style: const TextStyle(
                      color:  Colors.black87,
                      fontWeight: FontWeight.w700,

                      fontStyle:  FontStyle.normal,
                      fontSize: 10.0
                  ),
                  textAlign: TextAlign.left
              ),
            ),
          ),
          CircularPercentIndicator(
            radius:maxWidth>=900? 40.0:maxWidth>=600?35:30,
            lineWidth:maxWidth>=900? 4.3:maxWidth>=600?3.5:2.5,

            animation: false,
            percent: 0.6,
            center: new Text(
              "3.8",
              style:
              new TextStyle(color:  Colors.black87, fontSize: 12.0,fontWeight: FontWeight.w700),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.black26,
            progressColor: Colors.green,
            fillColor: Colors.white,
            footer: Padding(
              padding: const EdgeInsets.only(
                  top: 8,right: 4),
              child: AutoSizeText(
                  "Location".toUpperCase(),
                  style: const TextStyle(
                      color:  const Color(0xff000000),
                      fontWeight: FontWeight.w700,

                      fontStyle:  FontStyle.normal,
                      fontSize: 10.0,letterSpacing: 0.5
                  ),
                  textAlign: TextAlign.left
              ),
            ),
          ),
          CircularPercentIndicator(
            animation: false,
            radius:maxWidth>=900? 40.0:maxWidth>=600?35:30,
            lineWidth:maxWidth>=900? 4.3:maxWidth>=600?3.5:2.5,

            percent: 0.6,
            center: new Text(
              "3.6",
              style:
              new TextStyle(   color:  Colors.black87,fontSize: 12.0,fontWeight: FontWeight.w700),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.black26,
            progressColor:  Colors.orangeAccent,
            fillColor: Colors.white,
            footer: Padding(
              padding: const EdgeInsets.only(
                  top: 8,right: 4),
              child: AutoSizeText(
                  "Value".toUpperCase(),
                  style: const TextStyle(
                      color:  Colors.black87,
                      fontWeight: FontWeight.w700,

                      fontStyle:  FontStyle.normal,
                      fontSize: 10.0,
                  ),
                  textAlign: TextAlign.left
              ),
            ),
          ),
          CircularPercentIndicator(
            radius:maxWidth>=900? 40.0:maxWidth>=600?35:30,
            lineWidth:maxWidth>=900? 4.3:maxWidth>=600?3.5:2.5,

            animation: false,
            percent: 0.3,
            center: new Text(
              "3.3",
              style:
              new TextStyle(
                  color:  Colors.black87,fontSize: 12.0,fontWeight: FontWeight.w700),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.black26,
            progressColor: Colors.indigo,
            fillColor: Colors.white,
            footer: Padding(
              padding: const EdgeInsets.only(
                  top: 8,right: 4),
              child: AutoSizeText(
                  "Management".toUpperCase(),
                  style: const TextStyle(
                      color:  Colors.black87,
                      fontWeight: FontWeight.w700,

                      fontStyle:  FontStyle.normal,
                      fontSize: 10.0,
                  ),
                  textAlign: TextAlign.left
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget amenityWidget(BuildContext context){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Amenities",
          style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w700,
            fontSize: 18,
            fontStyle:  FontStyle.normal,),),
        Container(
          margin: EdgeInsets.only(top: 40,bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: Container(
            width: 300,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return Text(amenitiesList[index],
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,

                      fontStyle:  FontStyle.normal,
                      fontSize: 14.0),);
              },shrinkWrap: true,
              itemCount: amenitiesList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                (crossAxisCount:2,childAspectRatio: 10/1),
            ),
          ),
        )
      ],
    );
  }

  Widget mapWidget(BuildContext context){
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width:maxWidth>700? 160:110,height:maxWidth>700? 160:110,
          decoration: BoxDecoration(color: Colors.black12,shape: BoxShape.circle,
              border:Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),

                ),],
              image: DecorationImage(fit: BoxFit.fill,
                  image: AssetImage("assets/images/circularMap.png"))),
        ),
        // Maps
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(
              "Maps",
              style: const TextStyle(
                  color:  Colors.black54,
                  fontWeight: FontWeight.w600,

                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.center
          ),
        ),
        // Al Thumama Doha, Al Thumama
        AutoSizeText("Al Thumama Doha, Al Thumama",
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w700,

                fontStyle:  FontStyle.normal,
                fontSize: 14.0
            ),
            textAlign: TextAlign.left
        )
      ],
    );
  }

  Widget aboutWidget(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(top: 5,bottom: 10),
          child: Text(
              "About Property",
              style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w700,
                fontSize: 18,
                fontStyle:  FontStyle.normal,),
              textAlign: TextAlign.left
          ),
        ),

        Padding(
          padding:  EdgeInsets.only(top: 5,left: 8,right: 8),
          child: Text(
            aboutProperty,textAlign: TextAlign.start,
            maxLines: descTextShowFlag ?8:5,
            overflow:descTextShowFlag?TextOverflow.visible : TextOverflow.fade,
            style:TextStyle (
              wordSpacing: 5,
              color: Colors.black54,
              fontWeight: FontWeight.w600,

              fontStyle:  FontStyle.normal,
              fontSize: 14.0),),
        ),

        Container(
            margin: EdgeInsets.only(top: 5,bottom: 20),
            alignment: Alignment.centerRight,
            child: descTextShowFlag ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    descTextShowFlag = !descTextShowFlag;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("READ LESS",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12,
                            color: ColorClass.blueColor,fontWeight: FontWeight.w600)),
                    Icon(Icons.keyboard_arrow_up_outlined,color: Colors.black,)
                  ],
                ),
              ),
            ) :
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    descTextShowFlag = !descTextShowFlag;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("READ MORE",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12,
                            color: ColorClass.blueColor,fontWeight: FontWeight.w600)),
                    Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,)
                  ],
                ),
              ),
            ))


        // ),
      ],);
  }
}