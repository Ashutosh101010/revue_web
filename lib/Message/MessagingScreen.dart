import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/Message/widget/answerWidget.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/model/QuestionModal.dart';
import 'package:webrevue/service/Webservice.dart';


import '../AppBar/AppBarSec.dart';
import '../constants/ColorClass.dart';
import '../footer/FooterWidget.dart';
import 'QuestionAnswerScreen.dart';

class MessagingScreen extends StatefulWidget{

  CompoundModal compoundModal;

  MessagingScreen(this.compoundModal);

  @override
  State<StatefulWidget> createState() {
   return MessagingScreenState();
  }

}

class MessagingScreenState extends State<MessagingScreen>{

  List questionsList = [];


  @override
  void initState() {
    super.initState();

    print(widget.compoundModal.address);
    print(widget.compoundModal.compoundname);

    getAllQuestions();


  }

  getAllQuestions(){
    Webservice.getAllRequestedQuestions(questionsList, widget.compoundModal.id).then((value) => this.setState(() {

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
                                content: postQuestion(context, constraints.maxWidth),
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
                child: SingleChildScrollView(child: Column(children: [
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
                                            content: postQuestion(context, 600.0),
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
                                widget.compoundModal.compoundname,
                                  style: const TextStyle(
                                      color:  Colors.black87,
                                      fontWeight: FontWeight.w700,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 20.0
                                  ),
                                  textAlign: TextAlign.left
                              ),
                              Row(
                                children: [
                                Icon(CupertinoIcons.location_solid,size: 20,),

                                // Southwest apartments, Green community West,Green C
                                Container(
                                  child: AutoSizeText(widget.compoundModal.address,
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

                              ListView.builder(
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

                                      answerWidget((questionsList[index] as QuestionModal).answerList),




                                      SizedBox(height: 10,),

                                      Divider(color: Color(0x33000000),height: 1,thickness: 1,)
                                    ],),
                                  );
                                },
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


  Widget postQuestion(BuildContext context,double width){
    return Container(
      height: 250,
      width: width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
// Post your question
        Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 10),
          child: Text(
              "Post your question",
              style: const TextStyle(
                  color:  Colors.black87,
                  fontWeight: FontWeight.w600,
                  fontStyle:  FontStyle.normal,
                  fontSize: 18.0
              ),
              textAlign: TextAlign.left
          ),
        ),

        Container(
          height: 50,width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          decoration: BoxDecoration(
              color: Color(0xfffaf7f7),border: Border.all(color: Colors.black26)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.only(left: 15),
                  hintText: "Write your question here",
                  hintStyle: TextStyle(

                    color: Colors.black54,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.white
              ),),
          ),
        ),

        Padding(
          padding:EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          child: Text(
              "Your question might be answered by any user who lived there",
              style: const TextStyle(
                  color:  const Color(0x80000000),
                  fontWeight: FontWeight.w600,
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.left
          ),
        ),

        Expanded(child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                   style: ElevatedButton.styleFrom(minimumSize:Size(width/3, 40) ,
                     primary: Colors.grey.shade500,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(5),
                  ),
                   ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize:Size(width/3, 40) ,
                      primary: ColorClass.blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Post",
                      style:  TextStyle(
                          color:  const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0
                      ),
                    ),
                  ),
                ),
              ],),
          ),
        ),)
      ],),
    );
  }

}