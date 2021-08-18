import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webrevue/LoginDashboard/widgets/login_dashboard.dart';
import 'package:webrevue/LoginDashboard/widgets/side_drawer.dart';
import 'package:webrevue/LoginDashboard/widgets/social_media_login.dart';

import '../constants/ColorClass.dart';
import '../SignUp.dart';
import '../footer/FooterWidget.dart';
import 'dart:html' as html;


class LoginScreen extends StatefulWidget {

 // String id;
 // LoginScreen( {this.id});
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

List favList = [];
class LoginScreenState extends State<LoginScreen> {


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
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
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
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0),
                                      textAlign: TextAlign.left),
                                ),
                                Text(
                                    "Millions of Property."
                                    " Search by what matters to you and find the one thats right for you.",
                                    style:  TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
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
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0),
                                      textAlign: TextAlign.left),
                                ),
                                Text(
                                    "Read anonymous reviews on over 600,000 Properties "
                                    "worldwide from the people that register there.",
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
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
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0,
                                      ),
                                      textAlign: TextAlign.left),
                                ),
                                Text(
                                    "Are you paid fairly? Get a free, personalised salary"
                                    " estimate and compare with millions of Property.",
                                    style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0,
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

  final sink = StreamController<double>();
  final pager = PageController();
  @override
  void initState() {
    super.initState();
    throttle(sink.stream).listen((offset) {
      pager.animateTo(
        offset,
        duration: Duration(milliseconds: 3000),
        curve: Curves.ease,
      );
    });



  }



  Stream<double> throttle(Stream<double> src) async* {
    double offset = pager.position.pixels;
    DateTime dt = DateTime.now();
    await for (var delta in src) {
      if (DateTime.now().difference(dt) > Duration(milliseconds: 3000)) {
        offset = pager.position.pixels;
      }
      dt = DateTime.now();
      offset += delta;
      yield offset;
    }}

  @override
  void dispose() {
    sink.close();
    pager.dispose();
    super.dispose();
  }


  onRefresh(){
    html.window.onBeforeUnload.listen((event) async{
      setState(() {

      });
    });
  }


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

      body: Listener(
        child: PageView(
          controller: pager,scrollDirection: Axis.vertical,
          children: [
            ListView(
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
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.center),
                      ),
                    ])),

                SizedBox(height: 20,),

                Divider(height: 1,thickness: 1,color:  Color(0x4d000000),),

                // Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: 1,
                //     color: const Color(0x4d000000)),


                //Top rated compound

                // Container(
                //   width: maxWidth,
                //   padding:   maxWidth >= 700? EdgeInsets.only(left: 60,right:60,top: 20,bottom: 10):
                //   EdgeInsets.all(20),
                //   color:Color(0xfff9f9f9),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text("Top Rated Compounds",
                //         style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                //
                //       maxWidth>=1200?
                //       GridView.builder(shrinkWrap: true,itemCount: propertyImage.length,
                //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                //           (crossAxisCount: 3,),
                //         itemBuilder: (context,index){
                //           return topRatedCompound(context,index,maxWidth);
                //         }):
                //           maxWidth>=900?
                //               GridView.builder(shrinkWrap: true,itemCount:  propertyImage.length,
                //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                //                 (crossAxisCount: 2,),
                //               itemBuilder: (context,index){
                //                 return topRatedCompound(context,index,maxWidth);
                //               }):
                //           maxWidth>=500?
                //           GridView.builder(shrinkWrap: true,itemCount:  propertyImage.length,
                //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                //                 (crossAxisCount: 1,),
                //               itemBuilder: (context,index){
                //                 return topRatedCompound(context,index,maxWidth);
                //               }):
                //           GridView.builder(shrinkWrap: true,itemCount:  propertyImage.length,
                //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                //                 (crossAxisCount: 1,),
                //               itemBuilder: (context,index){
                //                 return topRatedCompound(context,index,maxWidth);
                //               })
                //
                //     ],
                //   ),
                // ),


                //recommmendedproperty



                // Container(
                //   width: maxWidth,
                //   padding:   maxWidth >= 700? EdgeInsets.only(left: 60,right:60,top: 20,bottom: 10):
                //   EdgeInsets.all(20),
                //   color:Color(0xfff9f9f9),
                //
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text("Recommended Compounds",
                //         style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                //       SizedBox(height: 20,),
                //       SizedBox(
                //         width: maxWidth,height: 500,
                //         child: ListView.builder(
                //           shrinkWrap: true,itemCount: 5,
                //           scrollDirection:Axis.horizontal,
                //           itemBuilder: (context,index){
                //             return recommendedProperty(context,maxWidth,index);
                //           },),
                //       )
                //     ],
                //   ),
                // ),




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
                fontFamily: GoogleFonts.montserrat().fontFamily,
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
                      fontFamily: GoogleFonts.montserrat().fontFamily,
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
                          content: SignUp(context),
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

          SocialMediaLogins(),
          SizedBox(
            height: 60,
          ),

          LoginPage()
        ],
      ),
    );
  }

  Widget drawerItems(BuildContext context, bool Status) {
    return SideDrawer();
  }





}



