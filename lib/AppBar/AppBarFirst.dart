import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webrevue/AppBar/popupmenu.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/LoginDashboard/LoginScreen.dart';
import 'package:webrevue/SignUp.dart';
import 'package:webrevue/route/routing_constant.dart';

class AppBarFirst extends StatefulWidget{
  double width;

  AppBarFirst(this.width);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return AppBarFirstState();
  }
}

class AppBarFirstState extends State<AppBarFirst>{
  bool signInHover = false;
  bool showOverlay = false;
  OverlayEntry overlayEntry;
  _hovered(bool hovered) {
    setState(() {
      signInHover = hovered;
    });
  }

  void showIndicator(BuildContext context) {
    // indicatorOffset = getIndicatorOffset(details.localPosition);
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 70.0,
          left: 20,
          right: 20,
          child: Material(
            elevation: 5,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Register to Unlock REVUE",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                          textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Are you paid fairly? Get a free, personalised sala
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Find the right property",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0),
                                      textAlign: TextAlign.left),
                                ),
                                Text(
                                    "Millions of Property."
                                        " Search by what matters to you and find the one thats right for you.",
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign: TextAlign.left)
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Are you paid fairly? Get a free, personalised sala
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Are you paid fairly?",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0),
                                      textAlign: TextAlign.left),
                                ),
                                Text(
                                    "Read anonymous reviews on over 600,000 Properties "
                                        "worldwide from the people that register there.",
                                    style:  TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign: TextAlign.left)
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Are you paid fairly? Get a free, personalised sala
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Compare Properties",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0),
                                      textAlign: TextAlign.left),
                                ),
                                Text(
                                    "Are you paid fairly? Get a free, personalised salary"
                                        " estimate and compare with millions of Property.",
                                    style:  TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0),
                                    textAlign: TextAlign.left)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
  }

  void hideIndicator(BuildContext context) {
    overlayEntry.remove();
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      elevation: 1,
      backgroundColor: Color(0xfff9f9f9),
      actions:<Widget> [
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
          child: InkWell(
            onTap: (){},
            child: Image.asset(
              "assets/images/revue.png",
              fit: BoxFit.cover,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(
              left: 40, right: 20, top: 10, bottom: 10),
          child: InkWell(
            onTap: (){},
            child: FlatButton(
              onPressed: () {
                setState(() {
                  showOverlay = !showOverlay;
                  if (showOverlay == true) {
                    showIndicator(context);
                  } else {
                    hideIndicator(context);
                  }
                });


                // AppBarSecState().showSearchDialog(context);
              },
              focusColor: Colors.yellow,
              child: Row(
                children: [
                  Text(
                    "Find Property",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0),
                  ),
                  Icon(CupertinoIcons.chevron_down,color: Colors.black,)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 40, right: 20, top: 10, bottom: 10),
          child: FlatButton(
            onPressed: () {},
            focusColor: Colors.yellow,
            child: Row(
              children: [
                Text(
                  "Find Property by Owner",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0),
                ),
                Icon(CupertinoIcons.chevron_down,color: Colors.black,)
              ],
            ),
          ),
        ),
        Expanded(child: Container(),),
        Container(height: 80,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: 20, right: 50,top: 5, ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTapDown: (TapDownDetails details){
                  showPopupMenu(details.globalPosition,context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/Profile.png",width: 20,height: 20,fit: BoxFit.contain,),
                    Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: // Profile
                        Text(
                            "Profile",
                            style: const TextStyle(
                                color:  Colors.red,
                                fontWeight: FontWeight.w600,
                                fontStyle:  FontStyle.normal,
                                fontSize: 14.0
                            ),
                            textAlign: TextAlign.left
                        )
                    ),
                  ],),
              ),
            )),
        // Expanded(
        //   child: Align(
        //     alignment: Alignment.centerRight,
        //     child: Padding(
        //       padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 50),
        //       child: MouseRegion(
        //         cursor: SystemMouseCursors.click,
        //         onHover: (_) => _hovered(true),
        //         onExit: (_) => _hovered(false),
        //         child: GestureDetector(
        //           onTap: (){
        //             return showDialog(
        //                 context: context,
        //                 builder: (BuildContext b) {
        //                   return AlertDialog(
        //                     backgroundColor: Colors.white,
        //                     insetPadding: EdgeInsets.all(20),
        //                     contentPadding: EdgeInsets.zero,
        //                     clipBehavior: Clip.antiAliasWithSaveLayer,
        //                     content: SignIn(context),
        //                   );
        //                 });
        //           },
        //           child: Text(
        //             "Sign in",
        //             style:  TextStyle(
        //                 color:signInHover? Colors.black:ColorClass.blueColor,
        //                 fontWeight: FontWeight.w700,
        //                 fontFamily: "Montserrat",
        //                 fontStyle: FontStyle.normal,
        //                 fontSize: 20.0),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }

  Widget SignIn(BuildContext context){
    return Material(
      child: Container(
        height: 540,
        width: 420,
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
          children: [
          Align(alignment: Alignment.topRight,child: IconButton(
            icon: Icon(Icons.clear,color: Colors.black,),onPressed: (){
            Navigator.of(context).pop();
          },
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sign In",style: TextStyle(
                color:  Colors.black,
                fontWeight: FontWeight.w700,
                fontStyle:  FontStyle.normal,
                wordSpacing: 5,letterSpacing: 0.5,
                fontSize: 20.0
            ),textAlign: TextAlign.center,),
          ),

          Container(
            height: 60,
            width: 400,
            margin:  EdgeInsets.only(top: 10, bottom: 20,left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 60,
                    width: 170,
                    child: FlatButton.icon(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black12)),
                        color: ColorClass.blueColor,
                        hoverColor: Colors.blue.shade900,
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.facebookSquare,
                          color: Colors.white,
                        ),
                        label: Text("Facebook",
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height:60,
                    width: 170,
                    child: FlatButton.icon(

                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12)),
                        color: Colors.white,
                        hoverColor: Colors.white,
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                        label: Text("Google",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Row(children: <Widget>[
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  color: Colors.black12,height: 1,
                  ),
            ),
            Text("OR",style: TextStyle( color:Colors.black54,
                fontWeight: FontWeight.w600,
                decorationStyle: TextDecorationStyle.solid,
                fontStyle: FontStyle.normal,
                fontSize: 15.0),),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                color: Colors.black12,height: 1,
              ),
            ),
          ]),
          SizedBox(
            height: 10,
          ),

          Container(
            height: 50,
            width: 200,
            margin: EdgeInsets.only(top: 20, bottom: 10,left: 20,right: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "assets/images/textfieldbg.png")),
            ),
            child: Theme(

              child: TextField(
                cursorColor: ColorClass.lightTextColor,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    suffixIcon: Icon(CupertinoIcons.mail_solid),
                    contentPadding: EdgeInsets.only(
                        left: 15, top: 15, bottom: 15),
                    hintText: "Enter Email",
                    hintStyle: TextStyle(
                      color: Color(0x7f3c2f47),
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.white),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              data: Theme.of(context)
                  .copyWith(primaryColor: ColorClass.redColor,),
            ),
          ),
          Container(
            height: 50,
            width: 200,
            margin: EdgeInsets.only(top: 10, bottom: 10,left: 20,right: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "assets/images/textfieldbg.png")),
            ),
            child: Theme(
              child: TextField(
                cursorColor: ColorClass.lightTextColor,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    suffixIcon: Icon(CupertinoIcons.lock_fill),
                    contentPadding: EdgeInsets.only(
                        left: 15, top: 15, bottom: 15),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: Color(0x7f3c2f47),
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.white),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              data: Theme.of(context)
                  .copyWith(primaryColor: ColorClass.redColor,),
            ),
          ),
          // Forget password?
          Container(
            alignment:Alignment.centerRight,
            margin: EdgeInsets.only( bottom: 10,left: 20,right: 20),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context,forgetPassword);
              },
              child: Text("Forget password?",
                  style:  TextStyle(
                      color: ColorClass.blueColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.end),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20,left: 20,right: 20),
            height: 40,
            width: 200,
            alignment: Alignment.center,
            child: FlatButton(
                color: Colors.black87,
                hoverColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      alignment: Alignment.center,
                      child: Text("Continue with Email",
                          style:  TextStyle(
                              color:Colors.white ,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
          ),

          SizedBox(height: 20,),

          Expanded(child: Align(alignment: Alignment.bottomCenter,
            child: Container(

              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border(top: BorderSide(color: Colors.black54))),
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Text("Don't have an account ?",
                    style: TextStyle(
                        color:Colors.black54,
                        fontWeight: FontWeight.w600,
                        decorationStyle: TextDecorationStyle.solid,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        return showDialog(
                            context: context,
                            builder: (BuildContext b) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                insetPadding: EdgeInsets.all(20),
                                contentPadding: EdgeInsets.zero,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                content: SignUp(context),
                              );
                            });
                      },
                      child: Text("Sign Up",
                        style: TextStyle(
                            color:ColorClass.blueColor,
                            fontWeight: FontWeight.w600,
                            decorationStyle: TextDecorationStyle.solid,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                      ),
                    ),
                  )
                ],),
              ),
            ),),),



        ],),
      ),
    );
  }
}