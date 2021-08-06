import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrevue/LoginDashboard/widgets/social_media_login.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/route/routing_constant.dart';

 showPopupMenu(Offset offset,BuildContext context) async {
  double left = offset.dx;
  double top = offset.dy;
  await showMenu<String>(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    color: ColorClass.blueColor,
    position: RelativeRect.fromLTRB(left, top, left+1, top+2),
    items: [
      PopupMenuItem(child:
      Text("My Account",textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white,),),value: '1',),
      PopupMenuDivider(),
      PopupMenuItem(child:
      Text("Favourites",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),value: '2',),
      PopupMenuDivider(),
      PopupMenuItem(child:
      Text("My Reviews",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),value: '3',),
      PopupMenuDivider(),
      PopupMenuItem(
        child: Container(alignment: Alignment.center,child: Text("Logout",
          textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),))
        ,value: '4',)
    ],
    elevation: 8.0,
  ).then<void>((String itemSelected) {
    if (itemSelected == null) return;

    if(itemSelected == "1"){

    }else if(itemSelected == "2"){
      Navigator.pushNamed(context, myFavourite);
    }else if(itemSelected == "3"){
      Navigator.pushNamed(context, myreviews);

    }else if(itemSelected == "4"){
      googleSignIn.signOut();
      clearSharedPreferences();
      window.localStorage.clear();
      Navigator.of(context).pushNamedAndRemoveUntil(initialroute,
              (Route<dynamic> route) => false);
    }

  });
}



void clearSharedPreferences()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}