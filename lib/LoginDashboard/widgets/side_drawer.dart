import 'package:flutter/material.dart';
import 'package:webrevue/route/routing_constant.dart';

class SideDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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




}