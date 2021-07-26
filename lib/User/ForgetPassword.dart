import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:webrevue/route/routing_constant.dart';

import '../AppBar/AppBarFirst.dart';
import '../constants/ColorClass.dart';
import '../SignUp.dart';

class ForgetPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ForgetPasswordState();
  }
}

class ForgetPasswordState extends State<ForgetPassword>{
  var scaffoldKey = GlobalKey<ScaffoldState>();

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
          leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
            return scaffoldKey.currentState.openDrawer();
          },),
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
                        padding: const EdgeInsets.only(left: 50,right: 50,top: 20,bottom: 10),
                        child: AutoSizeText(
                            "Enter your email or phone number linked to your account to get back your Account ",
                            style: TextStyle(
                                color:  Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontStyle:  FontStyle.normal,
                                fontSize: 16.0
                            ),
                            textAlign: TextAlign.center
                        ),
                      ),


                      Container(
                        width: 400,
                        padding: const EdgeInsets.only(left: 50,right: 50,top: 10),
                        margin: EdgeInsets.only(top: 30,bottom: 10),
                        child: CupertinoTextField(
                            padding: EdgeInsets.all(10),
                            autofocus: false,
                            style:  TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                            placeholder: "Enter Email or phone.",
                            placeholderStyle:TextStyle(
                                color:  Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontStyle:  FontStyle.normal,
                                fontSize: 16.0
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xfff9f9f9),
                                border: Border.all(color: Colors.black26)
                            )
                        ),

                      ),

                      SizedBox(height: 50,),

                      Padding(
                        padding: const EdgeInsets.only(left: 50,right: 50,top: 30,bottom: 20),
                        child: SizedBox(
                          width: 300,height: 40,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onPressed: (){
                              Navigator.pushNamed(context,otpVerification);
                            },
                            color: ColorClass.blueColor,
                            hoverColor: Colors.blue.shade900,
                            textColor: Colors.white,
                            child: Text("Send OTP",style: TextStyle(
                                color:  const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                fontStyle:  FontStyle.normal,
                                fontSize: 16.0
                            )),
                            padding: EdgeInsets.all(10),
                          ),
                        ),
                      ),


                      // Expanded(child: Align(alignment: Alignment.bottomCenter,
                      //   child: InkWell(
                      //     onTap: (){
                      //       Navigator.pop(context);
                      //     },
                      //     child: Container(
                      //       alignment: Alignment.center,height: 40,
                      //       decoration: BoxDecoration(color: Color(0xfff9f9f9),
                      //           border: Border.all(color: Colors.black12)),
                      //       width: MediaQuery.of(context).size.width,
                      //       child: Text("Back to Login",style: TextStyle(color: Colors.black,fontSize: 17),),
                      //     ),
                      //   ),),)


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