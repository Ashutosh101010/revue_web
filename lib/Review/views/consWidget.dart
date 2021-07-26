import 'package:flutter/material.dart';

class ConsWidget extends StatelessWidget{
  List consList = [];

  ConsWidget(this.consList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10,left:10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Cons",
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
                  "- " + consList[index],
                  style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 14),
                );
              },
              shrinkWrap: true,
              itemCount: consList.length,
            ),
          ),
        ],
      ),
    );
  }
}