import 'package:flutter/material.dart';
import 'package:webrevue/constants/keys.dart';

class ProsTextFields extends StatefulWidget {
  final int index;
  ProsTextFields(this.index);
  @override
  _ProsTextFieldsState createState() => _ProsTextFieldsState();
}

class _ProsTextFieldsState extends State<ProsTextFields> {
  TextEditingController _proController;

  @override
  void initState() {
    super.initState();
    _proController = TextEditingController();
  }

  @override
  void dispose() {
    _proController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _proController.text = GlobalKeys.addReviewSecondKey.currentState.prosList[widget.index] ?? '';
    });

    return TextFormField(
      controller: _proController,
      onChanged: (v) => GlobalKeys.addReviewSecondKey.currentState.prosList[widget.index] = v,
      autofocus: false,
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