import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/Message/SearchQuestionWidget.dart';
import 'package:webrevue/Message/widget/answerWidget.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/model/QuestionModal.dart';
import 'package:webrevue/model/arguments/SearchQuestionArgument.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/Webservice.dart';

import 'dart:html' as html;
import '../AppBar/AppBarSec.dart';
import '../constants/ColorClass.dart';
import '../footer/FooterWidget.dart';
import 'QuestionAnswerScreen.dart';
import 'widget/postQuestion.dart';

class MessagingScreen extends StatefulWidget{
  final String compoundID;
  final String compoundName;
  final String compoundAddress;

  MessagingScreen({Key key,this.compoundID, this.compoundName, this.compoundAddress}):super(key: key);

  @override
  State<StatefulWidget> createState() {
   return MessagingScreenState();
  }

}

class MessagingScreenState extends State<MessagingScreen>{
  TextEditingController questionController = new TextEditingController();
  List questionsList = [];
  bool questionvalidate=false;
  onRefresh(){
    html.window.onBeforeUnload.listen((event) async{
      setState(() {

      });
    });
  }


  @override
  void initState() {
    super.initState();

    print(widget.compoundName);
    print(widget.compoundAddress);

    getAllQuestions();


  }

  getAllQuestions(){
    Webservice.getAllRequestedQuestions(questionsList,
        widget.compoundID).then((value) => this.setState(() {

    }));
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context,constraints){
          var maxWidth = constraints.maxWidth>700;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar:
            maxWidth?
            PreferredSize(preferredSize: Size.fromHeight(60),child: AppBarSec(),):
            AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
              actions: [Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 40,
                    width: 200,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onPressed: () {
                        return showDialog(
                            context: context,
                            builder: (BuildContext con) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                content: PostQuestion(compoundId: widget.compoundID,
                                  compoundName:widget.compoundName ,width: constraints.maxWidth,),
                              );
                            });
                      },
                      color: ColorClass.blueColor,
                      hoverColor: Colors.blue.shade900,
                      textColor: Colors.white,
                      child: Text(
                        "Write your Question",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:  const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontStyle:  FontStyle.normal,
                            fontSize: 16.0
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              )],
            ),
            body: Column(children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(children: [
                  maxWidth?
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12)),
                    margin: EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50,right: 100,top: 20,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),

                          // Question & Answers
                          Text(" Question & Answers",
                              style: TextStyle(
                                  color: ColorClass.redColor,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0),
                              textAlign: TextAlign.left),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                height: 40,
                                width: 200,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  onPressed: () {
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext con) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white,
                                            content: PostQuestion(compoundId: widget.compoundID,
                                              compoundName:widget.compoundName ,width: constraints.maxWidth,),
                                          );
                                        });
                                  },
                                  color: ColorClass.blueColor,
                                  hoverColor: Colors.blue.shade900,
                                  textColor: Colors.white,
                                  child: Text(
                                    "Write your Question",
                                    textAlign: TextAlign.center,
                                    style:  TextStyle(
                                        color:  const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.0
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ):Container(),
                  Center(
                      child: Container(
                        width: maxWidth?
                        MediaQuery.of(context).size.width-400:
                        constraints.maxWidth,
                        color: Colors.white,
                        margin: maxWidth?EdgeInsets.only(left: 20,right: 20):null,
                        height: MediaQuery.of(context).size.height,
                        child:  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              AutoSizeText(
                                widget.compoundName,
                                  style: const TextStyle(
                                      color:  Colors.black87,
                                      fontWeight: FontWeight.w700,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 20.0
                                  ),
                                  textAlign: TextAlign.left
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: [
                                  Icon(CupertinoIcons.location_solid,size: 20,),

                                  // Southwest apartments, Green community West,Green C
                                  Container(
                                    child: AutoSizeText(widget.compoundAddress,
                                        style:  TextStyle(
                                            color:Colors.black54  ,
                                            fontWeight: FontWeight.w600,

                                            fontStyle:  FontStyle.normal,
                                            fontSize: maxWidth?14.0:12,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.left
                                    ),
                                  )
                                ],),
                              ),

                              Container(
                                margin:
                                EdgeInsets.only(top: 15, left: 10, right: 50,bottom: 15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Color(0x33000000), width: 1)),
                                child: InkWell(
                                  mouseCursor: SystemMouseCursors.click,
                                  onTap: (){
                                    if(maxWidth){
                                      showDialog(context: context,
                                          builder: (context){
                                        return AlertDialog(
                                          insetPadding:
                                          maxWidth?
                                          EdgeInsets.only(left: 100,right: 100,top: 50,bottom: 50):
                                          EdgeInsets.all(5),
                                          contentPadding: EdgeInsets.all(10),
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          content: SearchQuestion(questionsList,widget.compoundID,widget.compoundName),
                                        );
                                      });
                                    }else{
                                      Navigator.pushNamed(context,searchQuestion,
                                          arguments: SearchQuestionArgument(
                                              questionsList,widget.compoundID,widget.compoundName
                                          ));
                                    }


                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          CupertinoIcons.search,
                                          size: 20,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: // Questions
                                          Text(
                                              "Search Questions",
                                              style: const TextStyle(
                                                  color:  Colors.black54,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 16.0
                                              ),
                                              textAlign: TextAlign.left
                                          )),
                                    ],
                                  ),
                                ),
                              ),

                              questionsList.isEmpty?
                              Container(
                                width: double.maxFinite,
                                alignment: Alignment.center,

                                height: MediaQuery.of(context).size.height,
                                margin: EdgeInsets.only(top: 15,bottom: 10,left: 10,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("No Questions Posted",
                                      style: TextStyle(color: Colors.black87,
                                          fontWeight: FontWeight.w500,fontSize: 17),),
                                    SizedBox(height: 6,),
                                    Image.asset("assets/images/animatedQues.jpg",
                                      fit: BoxFit.fill,height: 50,width: 50,)

                                  ],
                                ),
                              ):
                              Container(
                                width: double.maxFinite,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:questionsList.length,
                                  itemBuilder: (context,index){
                                    return Container(
                                      margin: EdgeInsets.all(10),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                        // Q.Water facilities good or not?
                                        Text(
                                            "Q${index+1}. ${(questionsList[index] as QuestionModal).question} ?",
                                            style: const TextStyle(
                                                color:  Colors.black87,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:  FontStyle.normal,
                                                fontSize: 16.0
                                            ),
                                            textAlign: TextAlign.left
                                        ),

                                        answerWidget(context,
                                            ansList:(questionsList[index] as QuestionModal).answerList,
                                        question: (questionsList[index] as QuestionModal).question,
                                        compoundId: widget.compoundID,
                                        questionId: (questionsList[index] as QuestionModal).id),

                                        SizedBox(height: 10,),

                                        Divider(color: Color(0x33000000),height: 1,thickness: 1,)
                                      ],),
                                    );
                                  },
                                ),
                              )

                            ],),
                        ),

                      )),
                  SizedBox(height: 60,),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: const Color(0x40000000),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0)
                      ], color: const Color(0x4d000000))),
                  FooterWidget()

                ],),),
              )
            ],),

          );
        },
      ),
    );
  }




}