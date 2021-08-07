import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrevue/Message/widget/postAnswer.dart';
import 'package:webrevue/Message/widget/reportAnswer.dart';
import 'package:webrevue/constants/getDates.dart';
import 'package:webrevue/model/AnswerModal.dart';
import 'package:webrevue/model/LikeUnlikeModal.dart';
import 'package:webrevue/service/Webservice.dart';
import 'dart:html' as html;
import '../AppBar/AppBarSec.dart';
import '../constants/ColorClass.dart';
import '../footer/FooterWidget.dart';

class QuestionAnswerScreen extends StatefulWidget {
 final String compoundId;
  final String question;
 final String questionId;

  QuestionAnswerScreen(
      {Key key, this.compoundId, this.question, this.questionId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return QuestionAnswerScreenState();
  }
}

class QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  int likes = 0;
  int disLikes = 0;

  List<bool> likelist = List.filled(5, true);
  List answerList = [];


  onRefresh(){
    html.window.onBeforeUnload.listen((event) async{
      setState(() {

      });
    });
  }


  @override
  void initState() {
    super.initState();
    getAllAnswers();
  }

  getAllAnswers() {
    Webservice.getAllAnswersRequest(answerList, widget.questionId)
        .then((value) => this.setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          var maxWidth = constraints.maxWidth > 700;
          return SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: maxWidth
                    ? PreferredSize(
                        preferredSize: Size.fromHeight(60),
                        child: AppBarSec(),
                      )
                    : AppBar(
                        backgroundColor: Colors.white,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                        actions: [
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
                                            content: PostAnswer(
                                                constraints.maxWidth,
                                                widget.questionId,
                                                widget.compoundId),
                                          );
                                        });
                                  },
                                  color: ColorClass.blueColor,
                                  hoverColor: Colors.blue.shade900,
                                  textColor: Colors.white,
                                  child: Text(
                                    "Write your Answer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16.0),
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                body: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            maxWidth
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black12)),
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50,
                                          right: 100,
                                          top: 20,
                                          bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  onPressed: () {
                                                    return showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext con) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                Colors.white,
                                                            content: PostAnswer(
                                                              600.0,
                                                                widget
                                                                    .questionId,
                                                                widget
                                                                    .compoundId),
                                                          );
                                                        });
                                                  },
                                                  color: ColorClass.blueColor,
                                                  hoverColor:
                                                      Colors.blue.shade900,
                                                  textColor: Colors.white,
                                                  child: Text(
                                                    "Write your Answer",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xffffffff),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.0),
                                                  ),
                                                  padding: EdgeInsets.all(10),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                            Center(
                              child: Container(
                                alignment: Alignment.topLeft,
                                width: maxWidth
                                    ? MediaQuery.of(context).size.width - 400
                                    : constraints.maxWidth,
                                margin: maxWidth
                                    ? EdgeInsets.only(left: 20, right: 20)
                                    : null,

                                // margin: EdgeInsets.only(left: 50, right: 50,),
                                height: MediaQuery.of(context).size.height,
                                child: ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Q. ${widget.question} ",
                                          style: const TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.0),
                                          textAlign: TextAlign.left),
                                    ),
                                    Divider(
                                      color: Color(0x66000000),
                                      height: 5,
                                      thickness: 1,
                                    ),
                                    answerList.isEmpty
                                        ? Container(
                                            width: double.maxFinite,
                                            // alignment: Alignment.center,

                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            margin: EdgeInsets.only(
                                                top: 15,
                                                bottom: 10,
                                                left: 10,
                                                right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "No Answers Posted",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 17),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Image.asset(
                                                  "assets/images/animatedQues.jpg",
                                                  fit: BoxFit.fill,
                                                  height: 70,
                                                  width: 70,
                                                )
                                              ],
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: answerList.length,
                                              itemBuilder: (context, index) {
                                                return answerWidget(index);
                                              },
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
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
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }

  Widget answerWidget(int index) {
    AnswerModal answer = answerList[index] as AnswerModal;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("A. ${answer.answer}",
                style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.person_circle_fill,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${answer.userName}.......",
                            style: const TextStyle(
                                color: const Color(0x66000000),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.left),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: // 1 Month ago
                      Text(getDate(answer.timestamp),
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Helpful?
                Row(
                  children: [
                    Text("Helpful?",
                        style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        textAlign: TextAlign.left),
                    Row(
                      children: [
                        IconButton(
                          icon: answer.isLiked == true
                              ? Icon(
                                  CupertinoIcons.hand_thumbsup_fill,
                                  color: ColorClass.redColor,
                                )
                              : Icon(CupertinoIcons.hand_thumbsup_fill,
                                  color: Colors.black87),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            LikeUnlikeModal likeUnlike = new LikeUnlikeModal();
                            likeUnlike.id = answer.id;
                            likeUnlike.userID = prefs.getString("userID");

                            if (answer.isLiked) {
                              likeUnlike.operation = -1;
                              (answerList[index] as AnswerModal).like -= 1;
                              (answerList[index] as AnswerModal).isLiked =
                                  false;
                            } else {
                              likeUnlike.operation = 1;
                              (answerList[index] as AnswerModal).like += 1;
                              (answerList[index] as AnswerModal).isLiked = true;

                              if (answer.isDisLiked) {
                                (answerList[index] as AnswerModal).isDisLiked =
                                    false;
                                (answerList[index] as AnswerModal).dislike -= 1;
                              }
                            }
                            Webservice.likeUnlikeRequest(context, likeUnlike);
                            setState(() {});
                          },
                        ),
                        Text(
                          answer.like.toString(),
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: answer.isDisLiked == true
                              ? Icon(
                                  CupertinoIcons.hand_thumbsdown_fill,
                                  color: ColorClass.redColor,
                                )
                              : Icon(
                                  CupertinoIcons.hand_thumbsdown_fill,
                                  color: Colors.black87,
                                ),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            LikeUnlikeModal likeUnlike = new LikeUnlikeModal();
                            likeUnlike.id =
                                (answerList[index] as AnswerModal).id;
                            likeUnlike.userID = prefs.getString("userID");
                            if (answer.isDisLiked) {
                              likeUnlike.operation = -2;
                              (answerList[index] as AnswerModal).dislike -= 1;
                              (answerList[index] as AnswerModal).isDisLiked =
                                  false;
                            } else {
                              likeUnlike.operation = 2;
                              (answerList[index] as AnswerModal).dislike += 1;
                              (answerList[index] as AnswerModal).isDisLiked =
                                  true;
                              if (answer.isLiked) {
                                (answerList[index] as AnswerModal).isLiked =
                                    false;
                                (answerList[index] as AnswerModal).like -= 1;
                              }
                            }
                            Webservice.likeUnlikeRequest(context, likeUnlike);
                            setState(() {});
                          },
                        ),
                        Text(
                         answer.dislike.toString(),
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                        )
                      ],
                    ),
                  ],
                ),

                // Report
                InkWell(
                  onTap: () {
                    return showDialog(
                        context: context,
                        builder: (BuildContext con) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            content: ReportAnswer(500.0,answer.id),
                          );
                        });
                  },
                  child: Text("Report",
                      style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.left),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Color(0x33000000),
            height: 1,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
