import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


import '../AppBar/AppBarSec.dart';
import '../ColorClass.dart';
import '../footer/FooterWidget.dart';
import 'QuestionAnswerScreen.dart';

class MessagingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return MessagingScreenState();
  }

}

class MessagingScreenState extends State<MessagingScreen>{
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
                                  "Trishla villa",
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
                                  child: AutoSizeText(
                                      "Southwest apartments, Green community West,Green Community,Dubai",
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
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (context,index){
                                  return Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                      // Q.Water facilities good or not?
                                      Text(
                                          "Q.  Water facilities good or not?",
                                          style: const TextStyle(
                                              color:  Colors.black87,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 16.0
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                      // Yes,water is available 24 hrs
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "A.  Yes,water is available 24 hrs",
                                                style: const TextStyle(
                                                    color:  Colors.black87,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 14.0
                                                ),
                                                textAlign: TextAlign.left
                                            ),
                                            IconButton(onPressed: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context)=>QuestionAnswerScreen()));
                                            },
                                              icon: Icon(Icons.arrow_forward_ios),)
                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
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
                                                      "Anand bakshi.......",
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
                                              "1 Month ago ",
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
                   style: ElevatedButton.styleFrom(minimumSize: Size(250, 40),
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
                    style: ElevatedButton.styleFrom(minimumSize:Size(250, 40) ,
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