import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/model/ReportModal.dart';
import 'package:webrevue/service/Webservice.dart';

class ReportAnswer extends StatelessWidget{
  double  width;
  String answerId;

  ReportAnswer(this.width,this.answerId);

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
                padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                child: // Report
                Text("Report",
                    style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,

                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.left)),

            Container(
                width: MediaQuery.of(context).size.width,
                margin:
                EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: // If you find this content inappropriate and think i
                Text(
                    "If you find this content inappropriate and "
                        "think it should be removed from this website,"
                        "let us know by clicking the button below.",
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,

                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left)),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40,
                  width: 300,
                  margin: EdgeInsets.all(10),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onPressed: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      ReportModal report = new ReportModal();
                      report.answerID = answerId;
                      report.userID = prefs.getString("userID");
                      report.userName = prefs.getString("name");

                      Webservice.reportAnswerRequest(context, report);
                    },
                    color: ColorClass.blueColor,
                    hoverColor: Colors.blue.shade900,
                    textColor: Colors.white,
                    child: Text(
                      "Report",
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
    );
  }

}