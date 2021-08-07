import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/model/UserModal.dart';
import 'package:webrevue/service/Webservice.dart';

GoogleSignIn googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);




class SocialMediaLogins extends StatelessWidget{
  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      // GoogleSignInAuthentication googleSignInAuthentication =  await googleSignInAccount.authentication;
      // print(googleSignInAuthentication.accessToken);
      // print(googleSignInAccount.displayName);
      // print(googleSignInAccount.email);
      // print(googleSignInAccount.id);
      // print(googleSignInAccount.photoUrl);

      UserModal userModal = new UserModal();
      userModal.email = googleSignInAccount.email;
      userModal.firstName = googleSignInAccount.displayName;

      Webservice.socialMediaLogin(
          context, googleSignInAccount.email, googleSignInAccount.displayName,
          false);
    }catch(e){
      print(e);
    }
  }

  // Future<void> _facebookSignIn(BuildContext context) async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //   // by the fault we request the email and the public profile
  //   print(result.message);
  //   if (result.status == LoginStatus.success) {
  //     AccessToken _accessToken = result.accessToken;
  //     // get the user data
  //     // by default we get the userId, email,name and picture
  //     final userData = await FacebookAuth.instance.getUserData();
  //     // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
  //     Map<String,dynamic> _userData = userData;
  //     print(_userData);
  //
  //     if(_userData["email"]!=null &&_userData["email"]!=""){
  //       Webservice.socialMediaLogin(context,_userData["email"],_userData["name"],false);
  //     }else{
  //       displayAlertDialog(context,content: "No Email is Associated with this Facebook Account");
  //      }
  //
  //
  //   } else {
  //     print(result.status);
  //     print(result.message);
  //   }
  //
  // }

  Future<void> _facebookSignIn(BuildContext context) async {
    final LoginResult result = await FacebookAuth.instance.login(); // by the fault we request the email and the public profile
    // print(result.message);
    if (result.status == LoginStatus.success) {
      AccessToken _accessToken = result.accessToken;
      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      Map<String,dynamic> _userData = userData;
      // print(_userData);

      if(_userData["email"]!=null &&_userData["email"]!=""){
        Webservice.socialMediaLogin(context,_userData["email"],_userData["name"],false);
      }else{
        displayAlertDialog(context,content: "No Email is Associated with this Facebook Account",title: "Login");
      }


    } else {
      // print(result.status);
      // print(result.message);
    }

  }



  @override
  Widget build(BuildContext context) {
   return Column(children: [
     Container(
       height: 40,
       width: 350,
       margin: EdgeInsets.only(top: 10, bottom: 5),
       child: ElevatedButton.icon(
           style: ElevatedButton.styleFrom(
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10)),
               primary: ColorClass.blueColor
           ),
           onPressed: () {
             _facebookSignIn(context);
           },
           icon: Icon(
             FontAwesomeIcons.facebookSquare,
             size: 20,
             color: Colors.white,
           ),
           label: Text("Continue with Facebook",
               style: const TextStyle(
                   color: const Color(0xffffffff),
                   fontWeight: FontWeight.w700,
                   fontFamily: "Montserrat",
                   fontStyle: FontStyle.normal,
                   fontSize: 16.0),
               textAlign: TextAlign.left)),
     ),
     Container(
       margin: EdgeInsets.only(top: 10, bottom: 10),
       height: 40,
       width: 350,
       child: ElevatedButton.icon(
           style: ElevatedButton.styleFrom(
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10)),
               primary: Colors.white
           ),
           onPressed: () async{
             _handleGoogleSignIn(context);
           },
           icon: Icon(
             FontAwesomeIcons.google,
             size: 20,
             color: Colors.red,
           ),
           label: Text("Continue with Google",
               style: TextStyle(
                   color: ColorClass.redColor,
                   fontWeight: FontWeight.w700,
                   fontFamily: "Montserrat",
                   fontStyle: FontStyle.normal,
                   fontSize: 16.0),
               textAlign: TextAlign.left)),
     ),

   ],);
  }

}