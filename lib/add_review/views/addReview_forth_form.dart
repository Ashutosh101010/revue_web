import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:webrevue/add_review/custom_textfield.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/loading_dialog.dart';

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
  bool startdatevalidate =false;
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();




  showStartDatePickerWidget() {

    WidgetsBinding.instance.addPostFrameCallback((_){

      return showCupertinoModalPopup(
          context: context,
          builder:  (BuildContext builder){
            return Container(
                height: MediaQuery.of(context).copyWith().size.height / 3,
                child: CupertinoDatePicker(
                  backgroundColor: Colors.white,
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

    });

  }




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
                            CustomTextField(label: "Start Date", withAsterisk: true),

                            IconButton(icon: Icon(CupertinoIcons.calendar,size: 30,color: ColorClass.blueColor,),
                              onPressed: ()async{
                                FocusScopeNode currentFocus = FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }

                                await selectDate(context,startDateController);
                                setState(() {

                                });

                              },)
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  color: Color(0x33000000), width: 1)),
                          child: TextFormField(
                            controller: startDateController,
                            readOnly: true,
                            onChanged: (value){
                              setState(() {
                                startdatevalidate=false;
                              });
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,),
                                border: InputBorder.none,
                                hintText: "Select date",
                                hintStyle: TextStyle(color: Colors.grey),

                                fillColor: Colors.white
                            ),


                          ),

                        ),
                        Text(startdatevalidate?'please select date':"",
                          style: TextStyle(color: Colors.red),),


    ],
                    ),
                  ),

                  checkBox==false?

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

                            IconButton(icon: Icon(CupertinoIcons.calendar,size: 30,color: ColorClass.blueColor,),
                              onPressed: ()async{
                                FocusScopeNode currentFocus = FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }

                                await selectDate(context,endDateController);
                                setState(() {

                                });

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
                  ):Container()

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


                  GFCheckbox(
                    size: 20,
                    activeBorderColor: Colors.black45,
                    activeBgColor: ColorClass.blueColor,
                    type: GFCheckboxType.square,inactiveBorderColor: Colors.grey,
                    value:checkBox,
                    onChanged: (value){

                      setState(() {
                        checkBox = value;
                      });
                    },
                  ),
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