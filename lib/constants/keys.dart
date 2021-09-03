import 'package:flutter/cupertino.dart';
import 'package:webrevue/Message/MessagingScreen.dart';
import 'package:webrevue/Message/QuestionAnswerScreen.dart';
import 'package:webrevue/TabWidget/CompoundDetailTab.dart';
import 'package:webrevue/add_review/AddReview.dart';
import 'package:webrevue/add_review/views/addReview_first_form.dart';
import 'package:webrevue/add_review/views/addReview_forth_form.dart';
import 'package:webrevue/add_review/views/addReview_second_form.dart';
import 'package:webrevue/add_review/views/addReview_third_form.dart';
import 'package:webrevue/add_review/views/add_image.dart';
import 'package:webrevue/compound/CompoundDetails.dart';
import 'package:webrevue/home/CompoundList.dart';

class GlobalKeys{
  static final postQuestionClassKey = new GlobalKey<MessagingScreenState>();
  static final postAnswerClassKey = new GlobalKey<QuestionAnswerScreenState>();
  static final addReviewClassKey = new GlobalKey<AddReviewState>();
  static final addReviewFirstKey = new GlobalKey<AddReviewFirstFormState>();
  static final addReviewSecondKey = new GlobalKey<AddReviewSecondFormState>();
  static final addReviewThirdKey = new GlobalKey<AddReviewThirdFormState>();
  static final addReviewForthKey = new GlobalKey<AddReviewForthFormState>();
  static final compoundDetailsKey = new GlobalKey<CompoundDetailState>();
  static final addReviewImagesKey = new GlobalKey<AddImageReviewState>();
  static final compoundListKey =  new GlobalKey<CompoundListState>();
  static final compoundDetailTabKey  = new GlobalKey<CompoundDetailState>();


 static  final navKey = new GlobalKey<NavigatorState>();
}