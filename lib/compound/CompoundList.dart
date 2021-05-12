
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_container/overlay_container.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:webrevue/AppBar/AppBarFirst.dart';
import 'package:webrevue/AppBar/AppBarSec.dart';
import 'package:webrevue/ColorClass.dart';
import 'package:webrevue/footer/FooterWidget.dart';
import 'package:webrevue/route/routing_constant.dart';

import 'FilterScreen.dart';
GlobalKey<CompoundListState> compoundListKey = new GlobalKey<CompoundListState>();

class CompoundList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CompoundListState();
  }
  CompoundList({Key compoundListKey}):super(key:compoundListKey);
}



class CompoundListState extends State<CompoundList>{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool filter = false;
  String selectedCategory;
  String selectedLocation;
  List category = ['1', '2', '3', '4', '5', '6'];
  double _width;
  bool viewmore = false;
  List  texthover;

  List propertyImage = [
    "assets/images/houseFirst.png",
    "assets/images/houseSec.png",
    "assets/images/houseThird.png",
    "assets/images/houseForth.png",
  ];
  List compoundName = ["Trishla Villa","The Green Rooms","Be:Here Hays","Fizzy Canning Town",];

  double valueRating = 4;

  ScrollController controller= new ScrollController();
  var optionMenuSelected;
  ScrollController _scrollController;
  List ratingValue = [0.4,0.5,0.6,0.3];
  List ratingName = ["Facilities","Design","Location","Management"];
  List<Color> colorList = [Colors.orange,Colors.blue,Colors.red,Colors.green,];


  @override
  void initState() {
    super.initState();
    _scrollController  = ScrollController();
    texthover  = List.filled(propertyImage.length, false);
  }

  void toggleDropdown() {
    setState(() {
      filter = !filter;
    });
  }


  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxheight = MediaQuery.of(context).size.height;
    return Material(
      child: LayoutBuilder(builder: (context,constraints){
        var width = constraints.maxWidth>=700;
        print(maxWidth);
        print(constraints.maxWidth);
        return Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          appBar: width?
          PreferredSize(preferredSize: Size.fromHeight(80),child:  AppBarFirst( constraints.maxWidth),)
              :AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
              return scaffoldKey.currentState.openDrawer();
            },),
          ),
          body:Column(
            children: [
            Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    maxWidth>=900?Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(bottom: BorderSide(color: Colors.black12))
                      ),
                      child: AppBarSecState().searchWidget(maxWidth/2.3),
                    ):Container(),

                    Padding(
                      padding: EdgeInsets.only(left: maxWidth/30,bottom: 40),
                      child: filterWidget(width,maxWidth),
                    ),
                   filter? OverlayContainer(
                        show: filter,
                        position: OverlayContainerPosition(0, 0,),
                        child: FilterScreen()
                    ):Container(),

                    maxWidth>=1300?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,right:20),
                        child: leftSide(maxWidth/2),
                      ),
                      rightSide(maxWidth/3)
                    ],):
                    maxWidth>=1000?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      leftSide(maxWidth/2),
                      rightSide(maxWidth/3)
                    ],):
                    leftSide(maxWidth)

                  ],
                ),
              ),
            ),
            ),


          ],),
        );

      },),
    );
  }



  Widget filterWidget(bool width,double maxWidth){
    return Padding(
      padding: const EdgeInsets.only(left: 30,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Recommended
          Text("Recommended",
              style:  TextStyle(
                  color: Color(0xb2000000),
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 25.0),
              textAlign: TextAlign.left),
          // Rectangle 86
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                if(width){
                  toggleDropdown();
                }else
                {
                  Navigator.pushNamed(context, filtercompound);
                }
              },

              child: Container(
                margin: EdgeInsets.only(right:maxWidth/(maxWidth/150)),
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                      color:Colors.white,
                      border:Border.all(
                          color: const Color(0xff000000),
                          width: 1.5,style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Filter
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Filter",
                            style:  TextStyle(
                                color: Color(0x99000000),
                                fontWeight: FontWeight.w400,

                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                      ),
                      Image.asset(
                        "assets/images/filterAndSort.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,)
                    ],
                  )),
            ),
          )

        ],
      ),
    );
  }

  Widget leftSide(double width){
    print("leftside"+width.toString());
    return Container(
      width:width,alignment: Alignment.topCenter,
      margin: width>=700?EdgeInsets.only(right: 40):EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: propertyImage.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return
              Container(
                width:width,
                height: 280,
                decoration: BoxDecoration(color: Colors.white,),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width:width/2,
                          alignment: Alignment.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min, children: [
                            Container(
                              height: 150, alignment: Alignment.topCenter,
                              width: width/2,  margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5), image: DecorationImage(
                                image: AssetImage(
                                    propertyImage[index]),
                                fit: BoxFit.cover,
                              )),
                            ),

                            width>=600?
                            Container(width: width/2,
                              child: FittedBox(fit:BoxFit.fitWidth,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 95,
                                      width: width/4,
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(5), image: DecorationImage(
                                        image: AssetImage(
                                            propertyImage[index]),
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                    Container(
                                      height: 95,
                                      width:width/4,
                                      margin: EdgeInsets.only(left: 5,right: 5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5), image: DecorationImage(
                                        image: AssetImage(
                                            propertyImage[index]),
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
                                              "Trishla villa".toUpperCase(),
                                              style: const TextStyle(
                                                  color:  Colors.black54,
                                                  fontWeight: FontWeight.w600,

                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 17.0
                                              ),
                                              textAlign: TextAlign.left
                                          ),
                                        ), Padding(
                                          padding: const EdgeInsets.only(left:8,top:10),
                                          child: AutoSizeText(
                                              "Address: ",
                                              style: TextStyle(
                                                  color:Colors.black54,
                                                  fontWeight: FontWeight.w600,

                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 13.0
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
                                        percent: 0.5,
                                        center: new Text(
                                          "3.5",
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 10.0),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.butt,
                                        progressColor: Colors.red,
                                        footer: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: AutoSizeText("54 Reviews",
                                              style:  TextStyle(
                                                  color:Colors.black,
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
                                    "Southwest apartments, Green community West,Green Community,Dubai",
                                    style:  TextStyle(
                                        color:Colors.black54,
                                        fontWeight: FontWeight.w700,

                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0,
                                    ),
                                    textAlign: TextAlign.center),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left:16.0,right: 16,top:16,bottom:10),
                                child: ratingBar(context,width),
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
                                          Padding(padding: const EdgeInsets.only(right: 20,),
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
                                              child: Icon(CupertinoIcons.heart,color: Colors.black,size: 18,),
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

                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, compoundDetails);
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context)=>CompoundDetails()));
                                },onHover: (value){
                                texthover[index] = value;
                                viewmore = value;
                                (context as Element).markNeedsBuild();
                              },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10,top: 10),
                                  width: width/2,alignment: Alignment.centerRight,
                                  child: AutoSizeText("View more".toUpperCase(),
                                      style: TextStyle(
                                          color:texthover[index]?Colors.blue.shade900:
                                          ColorClass.blueColor,
                                          fontWeight: texthover[index]?FontWeight.w700:FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10.0),
                                      textAlign: TextAlign.left),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Divider(color: Colors.black12,thickness: 1,height: 2,),
                    )
                  ],
                ),);

          }),

    );
  }

  Widget rightSide(double width){
    print("right side"+width.toString());
    return  Container(
      width: 400,alignment: Alignment.topCenter,
      margin: width>=400?EdgeInsets.only(left: 60):EdgeInsets.all(10),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding:EdgeInsets.only(left: 20,right: 20,bottom: 10),
            child: Text(
                "Property nearby you",
                style: const TextStyle(
                    color:  const Color(0xff000000),
                    fontWeight: FontWeight.w500,

                    fontStyle:  FontStyle.normal,
                    fontSize: 20.0
                ),
                textAlign: TextAlign.left
            ),
          ),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 140,width: 300,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            width: 30,height: 30,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,color: Colors.white,),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset("assets/images/heart.png",
                                fit: BoxFit.contain,height: 20,width: 20,),
                            ),
                          ),
                        ),),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage("assets/images/house.png"),
                            fit: BoxFit.fill,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15,top: 5),
                      child: Text(
                          "The Trilogy, M15",
                          style:  TextStyle(
                              color:  Colors.black,

                              fontWeight: FontWeight.w600,
                              fontStyle:  FontStyle.normal,
                              fontSize: 16.0
                          ),
                          textAlign: TextAlign.left
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15,top: 5),
                      child: Text(
                          "More ‘Superenting’, Allsop Letting and Managementr",
                          style:  TextStyle(
                              color:  Colors.black,
                              fontWeight: FontWeight.w500,

                              fontStyle:  FontStyle.normal,
                              fontSize: 15.0
                          ),
                          textAlign: TextAlign.left
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15,top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GFRating(
                            size: 20,
                            value: 3.4,
                            color: Colors.yellow,
                            borderColor: Colors.yellow,
                            onChanged: (value) {
                              setState(() {

                              });
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                    "4.85",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,

                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.0
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                Text(
                                    " (54 reviews)",
                                    style: TextStyle(
                                        color: Colors.black,

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
                  ],),
              );
            },
          ),

        ],
      ),
    );
  }



  Widget ratingBar(BuildContext context,double rwidth){
    return  Container(
        width: rwidth,
        margin: EdgeInsets.only(top: 5,bottom: 5),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,top:8),
                child: CircularPercentIndicator(
                  radius: 38.0,
                  lineWidth: 3.8,
                  backgroundColor: Colors.black26,
                  percent: 0.6,
                  center: new Text(
                    "3.6",
                    style: new TextStyle(
                        fontWeight:
                        FontWeight.bold,
                        fontSize: 10.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  progressColor: Colors.blue,
                  footer:Padding(
                    padding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                    child: AutoSizeText("Facilities".toUpperCase(),
                        softWrap: true,
                        style: const TextStyle(
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                            decorationStyle: TextDecorationStyle.solid,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.0),
                        textAlign: TextAlign.left),
                  ) ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,top:8),
                child: CircularPercentIndicator(
                  radius: 38.0,
                  lineWidth: 3.8,
                  backgroundColor: Colors.black26,
                  percent: 0.3,
                  center: new Text(
                    "3.2",
                    style: new TextStyle(
                        fontWeight:
                        FontWeight.bold,
                        fontSize: 10.0),
                  ),
                  circularStrokeCap:
                  CircularStrokeCap.butt,
                  progressColor:
                  Colors.redAccent,
                  footer: Padding(
                    padding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                    child: AutoSizeText("Design".toUpperCase(),
                        style:  TextStyle(
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                            decorationStyle: TextDecorationStyle.solid,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.0),
                        textAlign: TextAlign.left),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,top:8),
                child: CircularPercentIndicator(
                  radius: 38.0,
                  lineWidth: 3.8,
                  backgroundColor: Colors.black26,
                  percent: 0.5,
                  center: new Text("3.5",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  progressColor: Colors.green,
                  footer: Padding(
                    padding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                    child: AutoSizeText("Location".toUpperCase(),
                        style:  TextStyle(
                            color:Colors.black,
                            fontWeight: FontWeight.w600,
                            decorationStyle: TextDecorationStyle.solid,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.0),
                        textAlign:
                        TextAlign.left),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right:8,top:8),
                child: CircularPercentIndicator(
                  radius: 38.0,
                  lineWidth: 3.8,
                  backgroundColor: Colors.black26,
                  percent: 0.5,
                  center: new Text(
                    "3.5",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 10.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  progressColor: Colors.yellow,
                  footer: Padding(
                    padding: const EdgeInsets.only(left:10,right:10,top:5,bottom:5),
                    child: AutoSizeText("Management".toUpperCase(),
                        style:  TextStyle(
                            color:Colors.black,
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
        ));
  }


}
