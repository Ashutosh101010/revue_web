import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrevue/AppBar/popupmenu.dart';
import 'package:webrevue/LoginDashboard/widgets/social_media_login.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/LoginDashboard/LoginScreen.dart';
import 'package:webrevue/route/routing_constant.dart';


GlobalKey<AppBarSecState> MainAppBarKey=GlobalKey();
class AppBarSec extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
  return AppBarSecState();
  }

  AppBarSec({Key key}):super(key: key);
}

class AppBarSecState extends State<AppBarSec>{
  bool aboutHover = false;
  bool blogHover = false;
  bool filterHover = false;
  bool profileHover = false;
  bool searchHover = false;
  var optionMenuSelected;



  // showPopupMenu(Offset offset) async {
  //   double left = offset.dx;
  //   double top = offset.dy;
  //   await showMenu<String>(
  //     context: context,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  //     color: ColorClass.blueColor,
  //     position: RelativeRect.fromLTRB(left, top, left+1, top+2),
  //     items: [
  //       PopupMenuItem(child:
  //       Text("My Account",textAlign: TextAlign.center,
  //         style: TextStyle(color: Colors.white,),),value: '1',),
  //       PopupMenuDivider(),
  //       PopupMenuItem(child:
  //       Text("Favourites",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),value: '2',),
  //       PopupMenuDivider(),
  //       PopupMenuItem(child:
  //       Text("My Reviews",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),value: '3',),
  //       PopupMenuDivider(),
  //       PopupMenuItem(
  //         child: Container(alignment: Alignment.center,child: Text("Logout",
  //           textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),))
  //         ,value: '4',)
  //     ],
  //     elevation: 8.0,
  //   ).then<void>((String itemSelected) {
  //     if (itemSelected == null) return;
  //
  //     if(itemSelected == "1"){
  //
  //     }else if(itemSelected == "2"){
  //       Navigator.pushNamed(context, myFavourite);
  //     }else if(itemSelected == "3"){
  //       Navigator.pushNamed(context, myreviews);
  //
  //     }else if(itemSelected == "4"){
  //       googleSignIn.signOut();
  //      clearSharedPreferences();
  //      window.localStorage.clear();
  //      Navigator.of(context).pushNamedAndRemoveUntil(initialroute,
  //              (Route<dynamic> route) => false);
  //     }
  //
  //   });
  // }
  //
  // void clearSharedPreferences()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  // }


  @override
  Widget build(BuildContext context) {
   return AppBar(
     toolbarHeight: 100,
     automaticallyImplyLeading: false,
     elevation: 1,
     backgroundColor: Color(0xfff9f9f9),
     actions:<Widget> [
       Expanded(
         child: Align(
           alignment: Alignment.centerLeft,
           child: Padding(
             padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
             child: InkWell(
               onTap: (){
                 Navigator.pushReplacementNamed(context,mainscreenRoute);
               },
               child: Image.asset(
                 "assets/images/revue.png",
                 fit: BoxFit.cover,
               ),
             ),
           ),
         ),
       ),
       Align(
         alignment: Alignment.centerRight,
         child: Row(
           children: [
             MouseRegion(
               cursor: SystemMouseCursors.click,
               child: GestureDetector(
                 onTap: (){},
                 child: Padding(
                   padding: const EdgeInsets.only(
                       left: 20, right: 20, top: 10, bottom: 10),
                   child: // About us
                   Text(
                       "About us",
                       style:  TextStyle(
                           color:  Color(0x99000000),
                           fontWeight: FontWeight.w600,
                           fontStyle:  FontStyle.normal,
                           fontSize: 15.0
                       ),
                       textAlign: TextAlign.left
                   )
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(
                   left: 20, right: 10, top: 10, bottom: 10),
               child: MouseRegion(
                 cursor: SystemMouseCursors.click,
                 child: GestureDetector(
                   onTap: (){
                     showSearchDialog(context);
                   },
                   child: Container(
                     height: 40,width: 160,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                     color: Colors.white,
                         border: Border.all(
                             color: const Color(0xcc156fc2),
                             width: 2
                         )),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                               "Search",
                               style:  TextStyle(
                                  color: Color(0x99000000),
                                   fontWeight: FontWeight.w500,
                                   fontStyle:  FontStyle.normal,
                                   fontSize: 15.0
                               ),
                               textAlign: TextAlign.left
                           ),
                           Icon(Icons.search,color: const Color(0xcc156fc2,),size: 20,)
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
             ),
             // Container(height: 80,
             //     alignment: Alignment.center,
             //     margin: EdgeInsets.only(right: 8,top: 5, bottom: 5),
             //     child: MouseRegion(
             //       cursor: SystemMouseCursors.click,
             //       child: GestureDetector(
             //         behavior: HitTestBehavior.translucent,onTap: (){},
             //         child: Column(
             //           mainAxisAlignment: MainAxisAlignment.center,
             //           children: [
             //             Image.asset("assets/images/filter.png",width: 20,height: 20,fit: BoxFit.contain,),
             //             Padding(
             //                 padding: const EdgeInsets.only(top: 5),
             //                 child: // Profile
             //                 Text(
             //                     "Filter",
             //                     style:  TextStyle(
             //                         color:  Color(0x99000000),
             //                         fontWeight: FontWeight.w600,
             //                         fontStyle:  FontStyle.normal,
             //                         fontSize: 12.0
             //                     ),
             //                     textAlign: TextAlign.left
             //                 )
             //             ),
             //           ],),
             //       ),
             //     )),


             Container(height: 80,
                 alignment: Alignment.center,
                 margin: EdgeInsets.only(
                   left: 20, right: 50,top: 5, ),
                 child: MouseRegion(
                   cursor: SystemMouseCursors.click,
                   child: GestureDetector(
                     behavior: HitTestBehavior.translucent,
                     onTapDown: (TapDownDetails details){
                       showPopupMenu(details.globalPosition,context);
                     },
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Image.asset("assets/images/Profile.png",width: 20,height: 20,fit: BoxFit.contain,),
                         Padding(
                           padding: const EdgeInsets.only(top: 5),
                           child: // Profile
                           Text(
                               "Profile",
                               style: const TextStyle(
                                   color:  Colors.red,
                                   fontWeight: FontWeight.w600,
                                   fontStyle:  FontStyle.normal,
                                   fontSize: 14.0
                               ),
                               textAlign: TextAlign.left
                           )
                         ),
                       ],),
                   ),
                 )),

           ],
         ),
       ),
     ],
   );
  }




  showSearchDialog(BuildContext context){
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      animationType: DialogTransitionType.slideFromTopFade,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
              color: Colors.white,

              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                decoration:BoxDecoration(color: Colors.white,
                  border: Border.all(color: Colors.black12),),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(alignment: Alignment.topRight,child: Padding(
                        padding: const EdgeInsets.only(right: 50,top: 5,bottom: 5,),
                        child: IconButton(
                          icon: Icon(Icons.clear,color: ColorClass.blueColor,),onPressed: (){
                          Navigator.pop(context);
                        },
                        ),
                      )),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 40,top: 10),
                    //   child:searchWidget(),
                    // ),
                  ],
                ),
              )
          ),
        );
      },

    );
  }

}