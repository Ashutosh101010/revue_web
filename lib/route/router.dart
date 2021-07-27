

import 'package:flutter/material.dart';
import 'package:webrevue/LoginDashboard/LoginScreen.dart';
import 'package:webrevue/Message/MessagingScreen.dart';
import 'package:webrevue/Message/QuestionAnswerScreen.dart';
import 'package:webrevue/SignUp.dart';
import 'package:webrevue/User/ForgetPassword.dart';
import 'package:webrevue/Review/MyReviews.dart';
import 'package:webrevue/User/OtpVerification.dart';
import 'package:webrevue/User/UpdatePassword.dart';
import 'package:webrevue/compound/AddReview.dart';
import 'package:webrevue/compound/CompoundDetails.dart';
import 'package:webrevue/constants/keys.dart';
import 'package:webrevue/home/CompoundList.dart';
import 'package:webrevue/compound/FilterScreen.dart';
import 'package:webrevue/model/arguments/AddReviewArgument.dart';
import 'package:webrevue/model/arguments/CompoundArgument.dart';
import 'package:webrevue/model/arguments/CompoundMessagingArgument.dart';
import 'package:webrevue/model/arguments/QuestionAnswerArgument.dart';
import 'package:webrevue/route/routing_constant.dart';


  Route<dynamic> generateRoute(RouteSettings settings){
    CompoundArgument compoundArgument;
    CompoundMessagingArgument compoundMessagingArgument;
    QuestionAnswerArgument questionAnswerArgument;
    AddReviewArgument addReviewArgument;
    if(settings.name == compoundDetails){
      compoundArgument = settings.arguments;
    }
    if(settings.name == questionAns){
      compoundMessagingArgument = settings.arguments;
    }
    if(settings.name == answerOfQuestion){
      questionAnswerArgument = settings.arguments;
    }
    if(settings.name == addreview){
      addReviewArgument = settings.arguments;
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
            CompoundDetails(
              key: GlobalKeys.compoundDetailsKey,
              compoundID: compoundArgument.compoundId,
              compoundName: compoundArgument.compoundName,
            images: compoundArgument.images,
            address: compoundArgument.address,),
            settings: RouteSettings(name: "/compoundDetail",),maintainState: true);
        break;
      case addreview:
        return MaterialPageRoute(builder: (context) =>
            AddReview(
                key: GlobalKeys.addReviewClassKey,
              compoundID:   addReviewArgument.compoundId,
               compoundName:  addReviewArgument.compoundName,
               images: addReviewArgument.images,
            address: addReviewArgument.address,),
            settings: RouteSettings(name: "/addreview"));
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

        return MaterialPageRoute(builder: (context)=>
            MessagingScreen(
              key: GlobalKeys.postQuestionClassKey,
              compoundID: compoundMessagingArgument.compoundID,
              compoundName: compoundMessagingArgument.compoundName,
            compoundAddress: compoundMessagingArgument.compoundAddress,),
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

      case answerOfQuestion:
        return MaterialPageRoute(builder: (context)=>
            QuestionAnswerScreen(key: GlobalKeys.postAnswerClassKey,
            compoundId: questionAnswerArgument.compoundID,
            question: questionAnswerArgument.question,
            questionId: questionAnswerArgument.questionID,),

            settings: RouteSettings(name: "/question-answer"));


      default:
        return MaterialPageRoute(builder: (context) => LoginScreen(),settings: RouteSettings(name: "/login"));
        break;
    }
  }
