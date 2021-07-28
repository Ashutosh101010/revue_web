
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webrevue/service/Webservice.dart';

Widget bottomNav(BuildContext context,String reviewID){
  double maxWidth = MediaQuery.of(context).size.width;
  return  Padding(
      padding: const EdgeInsets.all(10.0),
      child:
      maxWidth>=1000?
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.thumb_up,
                    color: Colors.yellow,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText("Was this review helpful?",
                        style: const TextStyle(
                            color: Colors.black,

                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    mouseCursor: SystemMouseCursors.click,onTap: (){
                      Webservice.reportReviewRequest(context, reviewID);
                  },
                    child: Icon(
                      FontAwesomeIcons.solidFlag,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText("Report",
                        style: const TextStyle(
                            color: Colors.black,

                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.share_outlined,
            //         color: Colors.blue,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: AutoSizeText("Share",
            //             style: const TextStyle(
            //                 color: Colors.black,
            //
            //                 fontWeight: FontWeight.w500,
            //                 fontStyle: FontStyle.normal,
            //                 fontSize: 16.0),
            //             textAlign: TextAlign.left),
            //       ),
            //     ],
            //   ),
            // ),
          ]):
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.thumb_up,
                    color: Colors.yellow,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText("Was this review helpful?",
                        style: const TextStyle(
                            color: Colors.black,

                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    mouseCursor: SystemMouseCursors.click,
                    onTap: (){
                      Webservice.reportReviewRequest(context, reviewID);
                    },
                    child: Icon(
                      FontAwesomeIcons.solidFlag,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText("Report",
                        style: const TextStyle(
                            color: Colors.black,

                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.share_outlined,
            //         color: Colors.blue,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: AutoSizeText("Share",
            //             style: const TextStyle(
            //                 color: Colors.black,
            //
            //                 fontWeight: FontWeight.w500,
            //                 fontStyle: FontStyle.normal,
            //                 fontSize: 16.0),
            //             textAlign: TextAlign.left),
            //       ),
            //     ],
            //   ),
            // ),
          ])
  );
}
