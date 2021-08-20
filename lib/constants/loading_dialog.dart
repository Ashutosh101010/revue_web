import 'package:flutter/material.dart';

import 'ColorClass.dart';

showLoadingDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 5),child:Text("Loading" )),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}


Future<void> displayAlertDialog(BuildContext context,{String title="Error Occurs",String content})async{
 return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context){
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
        });
        return  AlertDialog(
          elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          title: Text(title,textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.w700),),
          content: Text(content,style: TextStyle(color: ColorClass.blueColor,
              fontSize: 14,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
        );
      }
  );

}

Future<void> selectDate(BuildContext context,TextEditingController controller) async {
  final DateTime d = await showDatePicker( //we wait for the dialog to return
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2150),
  );
  if (d != null) //if the user has selected a date
   {
     print(d);
     controller.text = "${d.day}/${d.month}/${d.year}";
  }
}


