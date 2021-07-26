import 'package:flutter/material.dart';

class ProsWidget extends StatelessWidget{
  List prosList = [];

  ProsWidget(this.prosList);

  @override
  Widget build(BuildContext context) {
return  Container(
  margin: EdgeInsets.only(top: 5, bottom: 10,left:10),
  width: MediaQuery.of(context).size.width,
  child: Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Pros",
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Text(
              "- " + prosList[index],
              style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 14),
            );
          },
          shrinkWrap: true,
          itemCount: prosList.length,
        ),
      ),
    ],
  ),
);
  }
}