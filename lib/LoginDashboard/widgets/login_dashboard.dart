import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/service/Webservice.dart';

import '../../constants/ColorClass.dart';
import '../../model/UserModal.dart';
import '../../route/routing_constant.dart';

class LoginPage extends StatelessWidget{
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Column(children: [
     Container(
       height: 50,
       width: 350,
       margin: EdgeInsets.only(top: 20, bottom: 10),
       decoration: BoxDecoration(
         image: DecorationImage(
             fit: BoxFit.fill,
             image: AssetImage("assets/images/textfieldbg.png")),
       ),
       child: Theme(
         child: TextField(
           cursorColor: ColorClass.lightTextColor,
           textInputAction: TextInputAction.next,
           controller: emailController,
           decoration: InputDecoration(
               suffixIcon: Icon(CupertinoIcons.mail_solid),
               contentPadding:
               EdgeInsets.only(left: 15, top: 15, bottom: 15),
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
         data: Theme.of(context).copyWith(
           primaryColor: ColorClass.redColor,
         ),
       ),
     ),
     Container(
       height: 50,
       width: 350,
       margin: EdgeInsets.only(bottom: 10),
       decoration: BoxDecoration(
         image: DecorationImage(
             fit: BoxFit.fill,
             image: AssetImage("assets/images/textfieldbg.png")),
       ),
       child: Theme(
         child: TextField(
           cursorColor: ColorClass.lightTextColor,
           textInputAction: TextInputAction.done,
           controller: passwordController,
           decoration: InputDecoration(
               suffixIcon: Icon(CupertinoIcons.lock_fill),
               contentPadding:
               EdgeInsets.only(left: 15, top: 15, bottom: 15),
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
         data: Theme.of(context).copyWith(
           primaryColor: ColorClass.redColor,
         ),
       ),
     ),
     // Forget password?
     Container(
       width: 350,
       alignment: Alignment.centerRight,
       margin: EdgeInsets.only(top: 10, bottom: 10),
       child: InkWell(
         onTap: () {
           Navigator.pushNamed(context, forgetPassword);
         },
         child: Text("Forget password?",
             style: TextStyle(
                 color: Color(0xffffffff),
                 fontWeight: FontWeight.w600,
                 fontStyle: FontStyle.normal,
                 fontSize: 14.0),
             textAlign: TextAlign.end),
       ),
     ),
     Container(
       margin: EdgeInsets.only(top: 10, bottom: 20),
       height: 40,
       width: 350,
       alignment: Alignment.center,
       child: ElevatedButton(
           style: ElevatedButton.styleFrom(
             elevation: 3,
             primary: Colors.black,
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10)),),

           onPressed: () async{
             UserModal userModal = new UserModal();
             userModal.email = emailController.text;
             userModal.password = passwordController.text;

             showLoadingDialog(context);

           bool loginStatus = await  Webservice.loginRequest(context, userModal);
             Navigator.pop(context);
           if(loginStatus == true){
             Navigator.pushNamed(context, mainscreenRoute);
           }else{
             displayAlertDialog(context,content: "Unable to Login");
           }
           },
           child: Row(
             children: [
               Container(
                 width: 300,
                 alignment: Alignment.center,
                 child: Text("Continue with Email",
                     style: TextStyle(
                         color: Colors.white,
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
   ],);
  }

}