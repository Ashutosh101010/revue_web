import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrevue/constants/keys.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/service/Webservice.dart';

import '../../constants/ColorClass.dart';
import '../../main.dart';
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
  bool passwordHover= false;

  bool skipHover=false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
   return Column(children: [
     Container(
       height: 50,
       width: 350,
       margin: EdgeInsets.only(top: 20, ),
       // color: Colors.white,
       decoration: BoxDecoration(
         image: DecorationImage(
             fit: BoxFit.fill,
             image: AssetImage("assets/images/textfieldbg.png")),
       ),
       child: Theme(
         child: TextField(
           onChanged: (value){
             _emailValidate=false;
           },
           cursorColor: ColorClass.lightTextColor,
           textInputAction: TextInputAction.next,
           controller: emailController,
           decoration: InputDecoration(
             // border: OutlineInputBorder(
             //   borderRadius: BorderRadius.circular(10),
             //   borderSide: BorderSide(color: Colors.grey.shade200)
             // ),

             //errorText: _emailValidate?'Please enter email' : null,
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

     Container(margin: EdgeInsets.only(right: 200,bottom: 10),
       child: Text(_emailValidate?'please enter email':"",
         style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
     ),
     Container(
       height: 50,
       width: 350,
      // margin: EdgeInsets.only(),
       decoration: BoxDecoration(
         image: DecorationImage(
             fit: BoxFit.fill,
             image: AssetImage("assets/images/textfieldbg.png")),
       ),
       child: Theme(
         child: TextField(onChanged: (value){
           setState(() {
             _passwordValidate=false;
           });
         },
           cursorColor: ColorClass.lightTextColor,
           textInputAction: TextInputAction.done,
           controller: passwordController,
           obscureText: true,
           onSubmitted: (string) async{


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

               String loginStatus = await  Webservice.loginRequest(context, userModal);
               setState(() {

               });
               Navigator.pop(context);
               if(loginStatus=="Login Successful"){
                 Navigator.pushNamedAndRemoveUntil(context,mainscreenRoute,(route) => false);

               }

               else if(loginStatus == "Password Not Match"){
                 displayAlertDialog(context,content: "Wrong Username or Password");

               }else if(loginStatus=="User Not Found"){
                 displayAlertDialog(context,content: loginStatus);
               }else{


               }
             }


           },
           decoration: InputDecoration(
            // errorText: _passwordValidate?'Please enter password':null,

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
     Container(margin: EdgeInsets.only(right: 180),
       child: Text(_passwordValidate?'Please enter password':"",
         style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
     ),
     // Forget password?
     Container(
       width: 350,
       alignment: Alignment.centerRight,
       margin: EdgeInsets.only(top: 5, bottom: 10),
       child: InkWell(
         onHover: (value){
           setState(() {
             passwordHover = value;
           });
         },
         onTap: () {
           Navigator.pushNamed(context, forgetPassword);
         },
         child: Text("Forget password?",
             style: TextStyle(
                 color:Color(0xffffffff),
                 fontWeight: passwordHover?FontWeight.w700:FontWeight.w600,
                 fontStyle: FontStyle.normal,
                 fontSize: passwordHover?14.5:14.0),
             textAlign: TextAlign.end),
       ),
     ),
     Container(
       margin: EdgeInsets.only( bottom: 20),
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

               String loginStatus = await  Webservice.loginRequest(context, userModal);
               setState(() {

               });
               Navigator.pop(context);
               if(loginStatus=="Login Successful"){
                 Navigator.pushNamedAndRemoveUntil(context,mainscreenRoute,(route) => false);

               }

               else if(loginStatus == "Password Not Match"){
                 displayAlertDialog(context,content: "Wrong Username or Password");

               }else if(loginStatus=="User Not Found"){
                 displayAlertDialog(context,content: loginStatus);
               }else{


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
     InkWell(
       onHover: (value){
         setState(() {
           skipHover = value;
         });
       },
       onTap: () {
         Navigator.pushNamed(context, mainscreenRoute);
         SharedPreferences.getInstance().then((value) => value.clear());
       },
       child: Text("Continue Without Email",
           style: TextStyle(
               color: Color(0xffffffff),
               fontWeight: skipHover?FontWeight.w700:FontWeight.w600,
               fontStyle: FontStyle.normal,
               fontSize: skipHover?16.5:16.0),
           textAlign: TextAlign.end),
     )
   ],);
  }

}