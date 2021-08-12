import 'package:flutter/material.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/keys.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/model/MessagingModal.dart';
import 'package:webrevue/service/Webservice.dart';

class PostQuestion extends StatefulWidget{
  double width;
  String compoundId;
  String compoundName;


  PostQuestion({@required this.width, @required this.compoundId , @required this.compoundName});

  @override
  _PostQuestionState createState() => _PostQuestionState();
}

class _PostQuestionState extends State<PostQuestion> {
  TextEditingController questionController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
bool questionvalidate=false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: 250,
        width: widget.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
// Post your question
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 10),
            child: Text(
                "Write your question",
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
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10,right: 10,top: 10,),
            decoration: BoxDecoration(
                color: Color(0xfffaf7f7),border: Border.all(color: Colors.black26)
            ),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
              controller: questionController,
              onChanged: (value){
                setState(() {
                  questionvalidate=false;
                });
              },
              expands: true,
              maxLines: null,
              minLines: null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
                  hintText: "Write your question here",
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.white
              ),
            ),
          ),
          Container(margin: EdgeInsets.only(left: 10),
            child: Text(questionvalidate?'please enter question':"",
              style: TextStyle(color: Colors.red),),
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
              width: widget.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(minimumSize:Size(widget.width/4, 40) ,
                        primary: Colors.grey.shade500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        if(questionController.text.isNotEmpty){
                          questionController.clear();
                        }
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
                      style: ElevatedButton.styleFrom(minimumSize:Size(widget.width/4, 40) ,
                        primary: ColorClass.blueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
      if (_formKey.currentState.validate()) {
        if (questionController.text.isNotEmpty || questionController.text != "") {
          MessagingModal messaging = new MessagingModal();
          messaging.question = questionController.text;
          messaging.compoundID = widget.compoundId;
          messaging.compoundName = widget.compoundName;
          messaging.timestamp = DateTime
              .now()
              .millisecondsSinceEpoch;

          Webservice.postQuestionRequest(context, messaging);
        }
      }

                     //   else{

                       //   Navigator.pop(context);
                       //   displayAlertDialog(context,title: "Post Question",
                       //       content: "Empty Question Cannot Be Posted");
                       // }

                        if (questionController.text.isEmpty)
                        {
                         setState(() {
                       questionvalidate=true;
                          });
                        }
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
      ),
    );
  }

}