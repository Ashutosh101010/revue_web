import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/service/Webservice.dart';

import '../../constants/ColorClass.dart';
import '../../model/UserModal.dart';
import '../../route/routing_constant.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }

}



class LoginPageState extends State<LoginPage>{
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _emailValidate = false;
  bool _passwordValidate = false;


  @override
  Widget build(BuildContext context) {
   return Column(children: [
     Container(
       height: 50,
       width: 350,
       margin: EdgeInsets.only(top: 20, bottom: 10),
       // color: Colors.white,
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
             // border: OutlineInputBorder(
             //   borderRadius: BorderRadius.circular(10),
             //   borderSide: BorderSide(color: Colors.grey.shade200)
             // ),
             errorText: _emailValidate?'Please enter email' : null,
               errorBorder: InputBorder.none,
               focusedErrorBorder: InputBorder.none,
               border: InputBorder.none,
               suffixIcon: Icon(CupertinoIcons.mail_solid),
               contentPadding:
               EdgeInsets.only(left: 15, top: 15, bottom: 15),
               hintText: "Enter Email",
               hintStyle: TextStyle(
                 color: Color(0x7f3c2f47),
                 fontSize: 15,
               ),
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
           obscureText: true,
           decoration: InputDecoration(
             errorText: _passwordValidate?'Please enter password':null,

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
             if(emailController.text.isEmpty){
               setState(() {
                 _emailValidate = !_emailValidate;
               });
             }else if(passwordController.text.isEmpty){
               setState(() {
                 _passwordValidate= !_passwordValidate;
               });
             }else{

               UserModal userModal = new UserModal();
               userModal.email = emailController.text;
               userModal.password = passwordController.text;

               showLoadingDialog(context);

               bool loginStatus = await  Webservice.loginRequest(context, userModal);
               setState(() {

               });
               Navigator.pop(context);
               if(loginStatus == true){
                 // Navigator.of(context).pop();
                 Navigator.pushReplacementNamed(context,mainscreenRoute);
               }else{
                 displayAlertDialog(context,content: "Unable to Login");
               }
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