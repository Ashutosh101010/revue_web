

import 'package:flutter/material.dart';
import 'package:webrevue/LoginDashboard/LoginScreen.dart';
import 'package:webrevue/Message/MessagingScreen.dart';
import 'package:webrevue/SignUp.dart';
import 'package:webrevue/User/ForgetPassword.dart';
import 'package:webrevue/Review/MyReviews.dart';
import 'package:webrevue/User/OtpVerification.dart';
import 'package:webrevue/User/UpdatePassword.dart';
import 'package:webrevue/compound/AddReview.dart';
import 'package:webrevue/compound/CompoundDetails.dart';
import 'package:webrevue/home/CompoundList.dart';
import 'package:webrevue/compound/FilterScreen.dart';
import 'package:webrevue/model/arguments/CompoundArgument.dart';
import 'package:webrevue/model/arguments/CompoundMessagingArgument.dart';
import 'package:webrevue/route/routing_constant.dart';


  Route<dynamic> generateRoute(RouteSettings settings){
    CompoundArgument compoundArgument;
    CompoundMessagingArgument compoundMessagingArgument;
    if(settings.name ==compoundDetails){
      compoundArgument = settings.arguments;
    }
    switch(settings.name) {
      case initialroute:
        return MaterialPageRoute(builder: (context) => LoginScreen(),settings: RouteSettings(name: "/login"),);
        break;

      case loginRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen(),settings: RouteSettings(name: "/login"));
        break;
      case mainscreenRoute:
        return MaterialPageRoute(builder: (context) => CompoundList(compoundListKey:compoundListKey ,),
            settings: RouteSettings(name: "/home"));
        break;

      case compoundDetails:
        return MaterialPageRoute(builder: (context) =>
            CompoundDetails(compoundID: compoundArgument.compoundId,),
            settings: RouteSettings(name: "/compoundDetail",),maintainState: true);
        break;
      case addreview:
        return MaterialPageRoute(builder: (context) => AddReview(),settings: RouteSettings(name: "/addreview"));
        break;

      case forgetPassword:
        return MaterialPageRoute(builder: (context)=>ForgetPassword(),settings: RouteSettings(name: "/forgetpassword"));
        break;

      case otpVerification:
        return MaterialPageRoute(builder: (context)=>OtpVerification(),
            settings: RouteSettings(name: "/verifyotp"));
        break;

      case newpassword:
        return MaterialPageRoute(builder: (context)=>UpdatePassword(),settings: RouteSettings(name: "/new-password"));
        break;

      case questionAns:

        compoundMessagingArgument =  settings.arguments;

        return MaterialPageRoute(builder: (context)=>
            MessagingScreen(compoundMessagingArgument.compoundModal),
            settings: RouteSettings(name: "/messages"));
        break;


      case filtercompound:
        return MaterialPageRoute(builder: (context)=>FilterScreen(),settings: RouteSettings(name: "/filter"));
        break;

      case myreviews:
        return MaterialPageRoute(builder: (context)=>MyReviews(),settings: RouteSettings(name: "/my-reviews"));
        break;

      case signup:
        return MaterialPageRoute(builder: (context)=>SignUp(),settings: RouteSettings(name: "/signup"));
        break;

      default:
        return MaterialPageRoute(builder: (context) => LoginScreen(),settings: RouteSettings(name: "/login"));
        break;
    }
  }
