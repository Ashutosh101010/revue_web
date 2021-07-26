import 'package:flutter/material.dart';
import 'package:webrevue/constants/ColorClass.dart';

class AboutWidget extends StatefulWidget{
  String aboutCompound;

  AboutWidget(this.aboutCompound);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  return AboutWidgetState();
  }

}



class AboutWidgetState extends State<AboutWidget>{
   bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.only(top: 5,bottom: 10),
          child: Text(
              "About Property",
              style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w700,
                fontSize: 18,
                fontStyle:  FontStyle.normal,),
              textAlign: TextAlign.left
          ),
        ),

        Padding(
          padding:  EdgeInsets.only(top: 5,left: 8,right: 8),
          child: Text(
            widget.aboutCompound,textAlign: TextAlign.start,
            maxLines: descTextShowFlag ?8:5,
            overflow:descTextShowFlag?TextOverflow.visible : TextOverflow.fade,
            style:TextStyle (
                wordSpacing: 5,
                color: Colors.black54,
                fontWeight: FontWeight.w600,

                fontStyle:  FontStyle.normal,
                fontSize: 14.0),),
        ),

        Container(
            margin: EdgeInsets.only(top: 5,bottom: 20),
            alignment: Alignment.centerRight,
            child: descTextShowFlag ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                 setState(() {
                   descTextShowFlag = !descTextShowFlag;
                 });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("READ LESS",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12,
                            color: ColorClass.blueColor,fontWeight: FontWeight.w600)),
                    Icon(Icons.keyboard_arrow_up_outlined,color: Colors.black,)
                  ],
                ),
              ),
            ) :
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                  descTextShowFlag = !descTextShowFlag;
                });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("READ MORE",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12,
                            color: ColorClass.blueColor,fontWeight: FontWeight.w600)),
                    Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,)
                  ],
                ),
              ),
            ))


        // ),
      ],);
  }
}