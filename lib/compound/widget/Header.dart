import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget{

  ScrollController controller;

  Header({this.controller,Key key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HeaderState();
  }

}
GlobalKey<HeaderState> HeaderKey=new GlobalKey();
class HeaderState extends State<Header>{
  int selectedTab=1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(child:
          Container(width:60, height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                AutoSizeText("Rating",maxLines: 1,
                  style: TextStyle(color: selectedTab==1?Colors.red:Colors.black54,fontWeight: FontWeight.w700,),),

                selectedTab==1? Container( width: 500,
                    height:2,color:Colors.red):Container()
              ],
            ),
          ),autofocus: false,
            onPressed: (){
              this.widget.controller.animateTo(0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
            },),
          TextButton(child:
          Container(width:60, height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                AutoSizeText("Facilities",maxLines: 1,
                    style:TextStyle(fontWeight: FontWeight.w700,
                        color: selectedTab==2?Colors.red:Colors.black54)),

                selectedTab==2? Container(
                    width: 500,
                    height:2,color:Colors.red):Container()
              ],
            ),
          ),autofocus: false,
            onPressed: (){
              this.widget.controller.animateTo(695, duration: Duration(milliseconds: 1000), curve: Curves.ease);
            },),
          TextButton(child:
          Container(width:60, height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                AutoSizeText("Review",maxLines: 1,
                    style:TextStyle(
                        fontWeight: FontWeight.w700,


                        color: selectedTab==3?Colors.red:Colors.black54)),

                selectedTab==3?Container(
                    width: 500,
                    height:2,color:Colors.red):Container()
              ],
            ),
          ),autofocus: false,
            onPressed: (){
              this.widget.controller.animateTo(1170, duration: Duration(milliseconds: 1000), curve: Curves.ease);
            },),



        ],
      ),
    );
  }

}