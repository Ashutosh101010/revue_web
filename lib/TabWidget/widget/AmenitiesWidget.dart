import 'package:flutter/material.dart';

class AmenitiesWidget extends StatelessWidget{
  List amenitiesList = [];

  AmenitiesWidget(this.amenitiesList);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Amenities",
          style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w700,
            fontSize: 18,
            fontStyle:  FontStyle.normal,),),
        Container(
          margin: EdgeInsets.only(top: 40,bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: Container(
            width: 300,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return Text(amenitiesList[index],
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,

                      fontStyle:  FontStyle.normal,
                      fontSize: 14.0),);
              },shrinkWrap: true,
              itemCount: amenitiesList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                (crossAxisCount:2,childAspectRatio: 10/1),
            ),
          ),
        )
      ],
    );
  }
}