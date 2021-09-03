import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/service/Webservice.dart';

import 'constants/ColorClass.dart';

class ContactusProperty extends StatefulWidget {
  BuildContext context;


  ContactusProperty(this.context);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactusPropertyState();
  }
}

class ContactusPropertyState extends State<ContactusProperty> {
  TextEditingController propertyName = new TextEditingController();
  TextEditingController propertyAddress = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        height: 700,
        width: 420, color: Colors.white,
        child: ListView(
          shrinkWrap: true, physics: AlwaysScrollableScrollPhysics(),
          children: [
            // Create Account
            Align(alignment: Alignment.topRight, child: IconButton(
              icon: Icon(Icons.clear, color: Colors.black,), onPressed: () {
              Navigator.pop(context);
            },
            )),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, bottom: 10),
              child: Text(
                  "Contact Us",
                  style: TextStyle(
                      color: ColorClass.redColor,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      wordSpacing: 5,
                      letterSpacing: 0.5,
                      fontSize: 25.0
                  ),
                  textAlign: TextAlign.left
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Name
                  Text("Property Name",
                      style: TextStyle(
                          color: ColorClass.blueColor,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: propertyName,


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
                  SizedBox(height: 10,),
                  Text("Property Address",
                      style: TextStyle(
                          color: ColorClass.blueColor,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    controller: propertyAddress,


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
                width: 300, height: 40,
                margin: EdgeInsets.only(
                    left: 40, right: 40, top: 40, bottom: 40),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  color: ColorClass.blueColor,
                  hoverColor: Colors.blue.shade900,
                  onPressed: () async {
                   await  Webservice.addPropertyRequest(propertyName.text, propertyAddress.text, context);

                    Navigator.of(context).pop();

                  },
                  child: Text(
                    "Submit",
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