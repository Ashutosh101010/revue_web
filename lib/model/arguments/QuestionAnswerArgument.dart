import 'package:flutter/material.dart';
import 'package:webrevue/model/QuestionModal.dart';

class QuestionAnswerArgument{
 final String compoundID;
final  String questionID;
 final String question;

 QuestionAnswerArgument(
 {@required this.compoundID,@required this.question,@required this.questionID});
}