import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:webrevue/route/routing_constant.dart';

import '../AppBar/AppBarFirst.dart';
import '../constants/ColorClass.dart';
import '../SignUp.dart';
import 'UpdatePassword.dart';

class OtpVerification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return OtpVerificationState();
  }
}

class OtpVerificationState extends State<OtpVerification>{
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     backgroundColor: Colors.white,
    //     actions: [
    //       Padding(
    //         padding: const EdgeInsets.only(left: 20),
    //         child: Image.asset(
    //           "assets/images/revue.png",
    //           fit: BoxFit.contain,width: 100,height: 100,
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(
    //             left: 40, right: 20, top: 10, bottom: 10),
    //         child: FlatButton(
    //           onPressed: () {
    //
    //           },
    //           focusColor: Colors.yellow,
    //           child: Row(
    //             children: [
    //               Text(
    //                 "Find Property",
    //                 style: TextStyle(
    //                     color: ColorClass.lightTextColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontFamily: "Montserrat",
    //                     fontStyle: FontStyle.normal,
    //                     fontSize: 15.0),
    //               ),
    //               Icon(CupertinoIcons.chevron_down)
    //             ],
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(
    //             left: 40, right: 20, top: 10, bottom: 10),
    //         child: FlatButton(
    //           onPressed: () {},
    //           focusColor: Colors.yellow,
    //           child: Row(
    //             children: [
    //               Text(
    //                 "Find Property by Owner",
    //                 style: TextStyle(
    //                     color: ColorClass.lightTextColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontFamily: "Montserrat",
    //                     fontStyle: FontStyle.normal,
    //                     fontSize: 15.0),
    //               ),
    //               Icon(CupertinoIcons.chevron_down)
    //             ],
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: Align(
    //           alignment: Alignment.topRight,
    //           child: Container(
    //             margin: const EdgeInsets.only(
    //                 left: 10, right: 40, top: 10, bottom: 10),
    //             height: 50,
    //             child: HoverButton(
    //               hoverColor: Colors.black,
    //               color: ColorClass.blueColor,
    //               shape: ShapeBorder.lerp(Border.all(color: ColorClass.blueColor), Border.all(color: ColorClass.blueColor),0.2),
    //               onpressed: () {
    //                 return showDialog(
    //                     context: context,
    //                     builder: (BuildContext b) {
    //                       return AlertDialog(
    //                         backgroundColor: Colors.white,
    //                         insetPadding: EdgeInsets.all(20),
    //                         contentPadding: EdgeInsets.zero,
    //                         clipBehavior: Clip.antiAliasWithSaveLayer,
    //                         content: SignUp(),
    //                       );
    //                     });
    //               },
    //               child: Text(
    //                 "Sign Up",
    //                 style: const TextStyle(
    //                     color: const Color(0xffffffff),
    //                     fontWeight: FontWeight.w700,
    //                     fontFamily: "Montserrat",
    //                     fontStyle: FontStyle.normal,
    //                     fontSize: 16.0),
    //               ),
    //             ),
    //
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    //   body: Center(
    //     child: Container(
    //       width: 450,
    //       height: 500,
    //       child: Stack(
    //         children: [
    //           Container(
    //           width: 450,
    //           height: 500,child: Image.asset("assets/images/mapbg.png",fit: BoxFit.fill,),),
    //           Column(
    //             // mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //
    //               Padding(
    //                 padding: const EdgeInsets.all(10.0),
    //                 child: Text(
    //                     "Forget Password",
    //                     style: TextStyle(
    //                         color:  ColorClass.redColor,
    //                         fontWeight: FontWeight.w600,
    //                         fontFamily: "Mulish",
    //                         fontStyle:  FontStyle.normal,
    //                         fontSize: 25.0
    //                     ),
    //                     textAlign: TextAlign.center
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 40,top: 40,bottom: 10),
    //                 child:Container(
    //                   alignment: Alignment.topLeft,
    //                   child: Text(
    //                       "Enter OTP ",
    //                       style: TextStyle(
    //                           color:  ColorClass.lightTextColor,
    //                           fontWeight: FontWeight.w600,
    //                           fontFamily: "Mulish",
    //                           fontStyle:  FontStyle.normal,
    //                           fontSize: 18.0
    //                       ),
    //                       textAlign: TextAlign.start
    //                   ),
    //                 ),
    //               ),
    //
    //
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 20,left: 50,right: 50,bottom: 10),
    //                 child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Container(
    //                         width: 40,
    //                         height: 40,
    //                         alignment:Alignment.center,
    //                         decoration: BoxDecoration(
    //                             border: Border.all(
    //                                 color: const Color(0x4d000000),
    //                                 width: 1
    //                             ),
    //                             color: const Color(0xb2ffffff)
    //                         ),
    //                         child: CupertinoTextField(
    //                           showCursor: false,
    //                           textAlign: TextAlign.center,
    //                           style:  TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontFamily: 'Mulish',
    //                           ),
    //                           placeholderStyle:TextStyle(
    //                               color:  const Color(0x99000000),
    //                               fontWeight: FontWeight.w400,
    //                               fontFamily: "Mulish",
    //                               fontStyle:  FontStyle.normal,
    //                               fontSize: 20.0
    //                           ),
    //                           decoration: BoxDecoration(
    //                               border: Border(
    //                                   top: BorderSide.none,
    //                                   bottom: BorderSide.none,
    //                                   left: BorderSide.none,
    //                                   right: BorderSide.none
    //                               )
    //                           ),
    //
    //                         ),
    //                       ),
    //                       Container(
    //                         width: 40,
    //                         height: 40,
    //                         alignment:Alignment.center,
    //                         decoration: BoxDecoration(
    //
    //                             border: Border.all(
    //                                 color: const Color(0x4d000000),
    //                                 width: 1
    //                             ),
    //                             color: const Color(0xb2ffffff)
    //                         ),
    //                         child: CupertinoTextField(
    //                           textAlign: TextAlign.center,
    //                           style:  TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontFamily: 'Mulish',
    //                           ),
    //                           placeholderStyle:TextStyle(
    //                               color:  const Color(0x99000000),
    //                               fontWeight: FontWeight.w400,
    //                               fontFamily: "Mulish",
    //                               fontStyle:  FontStyle.normal,
    //                               fontSize: 20.0
    //                           ),
    //                           decoration: BoxDecoration(
    //                               border: Border(
    //                                   top: BorderSide.none,
    //                                   bottom: BorderSide.none,
    //                                   left: BorderSide.none,
    //                                   right: BorderSide.none
    //                               )
    //                           ),
    //
    //                         ),
    //                       ),
    //                       Container(
    //                         width: 40,
    //                         height: 40,
    //                         alignment:Alignment.center,
    //                         decoration: BoxDecoration(
    //
    //                             border: Border.all(
    //                                 color: const Color(0x4d000000),
    //                                 width: 1
    //                             ),
    //                             color: const Color(0xb2ffffff)
    //                         ),
    //                         child: CupertinoTextField(
    //                           textAlign: TextAlign.center,
    //                           style:  TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontFamily: 'Mulish',
    //                           ),
    //                           placeholderStyle:TextStyle(
    //                               color:  const Color(0x99000000),
    //                               fontWeight: FontWeight.w400,
    //                               fontFamily: "Mulish",
    //                               fontStyle:  FontStyle.normal,
    //                               fontSize: 20.0
    //                           ),
    //                           decoration: BoxDecoration(
    //                               border: Border(
    //                                   top: BorderSide.none,
    //                                   bottom: BorderSide.none,
    //                                   left: BorderSide.none,
    //                                   right: BorderSide.none
    //                               )
    //                           ),
    //
    //                         ),
    //                       ),
    //                       Container(
    //                         width: 40,
    //                         height: 40,
    //                         alignment:Alignment.center,
    //                         decoration: BoxDecoration(
    //
    //                             border: Border.all(
    //                                 color: const Color(0x4d000000),
    //                                 width: 1
    //                             ),
    //                             color: const Color(0xb2ffffff)
    //                         ),
    //                         child: CupertinoTextField(
    //                           textAlign: TextAlign.center,
    //                           style:  TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontFamily: 'Mulish',
    //                           ),
    //                           placeholderStyle:TextStyle(
    //                               color:  const Color(0x99000000),
    //                               fontWeight: FontWeight.w400,
    //                               fontFamily: "Mulish",
    //                               fontStyle:  FontStyle.normal,
    //                               fontSize: 20.0
    //                           ),
    //                           decoration: BoxDecoration(
    //                               border: Border(
    //                                   top: BorderSide.none,
    //                                   bottom: BorderSide.none,
    //                                   left: BorderSide.none,
    //                                   right: BorderSide.none
    //                               )
    //                           ),
    //
    //                         ),
    //                       ),
    //                       Container(
    //                         width: 40,
    //                         height: 40,
    //                         alignment:Alignment.center,
    //                         decoration: BoxDecoration(
    //
    //                             border: Border.all(
    //                                 color: const Color(0x4d000000),
    //                                 width: 1
    //                             ),
    //                             color: const Color(0xb2ffffff)
    //                         ),
    //                         child: CupertinoTextField(
    //                           textAlign: TextAlign.center,
    //                           style:  TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontFamily: 'Mulish',
    //                           ),
    //                           placeholderStyle:TextStyle(
    //                               color:  const Color(0x99000000),
    //                               fontWeight: FontWeight.w400,
    //                               fontFamily: "Mulish",
    //                               fontStyle:  FontStyle.normal,
    //                               fontSize: 20.0
    //                           ),
    //                           decoration: BoxDecoration(
    //                               border: Border(
    //                                   top: BorderSide.none,
    //                                   bottom: BorderSide.none,
    //                                   left: BorderSide.none,
    //                                   right: BorderSide.none
    //                               )
    //                           ),
    //
    //                         ),
    //                       ),
    //                       Container(
    //                         width: 40,
    //                         height: 40,
    //                         alignment:Alignment.center,
    //                         decoration: BoxDecoration(
    //
    //                             border: Border.all(
    //                                 color: const Color(0x4d000000),
    //                                 width: 1
    //                             ),
    //                             color: const Color(0xb2ffffff)
    //                         ),
    //                         child: CupertinoTextField(
    //                           textAlign: TextAlign.center,
    //                           style:  TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 16,
    //                             fontFamily: 'Mulish',
    //                           ),
    //                           placeholderStyle:TextStyle(
    //                               color:  const Color(0x99000000),
    //                               fontWeight: FontWeight.w400,
    //                               fontFamily: "Mulish",
    //                               fontStyle:  FontStyle.normal,
    //                               fontSize: 20.0
    //                           ),
    //                           decoration: BoxDecoration(
    //                               border: Border(
    //                                   top: BorderSide.none,
    //                                   bottom: BorderSide.none,
    //                                   left: BorderSide.none,
    //                                   right: BorderSide.none
    //                               )
    //                           ),
    //
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //
    //
    //               SizedBox(height: 50,),
    //
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 50,right: 50,top: 30,bottom: 20),
    //                 child: SizedBox(
    //                   width: 300,height: 40,
    //                   child: FlatButton(
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(10),
    //                     ),
    //                     onPressed: (){
    //                       Navigator.pushNamed(context,newpassword );
    //                     },
    //                     color: ColorClass.blueColor,
    //                     hoverColor: Colors.blue.shade900,
    //                     textColor: Colors.white,
    //                     child: Text("Submit",style: TextStyle(fontSize: 16),),
    //                     padding: EdgeInsets.all(10),
    //                   ),
    //                 ),
    //               ),
    //
    //
    //               // Expanded(child: Align(alignment: Alignment.bottomCenter,
    //               //   child: InkWell(
    //               //     onTap: (){
    //               //       Navigator.pop(context);
    //               //     },
    //               //     child: Container(
    //               //       alignment: Alignment.center,height: 40,
    //               //       decoration: BoxDecoration(color: Color(0xfff9f9f9),
    //               //           border: Border.all(color: Colors.black12)),
    //               //       width: MediaQuery.of(context).size.width,
    //               //       child: Text("Back to Login",style: TextStyle(color: Colors.black,fontSize: 17),),
    //               //     ),
    //               //   ),),)
    //
    //
    //             ],),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

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
                                      showCursor: false,
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
                                ],
                              ),
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
                                  Navigator.pushNamed(context,newpassword );
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