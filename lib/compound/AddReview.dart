

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:webrevue/AppBar/AppBarSec.dart';
import 'package:webrevue/footer/FooterWidget.dart';
import 'package:webrevue/route/routing_constant.dart';


import '../ColorClass.dart';

class AddReview extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return AddReviewState();
  }
}

class AddReviewState extends State<AddReview>{

  List<Widget> textfieldListPros = <Widget>[];
  List<Widget> textfieldListCons = <Widget>[];
  double facilitiesRating = 0;
  double valueRating = 0;
  double managementRating = 0;
  double designRating = 0;
  double locationRating = 0;
  bool checkBox = false;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();


  showStartDatePickerWidget(){
    return showCupertinoModalPopup(
        context: context,
        builder:  (BuildContext builder){
          return Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: CupertinoDatePicker(
                backgroundColor: Colors.black,
                initialDateTime: DateTime.now().subtract(Duration(hours: 1)),
                onDateTimeChanged: (DateTime newdate) {
                  print(newdate);
                  var formatter = new DateFormat('dd/MM/yyyy');
                  // String formattedTime = DateFormat('kk:mm:a').format(newdate);
                  String formattedDate = formatter.format(newdate);
                  // print(formattedTime);
                  print(formattedDate);
                  setState(() {
                    startDateController.text=formattedDate;
                  });
                },

                use24hFormat: false,
                maximumDate: new DateTime(2050, 12, 31),
                minimumYear: 2010,
                maximumYear: 2040,
                minuteInterval: 1,
                mode: CupertinoDatePickerMode.date,
              )
          );
        }
    );
  }

  showEndDatePickerWidget(){
    return showCupertinoModalPopup(
        context: context,
        builder:  (BuildContext builder){
          return Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: CupertinoDatePicker(
                backgroundColor: Colors.black,
                initialDateTime: DateTime.now().subtract(Duration(hours: 1)),
                onDateTimeChanged: (DateTime newdate) {
                  print(newdate);
                  var formatter = new DateFormat('MM/dd/yyyy');
                  String formattedTime = DateFormat('kk:mm:a').format(newdate);
                  String formattedDate = formatter.format(newdate);
                  print(formattedTime);
                  print(formattedDate);
                  setState(() {
                    endDateController.text=formattedDate;
                  });
                },

                use24hFormat: false,
                maximumDate: new DateTime(2050, 12, 31),
                minimumYear: 2010,
                maximumYear: 2040,
                minuteInterval: 1,
                mode: CupertinoDatePickerMode.date,
              )
          );
        }
    );
  }






  Widget prosWidget(context){
    return Container(
      child: Column(
        children: [
          TextField(textInputAction: TextInputAction.next,
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
                fillColor: Colors.white
            ),),
          InkWell(
              onTap: (){
                setState(()
                {
                  textfieldListPros.add(prosWidget(context));
                });
              },
              child: Container(alignment: Alignment.centerRight,
                  child: Text("+ Add More",style: TextStyle(color: ColorClass.blueColor,fontSize: 20),)))
        ],
      ),
    );
  }


  Widget consWidget(context){
    return Container(
      child: Column(
        children: [
          TextField(textInputAction: TextInputAction.next,
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
                fillColor: Colors.white
            ),),
          InkWell(
              onTap: (){
                setState(()
                {
                  textfieldListCons.add(consWidget(context));
                });
              },
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Text("+ Add More",style: TextStyle(color: ColorClass.blueColor,fontSize: 20),)))
        ],
      ),
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textfieldListPros.add(prosWidget(context));
    textfieldListCons.add(consWidget(context));
  }

  DateTime selectedDate = DateTime.now();





  @override
  Widget build(BuildContext context) {
    return Material(child: LayoutBuilder(builder: (context,constraints){
      var width = constraints.maxWidth>700;
      return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(70),child: AppBarSec(),),
        body: Container(
          color: Colors.white,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(left: 50,right: 20,top: 20,bottom: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Write a Review",
                            style: TextStyle(
                                color:  ColorClass.redColor,
                                fontWeight: FontWeight.bold,
                                fontStyle:  FontStyle.normal,
                                fontSize: 30.0
                            ),
                            textAlign: TextAlign.left
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: width?

                constraints.maxWidth-600:constraints.maxWidth,alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,width:  width? constraints.maxWidth-600:constraints.maxWidth,
                      decoration: BoxDecoration(image:
                      DecorationImage(image: ExactAssetImage("assets/images/hdimg.png"),
                        fit: BoxFit.fill,),),
                      child:Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Trishla Villa",
                                style: const TextStyle(
                                    color:  const Color(0xffffffff),
                                    fontWeight: FontWeight.w600,
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 30.0
                                ),
                                textAlign: TextAlign.left
                            ),
                            // Address:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Row(
                                  children: [
                                    Text(
                                        "Address:",
                                        style: TextStyle(
                                            color:Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 23.0
                                        ),
                                        textAlign: TextAlign.left
                                    ),
                                    Text(
                                        "Southwest apartments, Green community West,Green Community,Dubai",
                                        style:  TextStyle(
                                            color:Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 23.0),
                                        textAlign: TextAlign.left)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30,bottom: 20,),
                      child: Text(
                          "Your Review",
                          style: TextStyle(
                              color:  Colors.black,
                              fontWeight: FontWeight.w600,
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
                                        "House/Flat no",
                                        style: TextStyle(
                                            color:Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 18.0
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
                                      decoration: InputDecoration(
                                          hintText: "Enter your house/flat number",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          contentPadding: EdgeInsets.only(left: 15),
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
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
                                        "Floor Plan (sqft)",
                                        style:  TextStyle(
                                            color:Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 18.0
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
                                      decoration: InputDecoration(
                                          hintText: "Enter floor plan",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 15),
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
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
                                            color:  Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 18.0
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
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 15),
                                          hintText: "Enter Rent",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),

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

                    //Description

                    Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.black12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Your Description",
                                  style: TextStyle(
                                      color:  ColorClass.blueColor,
                                      fontWeight: FontWeight.w600,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 20.0
                                  ),
                                  textAlign: TextAlign.left
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Padding(
                                    padding: EdgeInsets.only(top: 5,bottom: 5),
                                    child: Text(
                                        "Description",
                                        style: const TextStyle(
                                            color:  Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 18.0
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
                                      maxLines: 10,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 15,top: 4),
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                          hintText: "Add Description here",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
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
                                        "Pros",
                                        style: TextStyle(
                                            color:Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 18.0
                                        ),
                                        textAlign: TextAlign.left
                                    ),
                                  ),

                                  ListView.builder(
                                    shrinkWrap:true,
                                    itemCount: textfieldListPros.length,
                                    itemBuilder: (context, index) {
                                      return textfieldListPros[index];
                                    },
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
                                        "Cons",
                                        style:  TextStyle(
                                            color:Colors.black,
                                            fontWeight: FontWeight.w500,

                                            fontStyle:  FontStyle.normal,
                                            fontSize: 18.0
                                        ),
                                        textAlign: TextAlign.left
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap:true,
                                    itemCount: textfieldListCons.length,
                                    itemBuilder: (context, index) {
                                      return textfieldListCons[index];
                                    },
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),

                    //Ratings


                    Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.black12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Your Rating",
                                  style: TextStyle(
                                      color:  ColorClass.blueColor,
                                      fontWeight: FontWeight.w600,

                                      fontStyle:  FontStyle.normal,
                                      fontSize: 20.0
                                  ),
                                  textAlign: TextAlign.left
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Facilities",
                                      style: TextStyle(
                                          color:  Colors.black,
                                          fontWeight: FontWeight.w500,

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 18.0
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  GFRating(
                                    size: 25,borderColor: Colors.black87,
                                    value: facilitiesRating,
                                    color: ColorClass.redColor,
                                    onChanged: (value) {
                                      setState(() {
                                        facilitiesRating = value;
                                      });
                                    },
                                  )

                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Design",
                                      style:  TextStyle(
                                          color:  Colors.black,
                                          fontWeight: FontWeight.w500,

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 18.0
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  GFRating(
                                    size: 25,borderColor: Colors.black87,
                                    value: designRating,
                                    color: ColorClass.redColor,
                                    onChanged: (value) {
                                      setState(() {
                                        designRating = value;
                                      });
                                    },
                                  )

                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Location",
                                      style:  TextStyle(
                                          color:  Colors.black,
                                          fontWeight: FontWeight.w500,

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 18.0
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  GFRating(
                                    size: 25,borderColor: Colors.black87,
                                    value: locationRating,
                                    color: ColorClass.redColor,
                                    onChanged: (value) {
                                      setState(() {
                                        locationRating = value;
                                      });
                                    },
                                  )

                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Value",
                                      style: TextStyle(
                                          color:  Colors.black,
                                          fontWeight: FontWeight.w500,

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 18.0
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  GFRating(
                                    size: 25,borderColor: Colors.black87,
                                    value: valueRating,
                                    color: ColorClass.redColor,
                                    onChanged: (value) {
                                      setState(() {
                                        valueRating = value;
                                      });
                                    },
                                  )

                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Management",
                                      style:  TextStyle(
                                          color:  Colors.black,
                                          fontWeight: FontWeight.w500,

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 18.0
                                      ),
                                      textAlign: TextAlign.left
                                  ),

                                  GFRating(
                                    size: 25,borderColor: Colors.black87,
                                    value: managementRating,
                                    color: Colors.lightGreen,
                                    onChanged: (value) {
                                      setState(() {
                                        managementRating = value;
                                      });
                                    },
                                  )

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    //Currently staying
                    Container(
                      margin: EdgeInsets.only(top: 10,bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.black12)
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Currently staying the same",
                                style: const TextStyle(
                                    color:  const Color(0xff000000),
                                    fontWeight: FontWeight.w500,

                                    fontStyle:  FontStyle.normal,
                                    fontSize: 18.0
                                ),
                                textAlign: TextAlign.left
                            ),
                            GFCheckbox(
                              size: 20,
                              activeBorderColor: Colors.grey,
                              activeBgColor: ColorClass.redColor,
                              type: GFCheckboxType.square,
                              value:checkBox,
                              onChanged: (value){
                                setState(() {
                                  checkBox = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Date Range

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
                              margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // First Name
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Start Date",
                                          style: TextStyle(
                                              color:Colors.black,
                                              fontWeight: FontWeight.w500,

                                              fontStyle:  FontStyle.normal,
                                              fontSize: 18.0
                                          ),
                                          textAlign: TextAlign.left
                                      ),

                                      MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(

                                            child: Icon(CupertinoIcons.calendar,size: 30,),))
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: Color(0x33000000), width: 1)),
                                    child: TextField(
                                      controller: startDateController,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 15),
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,

                                          ),
                                          border: InputBorder.none,
                                          hintText: "Select date",
                                          hintStyle: TextStyle(color: Colors.grey),
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
                                  Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "End Date",
                                          style: TextStyle(
                                              color:Colors.black,
                                              fontWeight: FontWeight.w500,

                                              fontStyle:  FontStyle.normal,
                                              fontSize: 18.0
                                          ),
                                          textAlign: TextAlign.left
                                      ),

                                      IconButton(icon: Icon(CupertinoIcons.calendar,size: 30,),
                                        onPressed: (){

                                          // showEndDatePickerWidget();
                                        },)
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            color: Color(0x33000000), width: 1)),
                                    child: TextField(
                                      controller: endDateController,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(left: 15),

                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,

                                          ),
                                          border: InputBorder.none,
                                          hintText: "Select date",
                                          hintStyle: TextStyle(color: Colors.grey),
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



                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        width:350,
                        margin: EdgeInsets.only(bottom: 50,top: 50),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, compoundDetails);
                          },
                          color: ColorClass.blueColor,
                          hoverColor: Colors.blue.shade900,
                          textColor: Colors.white,
                          child: Text(
                            "Submit Review",
                            style: TextStyle(fontSize: 16),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),


            SizedBox(height: 40,),



            Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: const Color(0x40000000),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0)
                ], color: const Color(0x4d000000))),
            FooterWidget()


          ],),
        ),
      );
    },),);
  }
}