import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webrevue/LoginScreen.dart';
import 'package:webrevue/route/router.dart' as router;
import 'ColorClass.dart';
import 'route/routing_constant.dart';

void main() {

  runApp(MyApp());
  print(GoogleFonts.muli().fontFamily);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Revue',
        initialRoute:initialroute,
        navigatorKey: navKey,
        onGenerateRoute:router.generateRoute,
      theme: ThemeData(pageTransitionsTheme: NoTransitionsOnWeb(),fontFamily: GoogleFonts.muli().fontFamily,
        bottomSheetTheme: Theme.of(context).bottomSheetTheme,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:LoginScreen()
    );
  }
}


// class Demoo extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//    return DemooState();
//   }
// }
//
// class DemooState extends State<Demoo>{
//   @override
//   Widget build(BuildContext context) {
//     double maxWidth = MediaQuery.of(context).size.width;
//     double maxheight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Column(children: [
//         Expanded(
//           child: SingleChildScrollView(
//             child: Column(children: [
//               maxWidth>=1300?
//                   Row(children: [
//                     leftSide(maxWidth/2),
//                     rightSide(maxWidth/3)
//                   ],):
//                   maxWidth>=1000?
//                   Row(children: [
//                     leftSide(maxWidth/2),
//                     rightSide(maxWidth/3)
//                   ],):
//                       leftSide(maxWidth)
//
//             ],),
//           ),
//         )
//       ],),
//     );
//   }
//
//   List propertyImage = [
//     "assets/images/houseFirst.png",
//     "assets/images/houseSec.png",
//     "assets/images/houseThird.png",
//     "assets/images/houseForth.png",
//   ];
//
//
//
//   Widget leftSide(double width){
//     print("leftside"+width.toString());
//     return Container(
//       width:width,alignment: Alignment.topCenter,
//       margin: width>=700?EdgeInsets.only(right: 40):EdgeInsets.all(10),
//       child: ListView.builder(
//           itemCount: propertyImage.length,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context,index){
//             return SingleChildScrollView(
//               scrollDirection: width<700? Axis.horizontal:Axis.horizontal,
//               physics: width>700?AlwaysScrollableScrollPhysics():null,
//               child: Column(
//                 children: [
//                   Container(
//                     width:width,
//                     height: width>=700? 230: width>=400?230:230,
//                     margin: EdgeInsets.only(top: 10),
//                     decoration: BoxDecoration(color: Colors.white,),
//                     child: Row(
//                       children: [
//                         Container(
//                           width:width/2,
//                           alignment: Alignment.topCenter,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.min, children: [
//                             Container(
//                               height: 100,
//                               width: width/2,  margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5), image: DecorationImage(
//                                 image: AssetImage(
//                                     propertyImage[index]),
//                                 fit: BoxFit.cover,
//                               )),
//                             ),
//
//                             width>=600?
//                             SizedBox(
//                               width:width/2,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     height: 75,
//                                     width:160,
//                                     margin: EdgeInsets.only(left: 5,right: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius:BorderRadius.circular(5), image: DecorationImage(
//                                       image: AssetImage(
//                                           propertyImage[index]),
//                                       fit: BoxFit.cover,
//                                     )),
//                                   ),
//                                   Container(
//                                     height: 75,
//                                     width:160,
//                                     margin: EdgeInsets.only(left: 5,right: 5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(5), image: DecorationImage(
//                                       image: AssetImage(
//                                           propertyImage[index]),
//                                       fit: BoxFit.cover,
//                                     )),
//                                   ),
//                                 ],
//                               ),
//                             ):Container()
//                           ],),
//                         ),
//                         Container(
//                           width: width/2,alignment: Alignment.topCenter,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               // assets/images/userLocation.png
//                               SizedBox(width: width/2,
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     // Trishla Villa
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 8),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           AutoSizeText(
//                                              "Trishla villa".toUpperCase(),
//                                               style: const TextStyle(
//                                                   color:  const Color(0xff000000),
//                                                   fontWeight: FontWeight.w500,
//                                                   fontFamily: "Mulish",
//                                                   fontStyle:  FontStyle.normal,
//                                                   fontSize: 17.0
//                                               ),
//                                               textAlign: TextAlign.left
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(top: 5),
//                                             child: AutoSizeText(
//                                                 "Address: ",
//                                                 style: TextStyle(
//                                                     color:Colors.black54,
//                                                     fontWeight: FontWeight.w600,
//                                                     fontFamily: "Mulish",
//                                                     fontStyle:  FontStyle.normal,
//                                                     fontSize: 13.0
//                                                 ),
//                                                 textAlign: TextAlign.left
//                                             ),
//                                           ),
//
//                                         ],
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 8,right: 8),
//                                       child: CircularPercentIndicator(
//                                         radius: width>=600?38.0:25,
//                                         lineWidth:width>=600? 4.0:2.0,
//                                         backgroundColor: Colors.black26,
//                                         percent: 0.5,
//                                         center: new Text(
//                                           "3.5",
//                                           style: new TextStyle(
//                                               fontWeight: FontWeight.bold, fontSize: 12.0),
//                                         ),
//                                         circularStrokeCap: CircularStrokeCap.butt,
//                                         progressColor: Colors.red,
//                                         footer: AutoSizeText("54 Reviews",
//                                             style:  TextStyle(
//                                                 color:Colors.black,
//                                                 decorationStyle: TextDecorationStyle.solid,
//                                                 fontStyle: FontStyle.normal,
//                                                 fontSize: 13.0),
//                                             textAlign:
//                                             TextAlign.left),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 8,right: 8),
//                                 child: AutoSizeText(
//                                     "Southwest apartments, Green community West,Green Community,Dubai",
//                                     style:  TextStyle(
//                                         color:Colors.black,
//                                         decorationStyle: TextDecorationStyle.solid,
//                                         fontWeight: FontWeight.w600,
//                                         fontFamily: "Mulish",
//                                         fontStyle: FontStyle.normal,
//                                         fontSize: 13.0),
//                                     textAlign: TextAlign.left),
//                               ),
//
//                               ratingBar(context,width),
//
//                               // width>=600?
//                               // ratingBar(context):Container(),
//
//
//                               // Container(
//                               //   width: width,height: 60,
//                               //     margin: EdgeInsets.only(left: 8,right: 8,top: 5,bottom: 5),
//                               //     child:
//                               //     width>=600?
//                               //     ListView.builder(
//                               //       itemCount: ratingValue.length,
//                               //         physics: NeverScrollableScrollPhysics(),
//                               //         shrinkWrap: true,
//                               //         scrollDirection: Axis.horizontal,
//                               //         itemBuilder: (context,ind){
//                               //           return Padding(
//                               //            padding: EdgeInsets.only(left: 5,right: 5),
//                               //             child: CircularPercentIndicator(
//                               //               radius: 38,
//                               //               lineWidth:4.0,
//                               //               backgroundColor: Colors.black26,
//                               //               percent: ratingValue[ind],
//                               //               center: new Text(
//                               //                 "3.6",
//                               //                 style: new TextStyle(
//                               //                     fontWeight:
//                               //                     FontWeight.bold,
//                               //                     fontSize: 12.0),
//                               //               ),
//                               //               circularStrokeCap: CircularStrokeCap.butt,
//                               //               progressColor: colorList[index],
//                               //               footer:AutoSizeText(ratingName[ind].toString().toUpperCase(),
//                               //                   style: const TextStyle(
//                               //                       color:Colors.black,
//                               //                       fontWeight: FontWeight.w400,
//                               //                       decorationStyle: TextDecorationStyle.solid,
//                               //                       fontFamily: "Mulish",
//                               //                       fontStyle: FontStyle.normal,
//                               //                       fontSize: 12.0,letterSpacing: 1),
//                               //                   textAlign: TextAlign.left) ,
//                               //             ),
//                               //           );
//                               //
//                               //
//                               //         }):
//                               //         GridView.builder(
//                               //           itemCount: ratingValue.length,
//                               //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                               //               crossAxisCount: 2
//                               //             ),
//                               //             itemBuilder: (context,ind){
//                               //               return Padding(
//                               //                 padding: EdgeInsets.only(left: 5,right: 5),
//                               //                 child: CircularPercentIndicator(
//                               //                   radius: 38,
//                               //                   lineWidth:4.0,
//                               //                   backgroundColor: Colors.black26,
//                               //                   percent: ratingValue[ind],
//                               //                   center: new Text(
//                               //                     "3.6",
//                               //                     style: new TextStyle(
//                               //                         fontWeight:
//                               //                         FontWeight.bold,
//                               //                         fontSize: 12.0),
//                               //                   ),
//                               //                   circularStrokeCap: CircularStrokeCap.butt,
//                               //                   progressColor: colorList[index],
//                               //                   footer:AutoSizeText(ratingName[ind].toString().toUpperCase(),
//                               //                       style: const TextStyle(
//                               //                           color:Colors.black,
//                               //                           fontWeight: FontWeight.w400,
//                               //                           decorationStyle: TextDecorationStyle.solid,
//                               //                           fontFamily: "Mulish",
//                               //                           fontStyle: FontStyle.normal,
//                               //                           fontSize: 12.0,letterSpacing: 1),
//                               //                       textAlign: TextAlign.left) ,
//                               //                 ),
//                               //               );
//                               //             })
//                               //    ),
//
//                               Container(
//                                 padding: EdgeInsets.only(left: 8,right: 10),
//                                 child: FittedBox(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Container(
//                                         child: Row(
//                                           children: [
//                                             Icon(CupertinoIcons.chat_bubble_2,color: Colors.black,size: 25,),
//                                             Padding(padding: const EdgeInsets.only(left: 8,right: 8,),
//                                               child: Text("Message",
//                                                   style: const TextStyle(
//                                                       color: const Color(0xff000000),
//                                                       fontWeight: FontWeight.w500,
//                                                       fontFamily: "Mulish",
//                                                       fontStyle: FontStyle.normal,
//                                                       fontSize: 14.0,letterSpacing: 1),
//                                                   textAlign: TextAlign.left),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       Container(
//                                         child: Row(
//                                           children: [
//                                             Icon(CupertinoIcons.heart,color: Colors.black,size: 25,),
//                                             Padding(padding: const EdgeInsets.only(left: 8,),
//                                               child: Text("Save",
//                                                   style: const TextStyle(
//                                                       color: const Color(0xff000000),
//                                                       fontWeight: FontWeight.w500,
//                                                       fontFamily: "Mulish",
//                                                       fontStyle: FontStyle.normal,
//                                                       fontSize: 14.0,letterSpacing: 1),
//                                                   textAlign: TextAlign.left),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//
//                               InkWell(
//                                 onTap: (){
//                                   Navigator.pushNamed(context, compoundDetails);
//                                   // Navigator.push(context,
//                                   //     MaterialPageRoute(builder: (context)=>CompoundDetails()));
//                                 },onHover: (value){
//                                 texthover[index] = value;
//                                 viewmore = value;
//                                 (context as Element).markNeedsBuild();
//                               },
//                                 child: Container(
//                                   margin: EdgeInsets.only(right: 10,top: 10),
//                                   width: width/2,alignment: Alignment.centerRight,
//                                   child: AutoSizeText("View more".toUpperCase(),
//                                       style: TextStyle(
//                                           color:
//                                           ColorClass.blueColor,
//                                           wordSpacing: 5,
//                                           fontWeight: FontWeight.w500,
//                                           fontFamily: "Mulish",
//                                           fontStyle: FontStyle.normal,
//                                           fontSize: 15.0),
//                                       textAlign: TextAlign.left),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),),
//                   Divider(color: Colors.black12,thickness: 1,height: 1,)
//                 ],
//               ),
//             );
//
//           }),
//
//     );
//   }
//
//   Widget rightSide(double width){
//     print("right side"+width.toString());
//     return  Container(
//       width: 300,alignment: Alignment.topCenter,
//       margin: width>=600?EdgeInsets.only(left: 50):EdgeInsets.all(10),
//       child: ListView(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         children: <Widget>[
//           Padding(
//             padding:EdgeInsets.only(left: 20,right: 20,bottom: 10),
//             child: Text(
//                 "Property nearby you",
//                 style: const TextStyle(
//                     color:  const Color(0xff000000),
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "Mulish",
//                     fontStyle:  FontStyle.normal,
//                     fontSize: 20.0
//                 ),
//                 textAlign: TextAlign.left
//             ),
//           ),
//           ListView.builder(
//             itemCount: 3,
//             shrinkWrap: true,
//             itemBuilder: (context,index){
//               return Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
//                 width: 300,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 170,width: 300,
//                       child: Align(
//                         alignment: Alignment.topRight,
//                         child: InkWell(
//                           onTap: (){},
//                           child: Container(
//                             width: 30,height: 30,
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,color: Colors.white,),
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Image.asset("assets/images/heart.png",
//                                 fit: BoxFit.contain,height: 20,width: 20,),
//                             ),
//                           ),
//                         ),),
//                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
//                           image: DecorationImage(
//                             image: AssetImage("assets/images/house.png"),
//                             fit: BoxFit.fill,)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 15,top: 5),
//                       child: Text(
//                           "The Trilogy, M15",
//                           style:  TextStyle(
//                               color:  Colors.black,
//                               fontFamily: "Mulish",
//                               fontWeight: FontWeight.w600,
//                               fontStyle:  FontStyle.normal,
//                               fontSize: 16.0
//                           ),
//                           textAlign: TextAlign.left
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 15,top: 5),
//                       child: Text(
//                           "More ‘Superenting’, Allsop Letting and Managementr",
//                           style:  TextStyle(
//                               color:  Colors.black,
//                               fontWeight: FontWeight.w500,
//                               fontFamily: "Mulish",
//                               fontStyle:  FontStyle.normal,
//                               fontSize: 15.0
//                           ),
//                           textAlign: TextAlign.left
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 15,top: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           GFRating(
//                             size: 20,
//                             value: 3.4,
//                             color: Colors.yellow,
//                             borderColor: Colors.yellow,
//                             onChanged: (value) {
//                               setState(() {
//
//                               });
//                             },
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 Text(
//                                     "4.85",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w700,
//                                         fontFamily: "Mulish",
//                                         fontStyle:  FontStyle.normal,
//                                         fontSize: 16.0
//                                     ),
//                                     textAlign: TextAlign.left
//                                 ),
//
//                                 Text(
//                                     " (54 reviews)",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontFamily: "Mulish",
//                                         fontStyle:  FontStyle.normal,
//                                         fontSize: 16.0
//                                     ),
//                                     textAlign: TextAlign.left
//                                 ),
//
//
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],),
//               );
//             },
//           ),
//
//         ],
//       ),
//     );
//   }
//
//
//
//   Widget ratingBar(BuildContext context,double rwidth){
//     return  Container(
//       width: rwidth,
//         margin: EdgeInsets.only(top: 5,bottom: 5),
//         child: FittedBox(
//           alignment: Alignment.centerLeft,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CircularPercentIndicator(
//                 radius: 38.0,
//                 lineWidth: 3.8,
//                 backgroundColor: Colors.black26,
//                 percent: 0.6,
//                 center: new Text(
//                   "3.6",
//                   style: new TextStyle(
//                       fontWeight:
//                       FontWeight.bold,
//                       fontSize: 12.0),
//                 ),
//                 circularStrokeCap: CircularStrokeCap.butt,
//                 progressColor: Colors.blue,
//                 footer:Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: AutoSizeText("Facilities".toUpperCase(),
//                       softWrap: true,
//                       style: const TextStyle(
//                           color:Colors.black,
//                           fontWeight: FontWeight.w400,
//                           decorationStyle: TextDecorationStyle.solid,
//                           fontFamily: "Mulish",
//                           fontStyle: FontStyle.normal,
//                           fontSize: 12.0,letterSpacing: 1),
//                       textAlign: TextAlign.left),
//                 ) ,
//               ),
//               CircularPercentIndicator(
//                 radius: 38.0,
//                 lineWidth: 3.8,
//                 backgroundColor: Colors.black26,
//                 percent: 0.3,
//                 center: new Text(
//                   "3.2",
//                   style: new TextStyle(
//                       fontWeight:
//                       FontWeight.bold,
//                       fontSize: 12.0),
//                 ),
//                 circularStrokeCap:
//                 CircularStrokeCap.butt,
//                 progressColor:
//                 Colors.redAccent,
//                 footer: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: AutoSizeText("Design".toUpperCase(),
//                       style:  TextStyle(
//                           color:Colors.black,
//                           fontWeight: FontWeight.w400,
//                           decorationStyle: TextDecorationStyle.solid,
//                           fontFamily: "Mulish",
//                           fontStyle: FontStyle.normal,
//                           fontSize: 12.0,letterSpacing: 1),
//                       textAlign: TextAlign.left),
//                 ),
//               ),
//               CircularPercentIndicator(
//                 radius: 38.0,
//                 lineWidth: 3.8,
//                 backgroundColor: Colors.black26,
//                 percent: 0.5,
//                 center: new Text("3.5",
//                   style: new TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 12.0),
//                 ),
//                 circularStrokeCap: CircularStrokeCap.butt,
//                 progressColor: Colors.green,
//                 footer: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: AutoSizeText("Location".toUpperCase(),
//                       style:  TextStyle(
//                           color:Colors.black,
//                           fontWeight: FontWeight.w400,
//                           decorationStyle: TextDecorationStyle.solid,
//                           fontFamily:
//                           "Mulish",
//                           fontStyle: FontStyle.normal,letterSpacing: 1,
//                           fontSize: 12.0),
//                       textAlign:
//                       TextAlign.left),
//                 ),
//               ),
//               CircularPercentIndicator(
//                 radius: 38.0,
//                 lineWidth: 3.8,
//                 backgroundColor: Colors.black26,
//                 percent: 0.5,
//                 center: new Text(
//                   "3.5",
//                   style: new TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 12.0),
//                 ),
//                 circularStrokeCap: CircularStrokeCap.butt,
//                 progressColor: Colors.yellow,
//                 footer: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: AutoSizeText("Management".toUpperCase(),
//                       style:  TextStyle(
//                           color:Colors.black,
//                           fontWeight: FontWeight.w400,
//                           decorationStyle: TextDecorationStyle.solid,
//                           fontStyle: FontStyle.normal,
//                           fontSize: 12.0,letterSpacing: 1),
//                       textAlign:
//                       TextAlign.left),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
//
//
//
//
//
//
//
// }


class NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}