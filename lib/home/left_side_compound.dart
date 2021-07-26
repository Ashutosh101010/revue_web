import 'package:flutter/material.dart';
import 'package:webrevue/home/CompoundList.dart';
import 'package:webrevue/model/CompoundModal.dart';

import 'compound_card.dart';

class LeftSideCompound extends StatefulWidget{
  double width;List list = [];
  LeftSideCompound(this.width,this.list);

  @override
  State<StatefulWidget> createState() {
    return  LeftSideCompoundState();
  }
}

class LeftSideCompoundState extends State<LeftSideCompound>{
  double width;


  @override
  void initState() {
    super.initState();
    width = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,alignment: Alignment.topCenter,
      margin: width>=700?EdgeInsets.only(right: 40):EdgeInsets.all(10),
      child: widget.list.isEmpty?
          Text("Getting compounds")
          : ListView.builder(
          itemCount: widget.list.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return CompoundCard(width: width,compoundModal:widget.list[index] as CompoundModal);

          }),

    );
  }
}