import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/model/UserModal.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/Webservice.dart';

import 'constants/ColorClass.dart';


class SignUp extends StatefulWidget {
  BuildContext context;


  SignUp(this.context);

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
  bool emailValidate = false;
  bool passwordValidate = false;

  bool confirmPasswordValidate = false;
  bool firstNameValidate = false;

  bool lastNameValidate = false;

  bool mobileNumberValidate = false;

  bool validatePassword = false;




  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        height: 700,
        width: 420,     color: Colors.white,
        child: ListView(
          shrinkWrap: true,physics: AlwaysScrollableScrollPhysics(),
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
                            keyboardType: TextInputType.text,
                            controller: firstNameController,
                            // inputFormatters: [WhitelistingTextInputFormatter(RegExp("[A-Z]"))],
                            decoration: InputDecoration(
                              errorText: firstNameValidate?'Enter name':null,
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
                                errorText: lastNameValidate?'Enter name':null,
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
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    validator: (input) => validateEmail(input) ? null : "Check your email",
                    decoration: InputDecoration(
                        errorText: emailValidate?'Enter email address':null,

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
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    controller: mobileNumberController,
                    decoration: InputDecoration(

                        errorText: mobileNumberValidate?'Enter mobile number':null,
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
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        errorText: passwordValidate?'Enter Password':null,

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
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        errorText: confirmPasswordValidate?'Re-type password':null,
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
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  color: ColorClass.blueColor,
                  hoverColor: Colors.blue.shade900,
                  onPressed: (){
                    validateTextField();

                    if(firstNameController.text.isNotEmpty
                        &&lastNameController.text.isNotEmpty
                        &&mobileNumberController.text.isNotEmpty
                    &&passwordController.text.isNotEmpty&&passwordController.text.isNotEmpty
                    &&emailController.text.isNotEmpty){

                      if(passwordController.text==confirmPasswordController.text){
                        if(passwordController.text.length<6){

                        }else{
                          signUpRequest();
                        }

                      }else{
                        displayAlertDialog(context,title: "Create Account",content: "Enter Same Password");
                      }

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


  validateTextField(){
    if(emailController.text.isEmpty){
      setState(() {
        emailValidate= true;
      });
    }
    if(passwordController.text.isEmpty)
    {
      setState(() {
        passwordValidate = true;
      });
    }
    if(confirmPasswordController.text.isEmpty)
    {
      setState(() {
        confirmPasswordValidate = true;
      });
    }
    if(firstNameController.text.isEmpty)
    {
      setState(() {
        firstNameValidate = true;
      });
    }
    if(lastNameController.text.isEmpty)
    {
      setState(() {
        lastNameValidate = true;
      });
    }

    if(mobileNumberController.text.isEmpty)
    {
      setState(() {
        mobileNumberValidate = true;
      });
    }
  }



 signUpRequest()async{
    UserModal userModal = new UserModal();
    userModal.email = emailController.text;
    userModal.password = passwordController.text;
    userModal.firstName = firstNameController.text;
    userModal.lastName = lastNameController.text;
    userModal.mobileNumber = mobileNumberController.text;

    showLoadingDialog(context);
   String register = await Webservice.registerRequest(context, userModal);
   setState(() {

   });
    Navigator.pop(context);

    if(register=="Registration Successful"){
      displayAlertDialog(context,title: "Create Account",content: "Registration Success");
      Navigator.pushReplacementNamed(context,loginRoute);

    }else if(register=="User Already Exist"){
      displayAlertDialog(context,title: "Create Account",content: "User already exist");
      Navigator.popAndPushNamed(context,loginRoute);
    }else{
     await displayAlertDialog(context,title: "Create Account",content: "Unable to create account");
     Navigator.popAndPushNamed(context,loginRoute);
    }




  }



  bool validateEmail(String email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    return emailValid;
  }

}
