
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webrevue/add_review/custom_textfield.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/model/ReviewModal.dart';

import 'ConsTextFields.dart';
import 'ProsTextFields.dart';

class AddReviewSecondForm extends StatefulWidget{
  AddReviewSecondForm({Key key}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddReviewSecondFormState();
  }
}

class AddReviewSecondFormState extends State<AddReviewSecondForm>{
  TextEditingController descriptionController = TextEditingController();

  List<String> consList = [null];
  List<String> prosList = [null];

bool descriptionvalidate=false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
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
                      child:CustomTextField(withAsterisk: true,label: "Your Description",)
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: Color(0x33000000), width: 1)),
                            child: TextFormField(textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 10,controller: descriptionController,
                              onChanged: (value){
                              setState(() {
                                descriptionvalidate=false;
                              });
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 15,top: 6),
                                  labelStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                  ),
                                  hintText: "Add Description here",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  fillColor: Colors.white
                              ),


                            ),


                          ),
                          Text(descriptionvalidate?'please  add description ':"",
                            style: TextStyle(color: Colors.red),),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Padding(
                      padding: EdgeInsets.only(top: 5,bottom: 5),
                      child: CustomTextField(label:  "Pros",withAsterisk: true,)
                    ),
                          ..._getProsWidget(),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Padding(
                      padding: EdgeInsets.only(top: 5,bottom: 5),
                      child:CustomTextField(withAsterisk: true,label: "Cons",)
                    ),

                          ..._getConsWidget()

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),






        ],
      ),
    );
  }


  List<Widget> _getProsWidget(){
    List<Widget> proTextFieldList = [];
    for(int i=0; i<prosList.length; i++){
      proTextFieldList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Expanded(child: ProsTextFields(i)),
                SizedBox(width: 14,),
                // we need add button at last friends row
                _addRemoveProButton(i == prosList.length-1, i),
              ],
            ),
          )
      );
    }
    return proTextFieldList;
  }

  //////////////////////////////////


  List<Widget> _getConsWidget(){
    List<Widget> consTextFieldList = [];
    for(int i=0; i<consList.length; i++){
      consTextFieldList.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Expanded(child: ConsTextFields(i)),
                SizedBox(width: 14,),
                // we need add button at last friends row
                _addRemoveConsButton(i == consList.length-1, i),
              ],
            ),
          )
      );
    }
    return consTextFieldList;
  }



  Widget _addRemoveProButton(bool add, int index){
    return InkWell(
      onTap: (){
        if(add){
          // add new text-fields at the top of all friends textfields
          prosList.insert(0, null);
        }
        else prosList.removeAt(index);
        setState((){});
      },
      child: Container(
        width: 30,
        height: 30,
        // decoration: BoxDecoration(
        //   color: (add) ? ColorClass.blackColor : ColorClass.blueColor,
        // ),
        child: Icon((add) ?
        Icons.add_circle_outline : Icons.remove_circle_outline, color: Colors.black,size: 18,),
      ),
    );
  }
  Widget _addRemoveConsButton(bool add, int index){
    return InkWell(
      onTap: (){
        if(add){
          // add new text-fields at the top of all friends textfields
          consList.insert(0, null);
        }
        else consList.removeAt(index);
        setState((){});
      },
      child: Container(
        width: 30,
        height: 30,
        // decoration: BoxDecoration(
        //   color: (add) ? ColorClass.blackColor : ColorClass.blueColor,
        // ),
        child: Icon((add) ?
        Icons.add_circle_outline : Icons.remove_circle_outline, color: Colors.black,size: 18,),
      ),
    );
  }

  String name = '';
  String error;
  Uint8List data;



  Future<void> addToReview(ReviewModal reviewModal) async{
    List tempProList = [];
    List tempConsList =[];

    for(int i =0;i<prosList.length;i++){
      tempProList.add(prosList[i]);
    }

    print(tempProList);

    for(int i =0;i<consList.length;i++){
      tempConsList.add(consList[i]);
    }
    print(tempConsList);

    reviewModal.pros = tempProList;
    reviewModal.cons = tempConsList;

    print(reviewModal.pros);
    print(reviewModal.cons);
    //
    // List<http.MultipartFile> newList = new List<http.MultipartFile>();
    // for (int i = 0; i < imagesList.length; i++) {
    //   File imageFile = File(imagesList[i].toString());
    //   var stream =
    //   new http.ByteStream(imageFile.openRead());
    //   var length = await imageFile.length();
    //   var multipartFile = new http.MultipartFile("imagefile", stream, length,
    //       filename: imageFile.path.split('/').last);
    //   newList.add(multipartFile);
    // }

    // reviewModal.multipartImages= tempList;

  }


  bool validate(){
    return descriptionController.text.isNotEmpty&&
    prosList.isNotEmpty&&consList.isNotEmpty;
  }



}