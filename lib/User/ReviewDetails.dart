import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../ColorClass.dart';

class ReviewDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return ReviewDetailState();
  }
}

class ReviewDetailState extends State<ReviewDetails> {
  List prosList = [
    'Secured and safe place to live.',
    'Water is available 24/7.',
    'Well furnished place.'
  ];
  List consList = ['View is not good.', 'parking spaces are not available'];
  double valueRating = 4.3;
  String reviews =
      "The lobby is vey impressive and well designed with lots of seating"
      " for relaxing and working from home. There is a free coffee machine in the lobby and residents"
      " are provided with a free cup on arrival (along with other little gifts). There is well stocked"
      " gym on the ground floor and with personal trainer and classes available. On the mezzanine level, "
      "there is a raised garden with fabulous furniture and view over the water. Also on the mezzanine there"
      " is further indoor seating and a small library and painting gallery. Lifts are available from all floors."
      " Everything is kept well maintained and functioning. The staff are extremely friendly and welcoming from "
      "the moment you meet them. They give you a warm and genuinely friendly greeting every time you pass them.";
  double maxWidth;
  @override
  Widget build(BuildContext context) {
     maxWidth = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: maxWidth>=1000?
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leftReviewPanel(context),
          rightReviewPanel(context)
         
        ],
      ):ListView(
        shrinkWrap: true,
        children: [
          compoundImage(context),
          addressWidget(BuildContext),
          overAllRating(BuildContext),
          ratingPercentWidget(context),
          reviewDetail(context),

          proWidget(context),
          consWidget(context),
          bottomNav(context)




      ],),
    );
  }


  Widget priceWidget(){
    return  Flexible(flex: 1,
      child: Row(
        children: [
          Text(
              "Price ",
              style: TextStyle(
                  color:  Colors.black,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w600,
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.left
          ),
          Text(
              " 45000 /month",
              style:  TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Mulish",
                  fontStyle:  FontStyle.normal,
                  fontSize: 15.0
              ),
              textAlign: TextAlign.left
          ),
        ],
      ),);
  }

  Widget bedRoomWidget(){
    return  Flexible(flex: 1,
      child: Row(
        children: [
          Icon(Icons.king_bed),
          Text(
              "  Bed Rooms :",
              style:  TextStyle(
                  color:  Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Mulish",
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.left
          ),
          Text(
              " 2",
              style:  TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Mulish",
                  fontStyle:  FontStyle.normal,
                  fontSize: 15.0
              ),
              textAlign: TextAlign.left
          ),
        ],
      ),);
  }
  Widget ratingWidget(){
    return  Flexible(
      flex: 1,
      child:  Row(
        children: [
          GFRating(
            size: 20,
            value: valueRating,
            color: Colors.yellow,
            borderColor: Colors.yellow,
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
                        fontFamily: "Mulish",
                        fontStyle:  FontStyle.normal,
                        fontSize: 14.0
                    ),
                    textAlign: TextAlign.left
                ),

                AutoSizeText(
                    " (54 reviews)",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontStyle:  FontStyle.normal,
                        fontSize: 14.0
                    ),
                    textAlign: TextAlign.left
                ),


              ],
            ),
          ),
        ],
      ),);
  }

  Widget floorPlan(){
    return  Flexible(flex: 1,
      child: Row(
        children: [
          Text(
              "Floor Plan ",
              style:  TextStyle(
                  color:  Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Mulish",
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.left
          ),
          Text(
              " 564 sqft / 52 sqm",
              style:  TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Mulish",
                  fontStyle:  FontStyle.normal,
                  fontSize: 15.0
              ),
              textAlign: TextAlign.left
          ),
        ],
      ),);
  }

  Widget bathroomWidget(){
    return Flexible(flex: 1,
      child: Row(
        children: [
          Icon(Icons.bathtub_outlined),
          Text(
              "  Bath Rooms :",
              style: TextStyle(
                  color:  Colors.black,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w600,
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.left
          ),
          Text(
              " 2",
              style:  TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Mulish",
                  fontStyle:  FontStyle.normal,
                  fontSize: 15.0
              ),
              textAlign: TextAlign.left
          ),
        ],
      ),);
  }

  Widget reviewDateWidget(){
    return Flexible(flex: 1,child:  Row(
      children: [
        AutoSizeText(
            "Review Date ",
            style:  TextStyle(
                color:  Colors.black,
                fontFamily: "Mulish",
                fontWeight: FontWeight.w600,
                fontStyle:  FontStyle.normal,
                fontSize: 16.0
            ),
            textAlign: TextAlign.left
        ),

        AutoSizeText(
            " 23 Dec 2020",
            style:  TextStyle(

                fontFamily: "Mulish",
                fontStyle:  FontStyle.normal,
                fontSize: 15.0,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.left
        ),
      ],
    ),);
  }
  
  
  Widget consWidget(BuildContext context){
   return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Cons",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mulish",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Text(
                  "- " + consList[index],
                  style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500),
                );
              },
              shrinkWrap: true,
              itemCount: consList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget proWidget(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Pros",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mulish",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Text(
                  "- " + prosList[index],
                  style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500),
                );
              },
              shrinkWrap: true,
              itemCount: prosList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget ratingPercentWidget(BuildContext context){
    return  Padding(
      padding: const EdgeInsets.only(left: 8,right: 8),
      child: SizedBox(
        // height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircularPercentIndicator(
                  radius: 40.0,
                  animation: false,
                  lineWidth: 4.0,
                  percent: 0.4,
                  center: new Text(
                    "3.6",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Colors.black26,
                  progressColor: Colors.orange,
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Facilities",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontFamily: "Mulish",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.5),
                        textAlign: TextAlign.left),
                  ) ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircularPercentIndicator(
                  radius: 40.0,
                  animation: false,
                  lineWidth: 4.0,
                  percent: 0.3,
                  center: new Text(
                    "3.2",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Colors.black26,
                  progressColor: Colors.blue,
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Design",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontFamily: "Mulish",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.5),
                        textAlign: TextAlign.left),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircularPercentIndicator(
                  radius: 40.0,
                  animation: false,
                  lineWidth: 4.0,
                  percent: 0.5,
                  center: new Text(
                    "3.5",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Colors.black26,
                  progressColor: Colors.red,
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Location",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontFamily: "Mulish",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.5),
                        textAlign: TextAlign.left),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircularPercentIndicator(
                  radius: 40.0,
                  animation: false,
                  lineWidth: 4.0,
                  percent: 0.5,
                  center: new Text(
                    "3.5",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Colors.black26,
                  progressColor: Colors.yellow,
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Value",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontFamily: "Mulish",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.5),
                        textAlign: TextAlign.left),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircularPercentIndicator(
                  radius: 40.0,
                  animation: false,
                  lineWidth: 4.0,
                  percent: 0.5,
                  center: new Text(
                    "3.5",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Colors.black26,
                  progressColor: Colors.purple,
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Management",
                        style: const TextStyle(
                            color: const Color(0xff000000),
                            fontFamily: "Mulish",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.5),
                        textAlign: TextAlign.left),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget overAllRating(BuildContext){
    return  Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        alignment: Alignment.center,
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 60.0,
              animation: true,
              animationDuration: 1200,
              lineWidth: 6.0,
              percent: 0.4,
              center: new Text(
                "3.2",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.black26,
              progressColor: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Overall Rating".toUpperCase(),
                  style: const TextStyle(
                      color:  const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Mulish",
                      fontStyle:  FontStyle.normal,
                      fontSize: 14.0,letterSpacing: 0.5
                  ),
                  textAlign: TextAlign.left
              ),
            )
          ],
        ));

  }
  Widget addressWidget(BuildContext){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                "Location",
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Mulish",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: AutoSizeText(
                "Southwest apartments, Green community West,Green Community,Dubai",
                style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
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

                overAllRating(BuildContext),
                ratingPercentWidget(context),

                Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                addressWidget(BuildContext),

                SizedBox(
                  height: 20,
                ),

                proWidget(context),

                SizedBox(
                  height: 20,
                ),

                consWidget(context)

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget reviewDetail(BuildContext context){
    return Wrap(children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Review",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: "Mulish",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(reviews,
            style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.left),
      ),
    ],);
  }
  
  Widget compoundImage(BuildContext context){
    return  Container(
      height: 230,
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 30,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.black,
                )),
          ),
        ),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/house.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
  
  Widget bottomNav(BuildContext context){
    return  Padding(
        padding: const EdgeInsets.all(10.0),
        child:
        maxWidth>=1000?
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Was this review helpful?",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidFlag,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Report",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Share",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
            ]):
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Was this review helpful?",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidFlag,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Report",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText("Share",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
            ])
    );
  }
  
  Widget rightReviewPanel(BuildContext context){
    return  Flexible(
      flex: 2,
      fit: FlexFit.loose,
      child: ListView(
        children: [
         
          compoundImage(context),
          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              priceWidget(),
              bedRoomWidget(),
              ratingWidget()
            ],),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 8,bottom: 5,left: 8,right: 8),

            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              floorPlan(),
              bathroomWidget(),
              reviewDateWidget()

            ],),
          ),

          reviewDetail(context),
          bottomNav(context)
         
        ],
      ),
    );
  }
}
