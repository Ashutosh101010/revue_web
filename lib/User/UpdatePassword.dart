import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/Webservice.dart';


import '../AppBar/AppBarFirst.dart';
import '../constants/ColorClass.dart';

import '../SignUp.dart';
import 'dart:html' as html;

class UpdatePassword extends StatefulWidget{
  String email;

  UpdatePassword(this.email);

  @override
  State<StatefulWidget> createState() {
    return UpdatePasswordState();
  }
}

class UpdatePasswordState extends State<UpdatePassword>{
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  onRefresh(){
    html.window.onBeforeUnload.listen((event) async{
      setState(() {

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Material(
        child:  LayoutBuilder(builder: (context,constraints){
          var maxWidth = constraints.maxWidth>700;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: maxWidth?
            PreferredSize(preferredSize: Size.fromHeight(80),child:  AppBarFirst(constraints.maxWidth,false),)

                :AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){},),
            ),

            body: Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage("assets/images/mapbg.png",),
                    fit: BoxFit.cover,)),
              child: Column(
                // fit: StackFit.expand,
                children: [
                  // Container(
                  //   width: constraints.maxWidth,
                  //   height: constraints.maxHeight,
                  //   child: Image.asset("assets/images/mapbg.png",
                  //     color: Colors.white.withOpacity(0.1),
                  //     colorBlendMode: BlendMode.softLight,
                  //     width: constraints.maxWidth,
                  //     height: constraints.maxHeight,fit: BoxFit.fill,),),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: AutoSizeText(
                              "Forget Password",
                              style: TextStyle(
                                  color:  ColorClass.redColor,
                                  fontWeight: FontWeight.w700,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 20.0
                              ),
                              textAlign: TextAlign.left
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 420,height: 440,
                      // decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50,bottom: 20),
                            child: AutoSizeText(
                                "Set your new password to again Login into your account",
                                style: TextStyle(
                                    color:  Colors.black87,
                                    fontWeight: FontWeight.w700,

                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),
                                textAlign: TextAlign.center
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.only(left: 50,right: 50,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                    "Set New Password",
                                    style: const TextStyle(
                                        color:  Colors.black87,
                                        fontWeight: FontWeight.w500,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.0
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                Container(
                                  width: 400,
                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                  child: CupertinoTextField(
                                      padding: EdgeInsets.all(10),
                                      autofocus: false,
                                      controller: newPasswordController,
                                      style:  TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,

                                      ),
                                      placeholder: "New Password",
                                      placeholderStyle:TextStyle(
                                          color:  Colors.black54,
                                            fontWeight: FontWeight.w500,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.0
                                      ),
                                      obscureText: true,
                                      decoration: BoxDecoration(
                                          color: Color(0xfff9f9f9),
                                          border: Border.all(color: Colors.grey)
                                      )
                                  ),

                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.only(left: 50,right: 50,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                    "Confirm Password",
                                    style: const TextStyle(
                                        color:  Colors.black87,
                                        fontWeight: FontWeight.w500,

                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.0
                                    ),
                                    textAlign: TextAlign.left
                                ),
                                Container(
                                  width: 400,
                                  margin: EdgeInsets.only(top: 10,bottom: 10),
                                  child: CupertinoTextField(
                                      obscureText: true,controller: confirmPasswordController,
                                      padding: EdgeInsets.all(10),
                                      autofocus: false,
                                      style:  TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,

                                      ),
                                      placeholder: "Confirm Password",
                                      placeholderStyle:TextStyle(
                                          color:  const Color(0x99000000),

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.0
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xfff9f9f9),
                                          border: Border.all(color: Colors.grey)
                                      )
                                  ),

                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 50,),


                          Padding(
                            padding: const EdgeInsets.only(left: 50,right: 50,top: 30,bottom: 20),
                            child: SizedBox(
                              width: 300,height: 40,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onPressed: (){
                                  if(newPasswordController.text.length<6||confirmPasswordController.text.length<6){
                                    displayAlertDialog(context,
                                        title: "Change Password",
                                        content: "Password length must be more than 6 characters");
                                  }
                                  if(newPasswordController.text==confirmPasswordController.text){
                                    Webservice.changePasswordRequest(context, confirmPasswordController.text, widget.email);
                                  }else{
                                    displayAlertDialog(context,content: "Password not matches",title: "Change Password");
                                  }
                                },
                                color: ColorClass.blueColor,
                                hoverColor: Colors.blue.shade900,
                                textColor: Colors.white,
                                child: Text("Submit",style: TextStyle(
                                    color:  const Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),),
                                padding: EdgeInsets.all(10),
                              ),
                            ),
                          ),

                        ],),
                    ),
                  ),
                ],
              ),
            ),

          );})


    );
  }
}

