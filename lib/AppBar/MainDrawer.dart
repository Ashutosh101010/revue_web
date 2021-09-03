import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:webrevue/AppBar/popupmenu.dart';
import 'package:webrevue/LoginDashboard/widgets/social_media_login.dart';
import 'package:webrevue/main.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/Webservice.dart';

class MainDrawer extends StatelessWidget{
  BuildContext context;

  MainDrawer(this.context);

  @override
  Widget build(context) {
  return Container(
    child: ListView(children: [
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
          hoverColor: Colors.grey.shade200,
          onTap: () {


            Navigator.pop(context);
            Navigator.popAndPushNamed(context, mainscreenRoute,);
            Navigator.of(context).pushNamedAndRemoveUntil(
                mainscreenRoute, (Route<dynamic> route)=>false);
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

     loggedIn?
     ListTile(
         title: Text(" Log Out"),
         onTap: () {
try{
  Webservice.logOut();

  FacebookAuth.instance.logOut();
  googleSignIn.signOut();
  clearSharedPreferences();
  window.localStorage.clear();
  Navigator.pop(context);
 window.location.reload();
}catch(e){
  print(e);
  Navigator.pop(context);
}


         }):ListTile(
         title: Text("Sign Up"),
         onTap: () {
           Navigator.pop(context);
           Navigator.pushNamed(context, signup);
         }),


    ],),
  );
  }
}