import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../AppBar/AppBarSec.dart';
import '../ColorClass.dart';
import '../footer/FooterWidget.dart';

class QuestionAnswerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuestionAnswerScreenState();
  }
}

class QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  int likes = 0;
  int disLikes = 0;

  List<bool> likelist = List.filled(5, true);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          var maxWidth = constraints.maxWidth > 700;
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar:
               maxWidth? PreferredSize(preferredSize: Size.fromHeight(60),child: AppBarSec(),):
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
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () {
                            return showDialog(
                                context: context,
                                builder: (BuildContext con) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    content:
                                    postAnswer(context, 600.0),
                                  );
                                });
                          },
                          color: ColorClass.blueColor,
                          hoverColor: Colors.blue.shade900,
                          textColor: Colors.white,
                          child: Text(
                            "Write your Question",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  )],
                ),
                body:Column(children: [
                  Expanded(child: SingleChildScrollView(child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    children: [
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
                                      fontSize: 25.0),
                                  textAlign: TextAlign.left),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    height: 40,
                                    width: 200,
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      onPressed: () {
                                        return showDialog(
                                            context: context,
                                            builder: (BuildContext con) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                content:
                                                postAnswer(context, 600.0),
                                              );
                                            });
                                      },
                                      color: ColorClass.blueColor,
                                      hoverColor: Colors.blue.shade900,
                                      textColor: Colors.white,
                                      child: Text(
                                        "Write your Answer",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16),
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
                          alignment: Alignment.topLeft,
                          width:maxWidth?
                          MediaQuery.of(context).size.width-400:
                          constraints.maxWidth,
                          margin: maxWidth?EdgeInsets.only(left: 20,right: 20):null,

                          // margin: EdgeInsets.only(left: 50, right: 50,),
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Q1.  Water facilities good or not?",
                                    style: const TextStyle(
                                        color: const Color(0xe5000000),
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal, fontSize: 18.0),
                                    textAlign: TextAlign.left),
                              ),
                              Divider(
                                color: Color(0x66000000),
                                height: 5,
                                thickness: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:5,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                "A.  Yes,water is available 24 hrs",
                                                style: const TextStyle(
                                                    color: const Color(0xff000000),
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.0),
                                                textAlign: TextAlign.left),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  flex: 2,
                                                  fit: FlexFit.tight,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        CupertinoIcons
                                                            .person_circle_fill,
                                                        color: Colors.grey,
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.all(8.0),
                                                        child: Text(
                                                            "Anand bakshi.......",
                                                            style: const TextStyle(
                                                                color: const Color(
                                                                    0x66000000),
                                                                fontWeight:
                                                                FontWeight.w600,
                                                                fontStyle:
                                                                FontStyle.normal,
                                                                fontSize: 15.0),
                                                            textAlign:
                                                            TextAlign.left),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  flex: 1,
                                                  child: // 1 Month ago
                                                  Text("1 Month ago ",
                                                      style: const TextStyle(
                                                          color: const Color(
                                                              0x80000000),
                                                          fontWeight:
                                                          FontWeight.w600,

                                                          fontStyle:
                                                          FontStyle.normal,
                                                          fontSize: 15.0),
                                                      textAlign: TextAlign.left),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                // Helpful?
                                                Row(
                                                  children: [
                                                    Text("Helpful?",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0x80000000),
                                                            fontWeight:
                                                            FontWeight.w600,

                                                            fontStyle:
                                                            FontStyle.normal,
                                                            fontSize: 15.0),
                                                        textAlign: TextAlign.left),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          icon: likelist[index]
                                                              ? Icon(
                                                            Icons.thumb_up,
                                                            color: Colors.black,
                                                          )
                                                              : Icon(
                                                            Icons.thumb_up,
                                                            color: Colors.red,
                                                          ),
                                                          onPressed: () {
                                                            setState(() {
                                                              likelist[index] =
                                                              !likelist[index];
                                                            });
                                                          },
                                                        ),
                                                        Text(
                                                          likes.toString(),
                                                          style: const TextStyle(
                                                              color: const Color(
                                                                  0xcc000000),
                                                              fontWeight:
                                                              FontWeight.w600,

                                                              fontStyle:
                                                              FontStyle.normal,
                                                              fontSize: 20.0),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          icon:
                                                          Icon(Icons.thumb_down),
                                                          onPressed: () {},
                                                        ),
                                                        Text(
                                                          disLikes.toString(),
                                                          style: const TextStyle(
                                                              color: const Color(
                                                                  0xcc000000),
                                                              fontWeight:
                                                              FontWeight.w600,

                                                              fontStyle:
                                                              FontStyle.normal,
                                                              fontSize: 20.0),
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
                                                            backgroundColor:
                                                            Colors.white,
                                                            content: reportAnswer(context, 500.0),
                                                          );
                                                        });
                                                  },
                                                  child: Text("Report",
                                                      style: const TextStyle(
                                                          color:
                                                          const Color(0xcc000000),
                                                          fontWeight: FontWeight.w600,

                                                          fontStyle: FontStyle.normal,
                                                          fontSize: 15.0),
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
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

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



                    ],
                  ),),)
                ],)
              ),
            );

        },
      ),
    );
  }

  Widget postAnswer(BuildContext context, double width) {
    return Container(
      height: 300,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
// Post your question
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text("Write your Answer",
                  style: const TextStyle(
                      color: const Color(0xe5000000),
                      fontWeight: FontWeight.w600,

                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                  textAlign: TextAlign.left),
            ),

            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Color(0xfffaf7f7),
                  border: Border.all(color: Colors.black26)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      // contentPadding: EdgeInsets.only(left: 15),
                      hintText: "Write your Answer here",
                      hintStyle: TextStyle(
                        color: Color(0x7f3c2f47),
                        fontSize: 18,

                      ),
                      border: InputBorder.none,
                      fillColor: Colors.white),
                ),
              ),
            ),

            Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: // Your answer will shown among the oyher answer.
                    Text("Your answer will shown among the other answer.",
                        style: const TextStyle(
                            color: const Color(0x80000000),
                            fontWeight: FontWeight.w600,

                            fontStyle: FontStyle.normal,
                            fontSize: 15.0),
                        textAlign: TextAlign.left)),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Color(0xffb2b2b2),
                          textColor: Colors.white,
                          child: Text(
                            "Cancel",
                            style: TextStyle(fontSize: 16),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: ColorClass.blueColor,
                          hoverColor: Colors.blue.shade900,
                          textColor: Colors.white,
                          child: Text(
                            "Post",
                            style: TextStyle(fontSize: 16),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget reportAnswer(BuildContext context, double width) {
    return Container(
      height: 250,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
// Post your question
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                child: // Report
                    Text("Report",
                        style: const TextStyle(
                            color: const Color(0xe5000000),
                            fontWeight: FontWeight.w600,

                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        textAlign: TextAlign.left)),

            Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: // If you find this content inappropriate and think i
                    Text(
                        "If you find this content inappropriate and think it should be removed from this website,let us know by clicking the butto below.",
                        style: const TextStyle(
                            color: const Color(0x80000000),
                            fontWeight: FontWeight.w600,

                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left)),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40,
                  width: 300,
                  margin: EdgeInsets.all(10),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {},
                    color: ColorClass.blueColor,
                    hoverColor: Colors.blue.shade900,
                    textColor: Colors.white,
                    child: Text(
                      "Report",
                      style: TextStyle(fontSize: 16),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
