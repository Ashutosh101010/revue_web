import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/service/Webservice.dart';

class SocialMediaLogins extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Column(children: [
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
           onPressed: () {

             Webservice.dummyApiCall();


           },
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

   ],);
  }

}