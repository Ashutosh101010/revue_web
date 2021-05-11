import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hovering/hovering.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:webrevue/AppBar/AppBarFirst.dart';
import 'ColorClass.dart';
import 'SignUp.dart';
import 'compound/CompoundList.dart';
import 'footer/FooterWidget.dart';
import 'route/routing_constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  List propertyImage = [
    "assets/images/houseFirst.png",
    "assets/images/houseSec.png",
    "assets/images/houseThird.png",
    "assets/images/houseForth.png",
    "assets/images/houseFifth.png"
  ];

  bool signUp = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedCard = -1;
  OverlayEntry overlayEntry;
  bool showOverlay = false;

  void showIndicator(BuildContext context) {
    // indicatorOffset = getIndicatorOffset(details.localPosition);
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 60.0,
          left: 20,
          right: 20,
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Register to Unlock REVUE",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Mulish",
                              fontStyle: FontStyle.normal,
                              fontSize: 23.0),
                          textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Are you paid fairly? Get a free, personalised sala
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Find the right property",
                                      style: TextStyle(
                                          color: const Color(0x99000000),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Mulish",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 17.0),
                                      textAlign: TextAlign.left),
                                ),
                                Text(
                                    "Millions of Property."
                                    " Search by what matters to you and find the one thats right for you.",
                                    style: const TextStyle(
                                        color: const Color(0xcc006492),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Mulish",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.left)
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Are you paid fairly? Get a free, personalised sala
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Are you paid fairly?",
                                      style: TextStyle(
                                          color: const Color(0x99000000),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Mulish",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 17.0),
                                      textAlign: TextAlign.left),
                                ),
                                Text(
                                    "Read anonymous reviews on over 600,000 Properties "
                                    "worldwide from the people that register there.",
                                    style: const TextStyle(
                                        color: const Color(0xcc006492),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Mulish",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                    textAlign: TextAlign.left)
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Are you paid fairly? Get a free, personalised sala
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Compare Properties",
                                      style: TextStyle(
                                        color: const Color(0x99000000),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Mulish",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 17.0,
                                      ),
                                      textAlign: TextAlign.left),
                                ),
                                Text(
                                    "Are you paid fairly? Get a free, personalised salary"
                                    " estimate and compare with millions of Property.",
                                    style: const TextStyle(
                                      color: const Color(0xcc006492),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Mulish",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0,
                                    ),
                                    textAlign: TextAlign.left)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
  }

  void hideIndicator(BuildContext context) {
    overlayEntry.remove();
  }
  ScrollController scrollController= new ScrollController();

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: Drawer(
        child: drawerItems(context, false),
      ),
      body: SmoothScrollWeb(
        controller: scrollController,
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(controller: scrollController,
                  child: Column(
                    // shrinkWrap: true,
                    // physics: AlwaysScrollableScrollPhysics(),
                    // scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        width: maxWidth,
                        height: 580,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter:
                                    ColorFilter.mode(Colors.white, BlendMode.dstOver),
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/map.png"))),
                        child: Column(
                          children: [
                            maxWidth >= 700
                                ? optionMenu(context)
                                : Align(
                                    alignment: Alignment.topLeft,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        return scaffoldKey.currentState.openDrawer();
                                      },
                                    ),
                                  ),
                            buttonWidget(context,),
                          ],
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(children: [
                            // How revue Works For You
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text("How Revue works for you",
                                  style: TextStyle(
                                      color: ColorClass.blueColor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Mulish",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 27.0),
                                  textAlign: TextAlign.center),
                            ),

                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              margin: maxWidth >= 700
                                  ? EdgeInsets.only(
                                      left: 60, right: 60, top: 20, bottom: 10)
                                  : EdgeInsets.all(10),
                              child: maxWidth >= 700
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: Column(
                                            children: [
                                              Icon(
                                                CupertinoIcons.search,
                                                color: ColorClass.redColor,
                                                size: 40,
                                              ),
                                              // Search the right property
                                              Text("Search the right property",
                                                  style: TextStyle(
                                                      color: ColorClass.blueColor,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Mulish",
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 20.0),
                                                  textAlign: TextAlign.left)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/reviewicon.png",
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.contain,
                                                color: ColorClass.redColor,
                                              ),
                                              // Search the right property
                                              Text("Review properties",
                                                  style: TextStyle(
                                                      color: ColorClass.blueColor,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Mulish",
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 20.0),
                                                  textAlign: TextAlign.left)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/compare.png",
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.contain,
                                                color: ColorClass.redColor,
                                              ), // Search the right property
                                              Text("Compare Properties",
                                                  style: TextStyle(
                                                      color: ColorClass.blueColor,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Mulish",
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 18.0),
                                                  textAlign: TextAlign.left)
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: Column(
                                            children: [
                                              Icon(
                                                CupertinoIcons.search,
                                                color: ColorClass.redColor,
                                                size: 40,
                                              ),
                                              // Search the right property
                                              Text("Search the right property",
                                                  style: TextStyle(
                                                      color: ColorClass.blueColor,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Mulish",
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 20.0),
                                                  textAlign: TextAlign.left)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/reviewicon.png",
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.contain,
                                                color: ColorClass.redColor,
                                              ),
                                              // Search the right property
                                              Text("Review properties",
                                                  style: TextStyle(
                                                      color: ColorClass.blueColor,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Mulish",
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 20.0),
                                                  textAlign: TextAlign.left)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/compare.png",
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.contain,
                                                color: ColorClass.redColor,
                                              ), // Search the right property
                                              Text("Compare Properties",
                                                  style: TextStyle(
                                                      color: ColorClass.blueColor,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Mulish",
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 18.0),
                                                  textAlign: TextAlign.left)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, bottom: 20, left: 50, right: 50),
                              child: Text(
                                  "Millions of people are searching for Property, rent information, public reviews, and property information. See what others are looking for on revue today.",
                                  style: const TextStyle(
                                      color: const Color(0xe5000000),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Mulish",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.center),
                            ),
                          ])),

                      SizedBox(height: 20,),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          decoration: BoxDecoration(boxShadow: [
                            // BoxShadow(
                            //     color: const Color(0x40000000),
                            //     offset: Offset(0, 4),
                            //     blurRadius: 4,
                            //     spreadRadius: 0)
                          ], color: const Color(0x4d000000))),


                      //Top rated compound

                      Container(
                        width: maxWidth,
                        padding:   maxWidth >= 700? EdgeInsets.only(left: 60,right:60,top: 20,bottom: 10):
                        EdgeInsets.all(20),
                        color:Color(0xfff9f9f9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Top Rated Compounds",
                              style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),

                            maxWidth>=1200?
                            GridView.builder(shrinkWrap: true,itemCount: propertyImage.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                                (crossAxisCount: 3,),
                              itemBuilder: (context,index){
                                return topRatedCompound(context,index,maxWidth);
                              }):
                                maxWidth>=900?
                                    GridView.builder(shrinkWrap: true,itemCount:  propertyImage.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                                      (crossAxisCount: 2,),
                                    itemBuilder: (context,index){
                                      return topRatedCompound(context,index,maxWidth);
                                    }):
                                maxWidth>=500?
                                GridView.builder(shrinkWrap: true,itemCount:  propertyImage.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                                      (crossAxisCount: 1,),
                                    itemBuilder: (context,index){
                                      return topRatedCompound(context,index,maxWidth);
                                    }):
                                GridView.builder(shrinkWrap: true,itemCount:  propertyImage.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                                      (crossAxisCount: 1,),
                                    itemBuilder: (context,index){
                                      return topRatedCompound(context,index,maxWidth);
                                    })

                          ],
                        ),
                      ),


                      //recommmendedproperty



                      Container(
                        width: maxWidth,
                        padding:   maxWidth >= 700? EdgeInsets.only(left: 60,right:60,top: 20,bottom: 10):
                        EdgeInsets.all(20),
                        color:Color(0xfff9f9f9),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Recommended Compounds",
                              style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                            SizedBox(height: 20,),
                            SizedBox(
                              width: maxWidth,height: 500,
                              child: ListView.builder(
                                shrinkWrap: true,itemCount: 5,
                                scrollDirection:Axis.horizontal,
                                itemBuilder: (context,index){
                                  return recommendedProperty(context,maxWidth,index);
                                },),
                            )
                          ],
                        ),
                      ),




                      // Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     height: 1,
                      //     decoration: BoxDecoration(boxShadow: [
                      //       BoxShadow(
                      //           color: const Color(0x40000000),
                      //           offset: Offset(0, 4),
                      //           blurRadius: 4,
                      //           spreadRadius: 0)
                      //     ], color: const Color(0x4d000000))),

                      SizedBox(
                        height: 30,
                      ),

                      FooterWidget()



                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget optionMenu(context) {
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
          child: Text(
            "Revue",
            style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontFamily: "Montserrat",
                fontStyle: FontStyle.normal,
                fontSize: 40.0),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
          child: InkWell(
            onHover: (value) {},
            onTap: () {
              setState(() {
                showOverlay = !showOverlay;
                if (showOverlay == true) {
                  showIndicator(context);
                } else {
                  hideIndicator(context);
                }
              });
            },
            child: Row(
              children: [
                Text(
                  "Find Property",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0),
                ),
                Icon(CupertinoIcons.chevron_down)
              ],
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
          child: FlatButton(
            onPressed: () {},
            focusColor: Colors.yellow,
            child: Row(
              children: [
                Text(
                  "Find Property by Owner",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0),
                ),
                Icon(CupertinoIcons.chevron_down)
              ],
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 10, right: 50),
              child: InkWell(
                onHover: (value) {
                  setState(() {
                    signUp = value;
                  });
                },
                onTap: () {
                  return showDialog(
                      context: context,
                      builder: (BuildContext b) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          insetPadding: EdgeInsets.all(20),
                          contentPadding: EdgeInsets.zero,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          content: SignUp(),
                        );
                      });
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: signUp ? ColorClass.redColor : Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buttonWidget(context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 40,
            width: 350,
            margin: EdgeInsets.only(top: 10, bottom: 5),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: ColorClass.blueColor
                ),
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.facebookSquare,
                  size: 20,
                  color: Colors.white,
                ),
                label: Text("Continue with Facebook",
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            height: 40,
            width: 350,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: Colors.white
                ),
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.google,
                  size: 20,
                  color: Colors.red,
                ),
                label: Text("Continue with Google",
                    style: TextStyle(
                        color: ColorClass.redColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.left)),
          ),

          SizedBox(
            height: 60,
          ),

          Container(
            height: 50,
            width: 350,
            margin: EdgeInsets.only(top: 20, bottom: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/textfieldbg.png")),
            ),
            child: Theme(
              child: TextField(
                cursorColor: ColorClass.lightTextColor,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    suffixIcon: Icon(CupertinoIcons.mail_solid),
                    contentPadding:
                        EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    hintText: "Enter Email",
                    hintStyle: TextStyle(
                      color: Color(0x7f3c2f47),
                      fontSize: 15,
                      fontFamily: 'Mulish',
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.white),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Mulish',
                ),
              ),
              data: Theme.of(context).copyWith(
                primaryColor: ColorClass.redColor,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 350,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/textfieldbg.png")),
            ),
            child: Theme(
              child: TextField(
                cursorColor: ColorClass.lightTextColor,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    suffixIcon: Icon(CupertinoIcons.lock_fill),
                    contentPadding:
                        EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: Color(0x7f3c2f47),
                      fontSize: 15,
                      fontFamily: 'Mulish',
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.white),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Mulish',
                ),
              ),
              data: Theme.of(context).copyWith(
                primaryColor: ColorClass.redColor,
              ),
            ),
          ),
          // Forget password?
          Container(
            width: 350,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, forgetPassword);
              },
              child: Text("Forget password?",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.end),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            height: 40,
            width: 350,
            alignment: Alignment.center,
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                elevation: 3,
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),),

                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>CompoundList()));
                  Navigator.pushNamed(context, MainscreenRoute);
                },
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      alignment: Alignment.center,
                      child: Text("Continue with Email",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget drawerItems(BuildContext context, bool Status) {
    return Container(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: new BoxDecoration(color: Colors.white),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/revue.png",
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width - 200,
                height: 200,
              ),
            ),
          ),
          ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                print("home");
              }),
          ListTile(
              title: Text("Find Property"),
              onTap: () {
                Navigator.pop(context);
                print("booking");
              }),
          ListTile(
              title: Text("Find Property by Owner"),
              onTap: () {
                Navigator.pop(context);
                print("profile");
              }),
          ListTile(
              title: Text("Sign Up"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, signup);
              }),
        ],
      ),
    );
  }


  Widget topRatedCompound(BuildContext context,int index,double width){
    bool maxwidth = width>=500;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,compoundDetails);
            },
            child: Container(
              width:maxwidth?350:width,
              // cursor: SystemMouseCursors.click,
              height:maxwidth? 370:320,
              // hoverHeight:maxwidth? 380:null,
              // hoverWidth:maxwidth? 350:null,
              color: Colors.white,
              // hoverColor: Colors.white,
              foregroundDecoration:BoxDecoration(
                  border: Border.all(color: Colors.black12)
              ),
              child:
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      propertyImage[index],
                      fit: BoxFit.fill,height: maxwidth?200:100,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Duet MediaCityUK, M50.',
                          style:TextStyle(
                              color:  const Color(0xff000000),
                              fontFamily: "Mulish",wordSpacing: 2,
                              decorationStyle: TextDecorationStyle.solid,
                              fontStyle:  FontStyle.normal,
                              fontSize: maxwidth?20.0:16,fontWeight: FontWeight.w400
                          ) ,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Southwest apartments, Green community West,Green Community,Dubai",
                          style:  TextStyle(
                              color:Colors.black54,
                              fontWeight: FontWeight.w400,
                              decorationStyle: TextDecorationStyle.solid,
                              fontFamily: "Mulish",
                              fontStyle: FontStyle.normal,
                              fontSize: maxwidth?15.0:13),),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GFRating(
                            size: maxwidth?20:15,
                            value: 4.3,
                            color: Colors.yellow,
                            borderColor: Colors.black12,
                            onChanged: (value) {
                              setState(() {

                              });
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                    "4.85",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Mulish",
                                        fontStyle:  FontStyle.normal,
                                        fontSize:maxwidth? 16.0:13
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                Text(
                                    " (54 reviews)",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Mulish",
                                        fontStyle:  FontStyle.normal,
                                        fontSize:maxwidth? 16.0:13
                                    ),
                                    textAlign: TextAlign.left
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),

                    ],)


                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget recommendedProperty(BuildContext context,double width,int index){
    bool maxwidth = width>700;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,compoundDetails);
            },
            child: HoverContainer(
              width: maxwidth?300:width,
              cursor: SystemMouseCursors.click,
              height: maxwidth?350:220,
              hoverHeight:maxwidth? 370:null,
              hoverWidth:maxwidth? 305:null,
              color: Colors.white,
              hoverColor: Colors.white,
              margin: EdgeInsets.all(10),
              foregroundDecoration:BoxDecoration(
                  border: Border.all(color: Colors.black12)
              ),
              child:
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                     propertyImage[index],
                      fit: BoxFit.fill,height: maxwidth?200:100,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Duet MediaCityUK, M50.',
                          style:TextStyle(
                              color:  const Color(0xff000000),
                              fontFamily: "Mulish",wordSpacing: 2,
                              decorationStyle: TextDecorationStyle.solid,
                              fontStyle:  FontStyle.normal,
                              fontSize: maxwidth?20.0:16,fontWeight: FontWeight.w400
                          ) ,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Southwest apartments, Green community West,Green Community,Dubai",
                          style:  TextStyle(
                              color:Colors.black54,
                              fontWeight: FontWeight.w400,
                              decorationStyle: TextDecorationStyle.solid,
                              fontFamily: "Mulish",
                              fontStyle: FontStyle.normal,
                              fontSize: maxwidth?15.0:13),),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GFRating(
                            size: maxwidth?20:15,
                            value: 4.3,
                            color: Colors.yellow,
                            borderColor: Colors.black12,
                            onChanged: (value) {
                              setState(() {

                              });
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                    "4.85",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Mulish",
                                        fontStyle:  FontStyle.normal,
                                        fontSize:maxwidth? 16.0:13
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                Text(
                                    " (54 reviews)",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Mulish",
                                        fontStyle:  FontStyle.normal,
                                        fontSize:maxwidth? 16.0:13
                                    ),
                                    textAlign: TextAlign.left
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),

                    ],)


                ],
              ),
            ),
          )
        ],
      ),
    );
  }



}

