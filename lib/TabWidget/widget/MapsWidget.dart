import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/model/CompoundModal.dart';

class MapsWidget extends StatelessWidget{
  final double maxWidth;
 final CompoundModal compoundModal;
  MapsWidget(this.maxWidth,this.compoundModal);

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width:maxWidth>700? 160:110,height:maxWidth>700? 160:110,
          decoration: BoxDecoration(color: Colors.black12,shape: BoxShape.circle,
              border:Border.all(color: Colors.black12),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),

                ),],
              image: DecorationImage(fit: BoxFit.fill,
                  image: AssetImage("assets/images/circularMap.png"))),
        ),
        // Maps
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(
              "Maps",
              style: const TextStyle(
                  color:  Colors.black54,
                  fontWeight: FontWeight.w600,

                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
              textAlign: TextAlign.center
          ),
        ),
        // Al Thumama Doha, Al Thumama
        AutoSizeText(compoundModal.address,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w700,

                fontStyle:  FontStyle.normal,
                fontSize: 14.0
            ),
            textAlign: TextAlign.left
        )
      ],
    );
  }
}