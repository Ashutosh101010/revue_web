import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/model/AnswerModal.dart';
import 'package:webrevue/service/Webservice.dart';

class PostAnswer extends StatelessWidget{
  double width;
  String questionId;
  String compoundId;



  PostAnswer(this.width,this.questionId,this.compoundId);
  TextEditingController answerController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.multiline,
                  controller: answerController,
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15,top: 15,bottom: 15),
                      hintText: "Write your answer here",
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(minimumSize:Size(width/4, 40) ,
                            primary: Color(0xffb2b2b2),
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),

                            ),
                          ),
                          onPressed: () {
                            if(answerController.text.isNotEmpty){
                              answerController.clear();
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
                          style: ElevatedButton.styleFrom(minimumSize:Size(width/4, 40) ,
                            primary: ColorClass.blueColor,
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),

                            ),
                          ),

                          onPressed: () {
                            if(answerController.text.isNotEmpty||answerController.text!=""){
                              AnswerModal answerModal = new AnswerModal();
                              answerModal.answer = answerController.text;
                              answerModal.timestamp = DateTime.now().millisecondsSinceEpoch;
                              answerModal.compoundID =compoundId;
                              answerModal.questionID =questionId;
                              Webservice.postAnswerRequest(context, answerModal);

                            }
                            else{

                              Navigator.pop(context);
                              displayAlertDialog(context,title: "Post Answer",
                                  content: "Empty Answer Cannot Be Posted");
                            }

                          },
                          child: Text(
                            "Post",
                            style: TextStyle(fontSize: 16),
                          ),

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
}