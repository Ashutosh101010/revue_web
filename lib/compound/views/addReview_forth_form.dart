import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddReviewForthForm extends StatefulWidget{
  AddReviewForthForm({Key key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddReviewForthFormState();
  }
}
class AddReviewForthFormState extends State<AddReviewForthForm>{
  bool checkBox = false;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  // showStartDatePickerWidget(){
  //   return showCupertinoModalPopup(
  //       context: context,
  //       builder:  (BuildContext builder){
  //         return Container(
  //             height: MediaQuery.of(context).copyWith().size.height / 3,
  //             child: CupertinoDatePicker(
  //               backgroundColor: Colors.black,
  //               initialDateTime: DateTime.now().subtract(Duration(hours: 1)),
  //               onDateTimeChanged: (DateTime newdate) {
  //                 print(newdate);
  //                 var formatter = new DateFormat('dd/MM/yyyy');
  //                 // String formattedTime = DateFormat('kk:mm:a').format(newdate);
  //                 String formattedDate = formatter.format(newdate);
  //                 // print(formattedTime);
  //                 print(formattedDate);
  //                 setState(() {
  //                   startDateController.text=formattedDate;
  //                 });
  //               },
  //
  //               use24hFormat: false,
  //               maximumDate: new DateTime(2050, 12, 31),
  //               minimumYear: 2010,
  //               maximumYear: 2040,
  //               minuteInterval: 1,
  //               mode: CupertinoDatePickerMode.date,
  //             )
  //         );
  //       }
  //   );
  // }
  //
  // showEndDatePickerWidget(){
  //   return showCupertinoModalPopup(
  //       context: context,
  //       builder:  (BuildContext builder){
  //         return Container(
  //             height: MediaQuery.of(context).copyWith().size.height / 3,
  //             child: CupertinoDatePicker(
  //               backgroundColor: Colors.black,
  //               initialDateTime: DateTime.now().subtract(Duration(hours: 1)),
  //               onDateTimeChanged: (DateTime newdate) {
  //                 print(newdate);
  //                 var formatter = new DateFormat('MM/dd/yyyy');
  //                 String formattedTime = DateFormat('kk:mm:a').format(newdate);
  //                 String formattedDate = formatter.format(newdate);
  //                 print(formattedTime);
  //                 print(formattedDate);
  //                 setState(() {
  //                   endDateController.text=formattedDate;
  //                 });
  //               },
  //
  //               use24hFormat: false,
  //               maximumDate: new DateTime(2050, 12, 31),
  //               minimumYear: 2010,
  //               maximumYear: 2040,
  //               minuteInterval: 1,
  //               mode: CupertinoDatePickerMode.date,
  //             )
  //         );
  //       }
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [


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
                                    color:Colors.black87,
                                    fontWeight: FontWeight.w600,

                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),
                                textAlign: TextAlign.left
                            ),

                            MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Icon(CupertinoIcons.calendar,size: 25,),))
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
                                  color: Colors.black54,
                                  fontSize: 14,


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
                                    color:Colors.black87,
                                    fontWeight: FontWeight.w600,

                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),
                                textAlign: TextAlign.left
                            ),

                            IconButton(icon: Icon(CupertinoIcons.calendar,size: 25,),
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
                                  color: Colors.black54,
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

          //Currently staying
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border.all(color: Colors.black12)
            ),
            child:  Padding(
              padding: const EdgeInsets.only(left:20.0,right: 20,top:10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Currently staying the same",
                      style: const TextStyle(
                          color:  Colors.black54,
                          fontWeight: FontWeight.w600,

                          fontStyle:  FontStyle.normal,
                          fontSize: 14.0
                      ),
                      textAlign: TextAlign.left
                  ),


                  Checkbox(
                      value: checkBox, onChanged: (value){
                    setState(() {
                      checkBox = value;
                    });
                  })
                  // GFCheckbox(
                  //   size: 16,
                  //   activeBorderColor: Colors.grey,
                  //   // activeBgColor: ColorClass.redColor,
                  //   type: GFCheckboxType.square,
                  //   value:checkBox,
                  //   onChanged: (value){
                  //     setState(() {
                  //       checkBox = value;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
          ),

        ],)
    );
  }

}