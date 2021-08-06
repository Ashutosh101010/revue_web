import 'package:flutter/material.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/model/MessagingModal.dart';
import 'package:webrevue/service/Webservice.dart';

class PostQuestion extends StatelessWidget{
  double width;
  String compoundId;
  String compoundName;


  PostQuestion({@required this.width, @required this.compoundId , @required this.compoundName});

  TextEditingController questionController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
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
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          decoration: BoxDecoration(
              color: Color(0xfffaf7f7),border: Border.all(color: Colors.black26)
          ),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.multiline,
            controller: questionController,
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
            ),),
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
                    style: ElevatedButton.styleFrom(minimumSize:Size(width/4, 40) ,
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
                    style: ElevatedButton.styleFrom(minimumSize:Size(width/4, 40) ,
                      primary: ColorClass.blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () async{
                      if(questionController.text.isNotEmpty||questionController.text!=""){

                        MessagingModal messaging = new MessagingModal();
                        messaging.question = questionController.text;
                        messaging.compoundID = compoundId;
                        messaging.compoundName =compoundName;
                        messaging.timestamp = DateTime.now().millisecondsSinceEpoch;

                        Webservice.postQuestionRequest(context, messaging);
                      }
                      else{

                        Navigator.pop(context);
                        displayAlertDialog(context,title: "Post Question",
                            content: "Empty Question Cannot Be Posted");
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
    );
  }
}