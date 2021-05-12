import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColorClass.dart';


class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        height: 700,
        width: 420,     color: Colors.white,
        child: ListView(
          shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
         children: [
            // Create Account
            Align(alignment: Alignment.topRight,child: IconButton(
              icon: Icon(Icons.clear,color: Colors.black,),onPressed: (){
                Navigator.pop(context);
            },
            )),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20,bottom: 10),
              child: Text(
                  "Create Account",
                  style:  TextStyle(
                      color:  ColorClass.redColor,
                      fontWeight: FontWeight.w700,
                      fontStyle:  FontStyle.normal,
                      wordSpacing: 5,letterSpacing: 0.5,
                      fontSize: 25.0
                  ),
                  textAlign: TextAlign.left
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20,  top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Name
                        Text("First Name",
                            style:  TextStyle(
                                color: ColorClass.blueColor,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0x66000000)),
                                ),
                                fillColor: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,  top: 20
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Name
                        Text("Last Name",
                            style:  TextStyle(
                                color:ColorClass.blueColor,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.start),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0x66000000)),
                                ),
                                fillColor: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20,  top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Name
                  Text("Email Address",
                      style:  TextStyle(
                          color: ColorClass.blueColor,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                  TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0x66000000)),
                        ),
                        fillColor: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20,  top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Name
                  Text("Mobile No.",
                      style:  TextStyle(
                          color: ColorClass.blueColor ,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                  TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0x66000000)),
                        ),
                        fillColor: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20,  top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Name
                  Text("Password",
                      style:  TextStyle(
                          color:ColorClass.blueColor ,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                  TextField(
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0x66000000)),
                        ),
                        fillColor: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Name
                  Text("Confirm Password",
                      style: TextStyle(
                          color:ColorClass.blueColor ,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                  TextField(
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0x66000000)),
                        ),
                        fillColor: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
                width: 300,height: 40,
                margin: EdgeInsets.only(left: 40, right: 40, top: 40,bottom: 40),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  color: ColorClass.blueColor,
                  hoverColor: Colors.blue.shade900,
                  onPressed: (){},
                  child: Text(
                    "Sign Up",
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                  ),

                )),
          ],
        ),
      ),
    );
  }
}
