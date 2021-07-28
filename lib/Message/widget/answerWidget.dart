import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/Message/QuestionAnswerScreen.dart';
import 'package:webrevue/constants/getDates.dart';
import 'package:webrevue/model/AnswerModal.dart';
import 'package:webrevue/model/arguments/QuestionAnswerArgument.dart';
import 'package:webrevue/route/routing_constant.dart';

Widget answerWidget(BuildContext context,{@required List ansList,
  @required String question,
  @required String questionId,
  @required String compoundId}){
  return SizedBox(
    child: Column(children: [
      ansList.isEmpty?
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("No answers",style:TextStyle(
                color:   Colors.grey,
                fontWeight: FontWeight.w500,
                fontStyle:  FontStyle.normal,
                fontSize: 15.0
            ),),
            IconButton(onPressed: (){
              Navigator.pushNamed(context,answerOfQuestion,arguments:
              QuestionAnswerArgument(compoundID: compoundId,
                  question:question,questionID: questionId ));
            },
              icon: Icon(Icons.arrow_forward_ios),)
          ],
        ),
      ):
          ListView.builder(shrinkWrap: true,
            itemCount: 1,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
            return Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "A. ${(ansList[index] as AnswerModal).answer}",
                        style: const TextStyle(
                            color:  Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontStyle:  FontStyle.normal,
                            fontSize: 14.0
                        ),
                        textAlign: TextAlign.left
                    ),
                    IconButton(onPressed: (){
                      Navigator.pushNamed(context,answerOfQuestion,arguments:
                      QuestionAnswerArgument(compoundID: compoundId,
                          question:question,questionID: questionId ));
                    },
                      icon: Icon(Icons.arrow_forward_ios),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Row(children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.person_circle_fill,color: Colors.grey,size: 14,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "${(ansList[index] as AnswerModal).userName}....",
                              style: const TextStyle(
                                  color:  const Color(0x66000000),
                                  fontWeight: FontWeight.w600,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 12.0
                              ),
                              textAlign: TextAlign.left
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(fit: FlexFit.tight,flex: 1,child: // 1 Month ago
                  Text(
                      getDate((ansList[index] as AnswerModal).timestamp),
                      style: const TextStyle(
                          color:  Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontStyle:  FontStyle.normal,
                          fontSize: 12.0
                      ),
                      textAlign: TextAlign.left
                  ),)
                ],),
              ),
            ],);
            },)

    ],),
  );
}