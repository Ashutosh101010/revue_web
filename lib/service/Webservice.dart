
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/home/CompoundList.dart';
import 'package:webrevue/model/AnswerModal.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/model/QuestionModal.dart';
import 'package:webrevue/model/ReviewModal.dart';
import 'package:webrevue/model/UserModal.dart';
import 'package:webrevue/route/routing_constant.dart';

import 'ServerDetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Webservice{

  static Future<bool> registerRequest(BuildContext context,UserModal userModal) async{
    var request = userModal.toJson();
    print(request);
    var response = await http.post(Uri.parse(ServerDetails.register_request),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });

    var jsonResponse = convert.jsonDecode(response.body);

    if(jsonResponse["status"]== true &&
        jsonResponse["errorCode"] ==1 ){
      displayAlertDialog(context,title: "Create Account",content: jsonResponse["message"]);

      return true;
    }else{
      print("not register");
      return false;

    }
  }

  static Future<bool> loginRequest(BuildContext context,UserModal userModal)async{
    var request ={};
    request["email"] = userModal.email;
    request["password"] = userModal.password;
    print(request);
    var response = await http.post(Uri.parse(ServerDetails.login_request),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });

    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);


    if(jsonResponse["status"]==true &&
        jsonResponse["errorCode"] == 1){

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("userId", jsonResponse["user"]["_id"]);
      sharedPreferences.setString("name", jsonResponse["user"]["firstname"]+" " +jsonResponse["user"]["lastname"]);
      sharedPreferences.setString("email",jsonResponse["user"]["email"]);
      sharedPreferences.setBool("isLoggedIn", true);

      // displayAlertDialog(context,content: jsonResponse["message"],title: "Login");
      return true;
    }
    else if(jsonResponse["status"] == false &&
        jsonResponse["errorCode"]==0
        && jsonResponse["message"] == "Password Not Match"){

      // displayAlertDialog(context,content: jsonResponse["message"],title: "Login");
      return false;
    }

    else if(jsonResponse["status"] == false &&
        jsonResponse["errorCode"]==0
        && jsonResponse["message"] =="User Not Found"){

      // displayAlertDialog(context,content: jsonResponse["message"],title: "Login");
      return false;
    }
  }


  static Future<dynamic>  getCompoundRequest(BuildContext context,List cList,String id)async{

    var request ={};
    request["lastObjectID"]= id;
    request["category"] = "Any";
    request["amenities"] = [];
    // if(radius>0 && radius<30 && currentPosition!=null)
    // {
    //   request["radius"]=radius;
    //   request["coordinates"]=[currentPosition.latitude,currentPosition.longitude];
    // }

    // print(convert.jsonEncode(request));
    var response = await http.post(Uri.parse(ServerDetails.get_compound_request),
        body: convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });

    cList.clear();
    // print(response.body);
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
    // List tempList = [];
    // CompoundModal compoundModal;
    if(jsonResponse["status"]==true &&
        jsonResponse["fetchCode"]==1){
      List list = jsonResponse["compoundList"];
      list.forEach((element) {
      CompoundModal  compoundModal = new CompoundModal.fromJson(element);
        cList.add(compoundModal);
      });
    }else if(jsonResponse["status"]==false &&
        jsonResponse["fetchCode"]==2){
      displayAlertDialog(context,content: "Unable to Fetch Compound",title: "Compounds");
    }
   }


  static Future<CompoundModal> getCompoundDetails(String id)async{
    var request ={};
    request["id"] = id;
    var response = await http.post(Uri.parse(ServerDetails.get_compound_detail_request),
        body:convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });
    var jsonResponse  = convert.jsonDecode(response.body);
    CompoundModal compoundModal;
    // print(jsonResponse);
    if(jsonResponse["status"] == true
        &&jsonResponse["errorCode"] ==1){
      compoundModal = CompoundModal.fromJson(jsonResponse["compoundModal"]);

    }return compoundModal;

  }

  static Future<dynamic> fetchAllReviews(BuildContext context,String id,List rList)async{
    var request ={};
    request["compoundID"] = id;
    var response = await http.post(Uri.parse(ServerDetails.get_AllReviews),
        body:convert.jsonEncode(request),
        headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });

    rList.clear();
    var jsonResponse = convert.jsonDecode(response.body);
    if(jsonResponse["status"] == true){
      // print(jsonResponse);
      List list = jsonResponse["reviewList"];
      ReviewModal reviewModal;
      list.forEach((element) {
        reviewModal = new ReviewModal.fromJson(element);
        rList.add(reviewModal);

      });

    }
  }


  static Future<dynamic> getAllRequestedQuestions (List questionsList,String compoundID) async{
    var request ={};
    request["compoundID"] = compoundID;
    var response  = await http.post(Uri.parse(ServerDetails.get_All_Questions),
        body: convert.jsonEncode(request), headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });

    questionsList.clear();
    var jsonResponse = convert.jsonDecode(response.body);
    if(jsonResponse["errorCode"]==0 && jsonResponse["status"] == true){
      List list = jsonResponse["questionsList"];
      QuestionModal questionModal;
      list.forEach((element) {
        questionModal = new QuestionModal();
        questionModal.compoundID = element["compoundID"];
        questionModal.userName = element["userName"];
        questionModal.userID = element["userID"];
        questionModal.question = element["question"];
        questionModal.id = element["_id"];
        // questionModal.timestamp = element["timestamp"];

        List list =   element["answersList"];
        AnswerModal answerModal;
        List<AnswerModal> ansList =[];
        list.forEach((ansElement) {
          answerModal = AnswerModal.fromJson(ansElement);
          ansList.add(answerModal);
        });
        questionModal.answerList = ansList;
        questionsList.add(questionModal);
      });
    }
  }



}