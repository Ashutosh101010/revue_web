import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webrevue/add_review/custom_textfield.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/model/ReviewModal.dart';

class AddReviewFirstForm extends StatefulWidget{
  AddReviewFirstForm({Key key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
   return AddReviewFirstFormState();
  }
}

class AddReviewFirstFormState extends State<AddReviewFirstForm>{


  TextEditingController floorPlanController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomController = TextEditingController();
  ReviewModal reviewModal;
  bool flooplanvalidate = false;
  bool rentvalidate=false;
bool bedroomvalidate=false;
bool bathroomvalidate=false;

//  String numberValidator(String value) {
  //  if(value == null) {
    //  return null;
   // }
//    final n = num.tryParse(value);
  //  if(n == null) {
    //  return '"$value" is not a valid number';
   // }
  //  return null;
 // }

  @override
  void initState() {
    super.initState();
    reviewModal  = new ReviewModal();
  }

  @override
  Widget build(BuildContext context) {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      Padding(
        padding: const EdgeInsets.only(top: 30,bottom: 20,),
        child: Text(
            "Your Review",
            style: TextStyle(
                color:  Colors.black87,
                fontWeight: FontWeight.w700,
                fontStyle:  FontStyle.normal,
                fontSize: 20.0
            ),
            textAlign: TextAlign.left
        ),
      ),
      //Your Review
      Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.black12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Name
                    Padding(
                      padding: EdgeInsets.only(top: 5,bottom: 5),
                      child: CustomTextField(withAsterisk: true,label:  "Floor Plan (sqft)",)
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color(0x33000000), width: 1)),
                      child: TextFormField(keyboardType: TextInputType.number,
                     //   validator: numberValidator,
                        onChanged: (value){
                        setState(() {
                          flooplanvalidate=false;
                        });
                      },
                        textInputAction: TextInputAction.next,
                      //  keyboardType: TextInputType.text,
                        controller: floorPlanController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                            hintText: "Enter floor plan",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 15),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),

                            fillColor: Colors.white
                        ),
                      ),
                      ),
                    Text(flooplanvalidate?'please enter floor plan':"",
                      style: TextStyle(color: Colors.red),),


                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Name
                    Padding(
                      padding: EdgeInsets.only(top: 5,bottom: 5),
                      child: CustomTextField(label: "Rent",withAsterisk: true,)
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color(0x33000000), width: 1)),
                      child: TextFormField(textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        controller: rentController,onChanged: (value){
                        setState(() {
                          rentvalidate=false;
                        });
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15),
                            hintText: "Enter Rent",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),

                            fillColor: Colors.white
                        ),

                      ),
                    ),
                    Text(rentvalidate?'please enter rent':"",
                      style: TextStyle(color: Colors.red),),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Name
                    Padding(
                      padding: EdgeInsets.only(top: 5,bottom: 5),
                      child: CustomTextField(label: "BedRooms",withAsterisk: true,)
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color(0x33000000), width: 1)),
                      child: TextFormField(textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.text,
                        controller: bedroomController,onChanged: (value){
                        setState(() {
                          bedroomvalidate=false;
                        });
                        },
                        decoration: InputDecoration(
                            hintText: "Enter number of BedRooms",
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.only(left: 15),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: Color(0x66000000)),
                            // ),
                            fillColor: Colors.white
                        ),
                        ),

                    ),
                    Text(bedroomvalidate?'please enter something':"",
                      style: TextStyle(color: Colors.red),),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Name
                    Padding(
                      padding: EdgeInsets.only(top: 5,bottom: 5),
                      child: CustomTextField(withAsterisk: true,label: "Bathrooms",)
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color(0x33000000), width: 1)),
                      child: TextFormField(textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.text,
                        controller: bathroomController,
                        onChanged: (value){
                        setState(() {
                          bathroomvalidate=false;
                        });

                        },
                        decoration: InputDecoration(
                            hintText: "Enter number of Bathrooms",
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.only(left: 15),
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: Color(0x66000000)),
                            // ),
                            fillColor: Colors.white
                        ),

                      ),
                    ),
                    Text(bathroomvalidate?'please enter something':"",
                      style: TextStyle(color: Colors.red),),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),


    ],),
  );
  }




  bool validate(){
    return rentController.text.isNotEmpty
        &&floorPlanController.text.isNotEmpty
    &&bathroomController.text.isNotEmpty
    &&bedroomController.text.isNotEmpty;
  }





}