import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/model/UserModal.dart';
import 'package:webrevue/service/Webservice.dart';

import 'constants/ColorClass.dart';


class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController mobileNumberController = new TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        height: 700,
        width: 420,     color: Colors.white,
        child: ListView(
          shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
         children: [
            // Create Account
            Align(alignment: Alignment.topRight,child: IconButton(
              icon: Icon(Icons.clear,color: Colors.black,),onPressed: (){
                Navigator.pop(context);
            },
            )),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20,bottom: 10),
              child: Text(
                  "Create Account",
                  style:  TextStyle(
                      color:  ColorClass.redColor,
                      fontWeight: FontWeight.w700,
                      fontStyle:  FontStyle.normal,
                      wordSpacing: 5,letterSpacing: 0.5,
                      fontSize: 25.0
                  ),
                  textAlign: TextAlign.left
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20,  top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Name
                        Text("First Name",
                            style:  TextStyle(
                                color: ColorClass.blueColor,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.left),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            controller: firstNameController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0x66000000)),
                                ),
                                fillColor: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,  top: 20
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Name
                        Text("Last Name",
                            style:  TextStyle(
                                color:ColorClass.blueColor,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                            textAlign: TextAlign.start),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            controller: lastNameController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0x66000000)),
                                ),
                                fillColor: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20,  top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Name
                  Text("Email Address",
                      style:  TextStyle(
                          color: ColorClass.blueColor,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                  TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0x66000000)),
                        ),
                        fillColor: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20,  top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Name
                  Text("Mobile No.",
                      style:  TextStyle(
                          color: ColorClass.blueColor ,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                  TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    controller: mobileNumberController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0x66000000)),
                        ),
                        fillColor: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20, right: 20,  top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Name
                  Text("Password",
                      style:  TextStyle(
                          color:ColorClass.blueColor ,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                  TextField(
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0x66000000)),
                        ),
                        fillColor: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Name
                  Text("Confirm Password",
                      style: TextStyle(
                          color:ColorClass.blueColor ,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                  TextField(
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0x66000000)),
                        ),
                        fillColor: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
                width: 300,height: 40,
                margin: EdgeInsets.only(left: 40, right: 40, top: 40,bottom: 40),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  color: ColorClass.blueColor,
                  hoverColor: Colors.blue.shade900,
                  onPressed: (){
                    if(firstNameController.text.isNotEmpty
                        &&lastNameController.text.isNotEmpty
                        &&mobileNumberController.text.isNotEmpty
                    &&passwordController.text.isNotEmpty&&passwordController.text.isNotEmpty
                    &&emailController.text.isNotEmpty){

                      if(passwordController.text==confirmPasswordController.text){
                        signUpRequest();
                      }else{
                        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Enter Same Password")));
                      }

                    }else{
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Please complete all Fields")));

                    }



                  },
                  child: Text(
                    "Sign Up",
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                  ),

                )),
          ],
        ),
      ),
    );
  }



 signUpRequest()async{
    UserModal userModal = new UserModal();
    userModal.email = emailController.text;
    userModal.password = passwordController.text;
    userModal.firstName = firstNameController.text;
    userModal.lastName = lastNameController.text;
    userModal.mobileNumber = mobileNumberController.text;

    showLoadingDialog(context);
   bool register = await Webservice.registerRequest(context, userModal);
   setState(() {

   });
    Navigator.pop(context);

    if(register==true){
      displayAlertDialog(context,title: "Create Account",content: "Registration Success");

    }else{
      displayAlertDialog(context,title: "Create Account",content: "Unable to Register");
    }

  }
}
