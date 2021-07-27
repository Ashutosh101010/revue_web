import 'package:flutter/material.dart';
import 'package:webrevue/constants/keys.dart';

class ConsTextFields extends StatefulWidget {
  final int index;
  ConsTextFields(this.index);
  @override
  ConsTextFieldsState createState() => ConsTextFieldsState();
}

class ConsTextFieldsState extends State<ConsTextFields> {
  TextEditingController _consController;

  @override
  void initState() {
    super.initState();
    _consController = TextEditingController();
  }

  @override
  void dispose() {
    _consController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _consController.text = GlobalKeys.addReviewSecondKey.currentState.consList[widget.index] ?? '';
    });

    return TextFormField(
      controller: _consController,
      autofocus: false,
      onChanged: (v) => GlobalKeys.addReviewSecondKey.currentState.consList[widget.index] = v,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15),
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:  Colors.grey,),
          ),
          fillColor: Colors.white
      ),
    );
  }
}
