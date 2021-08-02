import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/Webservice.dart';

import '../AppBar/AppBarFirst.dart';
import '../constants/ColorClass.dart';
import '../SignUp.dart';
import 'UpdatePassword.dart';

class OtpVerification extends StatefulWidget{
  String email;


  OtpVerification(this.email);

  @override
  State<StatefulWidget> createState() {
    return OtpVerificationState();
  }
}

class OtpVerificationState extends State<OtpVerification>{
  TextEditingController firstController= TextEditingController();
  TextEditingController secondController= TextEditingController();
  TextEditingController thirdController= TextEditingController();
  TextEditingController forthController= TextEditingController();
  TextEditingController fifthController= TextEditingController();
  TextEditingController sixthController= TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Material(
        child:  LayoutBuilder(builder: (context,constraints){
          var maxWidth = constraints.maxWidth>700;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: maxWidth?
            PreferredSize(preferredSize: Size.fromHeight(80),child:  AppBarFirst(constraints.maxWidth),)

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
                            padding: const EdgeInsets.only(left: 40,top: 20,bottom: 40,right: 20),
                            child:Container(
                              alignment: Alignment.topLeft,
                              child: AutoSizeText(
                                  "Enter OTP ",
                                  style: TextStyle(
                                      color:  Colors.black87,
                                      fontWeight: FontWeight.w600,

                                      fontStyle:  FontStyle.normal,
                                      fontSize: 16.0
                                  ),
                                  textAlign: TextAlign.start
                              ),
                            ),
                          ),


                          Padding(
                            padding: maxWidth?
                            EdgeInsets.only(top: 20, left: 50,right: 50,bottom: 10):
                            EdgeInsets.only(top: 20,bottom: 10,left: 10,right: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:maxWidth? MainAxisAlignment.spaceBetween:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: maxWidth?40:30,
                                    height:maxWidth?40:30,
                                    margin: EdgeInsets.only(
                                      left: 5,right: 5
                                    ),
                                    alignment:Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0x4d000000),
                                            width: 1
                                        ),
                                        color: const Color(0xb2ffffff)
                                    ),
                                    child: CupertinoTextField(
                                      showCursor: true,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      controller: firstController,
                                      textAlign: TextAlign.center,
                                      style:  TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,

                                      ),
                                      placeholderStyle:TextStyle(
                                          color:  const Color(0x99000000),
                                          fontWeight: FontWeight.w400,

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 20.0
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide.none,
                                              bottom: BorderSide.none,
                                              left: BorderSide.none,
                                              right: BorderSide.none
                                          )
                                      ),

                                    ),
                                  ),
                                  Container(
                                    width: maxWidth?40:30,
                                    height:maxWidth?40:30,

                                    margin: EdgeInsets.only(
                                        left: 5,right: 5
                                    ),
                                    alignment:Alignment.center,
                                    decoration: BoxDecoration(

                                        border: Border.all(
                                            color: const Color(0x4d000000),
                                            width: 1
                                        ),
                                        color: const Color(0xb2ffffff)
                                    ),
                                    child: CupertinoTextField(
                                      showCursor: true,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      controller: secondController,
                                      style:  TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,

                                      ),
                                      placeholderStyle:TextStyle(
                                          color:  const Color(0x99000000),
                                          fontWeight: FontWeight.w400,

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 20.0
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide.none,
                                              bottom: BorderSide.none,
                                              left: BorderSide.none,
                                              right: BorderSide.none
                                          )
                                      ),

                                    ),
                                  ),
                                  Container(
                                    width: maxWidth?40:30,
                                    height:maxWidth?40:30,

                                    margin: EdgeInsets.only(
                                        left: 5,right: 5
                                    ),
                                    alignment:Alignment.center,
                                    decoration: BoxDecoration(

                                        border: Border.all(
                                            color: const Color(0x4d000000),
                                            width: 1
                                        ),
                                        color: const Color(0xb2ffffff)
                                    ),
                                    child: CupertinoTextField(
                                      showCursor: true,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,

                                      textAlign: TextAlign.center,
                                      controller: thirdController,
                                      style:  TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      placeholderStyle:TextStyle(
                                          color:  const Color(0x99000000),
                                          fontWeight: FontWeight.w400,

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 20.0
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide.none,
                                              bottom: BorderSide.none,
                                              left: BorderSide.none,
                                              right: BorderSide.none
                                          )
                                      ),

                                    ),
                                  ),
                                  Container(
                                    width: maxWidth?40:30,
                                    height:maxWidth?40:30,

                                    margin: EdgeInsets.only(
                                        left: 5,right: 5
                                    ),
                                    alignment:Alignment.center,
                                    decoration: BoxDecoration(

                                        border: Border.all(
                                            color: const Color(0x4d000000),
                                            width: 1
                                        ),
                                        color: const Color(0xb2ffffff)
                                    ),
                                    child: CupertinoTextField(
                                      showCursor: true,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,

                                      textAlign: TextAlign.center,
                                      controller: forthController,
                                      style:  TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,

                                      ),
                                      placeholderStyle:TextStyle(
                                          color:  const Color(0x99000000),
                                          fontWeight: FontWeight.w400,

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 20.0
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide.none,
                                              bottom: BorderSide.none,
                                              left: BorderSide.none,
                                              right: BorderSide.none
                                          )
                                      ),

                                    ),
                                  ),
                                  Container(
                                    width: maxWidth?40:30,
                                    height:maxWidth?40:30,

                                    margin: EdgeInsets.only(
                                        left: 5,right: 5
                                    ),
                                    alignment:Alignment.center,
                                    decoration: BoxDecoration(

                                        border: Border.all(
                                            color: const Color(0x4d000000),
                                            width: 1
                                        ),
                                        color: const Color(0xb2ffffff)
                                    ),
                                    child: CupertinoTextField(
                                      textAlign: TextAlign.center,
                                      controller: fifthController,
                                      showCursor: true,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,

                                      style:  TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,

                                      ),
                                      placeholderStyle:TextStyle(
                                          color:  const Color(0x99000000),
                                          fontWeight: FontWeight.w400,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 20.0
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide.none,
                                              bottom: BorderSide.none,
                                              left: BorderSide.none,
                                              right: BorderSide.none
                                          )
                                      ),

                                    ),
                                  ),
                                  Container(
                                    width: maxWidth?40:30,
                                    height:maxWidth?40:30,

                                    margin: EdgeInsets.only(
                                        left: 5,right: 5
                                    ),
                                    alignment:Alignment.center,
                                    decoration: BoxDecoration(

                                        border: Border.all(
                                            color: const Color(0x4d000000),
                                            width: 1
                                        ),
                                        color: const Color(0xb2ffffff)
                                    ),
                                    child: CupertinoTextField(
                                      textAlign: TextAlign.center,
                                      controller: sixthController,
                                      showCursor: true,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,

                                      style:  TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,

                                      ),
                                      placeholderStyle:TextStyle(
                                          color:  const Color(0x99000000),
                                          fontWeight: FontWeight.w400,

                                          fontStyle:  FontStyle.normal,
                                          fontSize: 20.0
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide.none,
                                              bottom: BorderSide.none,
                                              left: BorderSide.none,
                                              right: BorderSide.none
                                          )
                                      ),

                                    ),
                                  ),
                                ],
                              ),
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

                                  String otp = firstController.text+secondController.text+thirdController.text+forthController.text+fifthController.text+sixthController.text;

                                  Webservice.validateOtpRequest(context,widget.email,otp);

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