import 'package:flutter/material.dart';
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
                      child: Text(

                          "Floor Plan (sqft)",
                          style:  TextStyle(
                              color:Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontStyle:  FontStyle.normal,
                              fontSize: 14.0
                          ),
                          textAlign: TextAlign.left
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color(0x33000000), width: 1)),
                      child: TextField(textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        controller: floorPlanController,
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
                        ),),
                    ),
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
                      child: Text(
                          "Rent",
                          style: const TextStyle(
                              color:  Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontStyle:  FontStyle.normal,
                              fontSize: 14.0
                          ),
                          textAlign: TextAlign.left
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color(0x33000000), width: 1)),
                      child: TextField(textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: rentController,
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
                        ),),
                    ),
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
                      child: Text(
                          "BedRooms",
                          style: TextStyle(
                              color:Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontStyle:  FontStyle.normal,
                              fontSize: 14.0
                          ),
                          textAlign: TextAlign.left
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color(0x33000000), width: 1)),
                      child: TextField(textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        controller: bedroomController,
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
                        ),),
                    ),
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
                      child: Text(
                          "Bathrooms",
                          style: TextStyle(
                              color:Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontStyle:  FontStyle.normal,
                              fontSize: 14.0
                          ),
                          textAlign: TextAlign.left
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Color(0x33000000), width: 1)),
                      child: TextField(textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        controller: bathroomController,
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
                        ),),
                    ),
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