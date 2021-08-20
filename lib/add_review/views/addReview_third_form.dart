import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/model/ReviewModal.dart';

class AddReviewThirdForm extends StatefulWidget{
  AddReviewThirdForm({Key key}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddReviewThirdFormState();
  }
}

class AddReviewThirdFormState extends State<AddReviewThirdForm>{
  double facilitiesRating = 0;
  double valueRating = 0;
  double managementRating = 0;
  double designRating = 0;
  double locationRating = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(color: Colors.black12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Your Rating",
                  style: TextStyle(
                      color:  ColorClass.blueColor,
                      fontWeight: FontWeight.w600,

                      fontStyle:  FontStyle.normal,
                      fontSize: 18.0
                  ),
                  textAlign: TextAlign.left
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Facilities",
                      style: TextStyle(
                          color:  Colors.black54,
                          fontWeight: FontWeight.w600,

                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0
                      ),
                      textAlign: TextAlign.left
                  ),

                  GFRating(
                    size: 25,borderColor: Colors.black54,spacing: 10,
                    value: facilitiesRating,
                    color: ColorClass.blueColor,
                    onChanged: (value) {
                      setState(() {
                        facilitiesRating = value;
                      });
                    },
                  )

                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Design",
                      style:  TextStyle(
                          color:  Colors.black54,
                          fontWeight: FontWeight.w600,

                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0
                      ),
                      textAlign: TextAlign.left
                  ),

                  GFRating(
                    size: 25,borderColor: Colors.black54,spacing: 10,
                    value: designRating,
                    color: ColorClass.blueColor,
                    onChanged: (value) {
                      setState(() {
                        designRating = value;
                      });
                    },
                  )

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Location",
                      style:  TextStyle(
                          color:  Colors.black54,
                          fontWeight: FontWeight.w600,

                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0
                      ),
                      textAlign: TextAlign.left
                  ),

                  GFRating(
                    size: 25,borderColor: Colors.black54,spacing: 10,
                    value: locationRating,
                    color: ColorClass.blueColor,
                    onChanged: (value) {
                      setState(() {
                        locationRating = value;
                      });
                    },
                  )

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Value",
                      style: TextStyle(
                          color:  Colors.black54,
                          fontWeight: FontWeight.w600,

                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0
                      ),
                      textAlign: TextAlign.left
                  ),

                  GFRating(
                    size: 25,borderColor: Colors.black54,spacing: 10,
                    value: valueRating,
                    color: ColorClass.blueColor,
                    onChanged: (value) {
                      setState(() {
                        valueRating = value;
                      });
                    },
                  )

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Management",
                      style:  TextStyle(
                          color:  Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontStyle:  FontStyle.normal,
                          fontSize: 16.0
                      ),
                      textAlign: TextAlign.left
                  ),

                  GFRating(
                    size: 25,borderColor: Colors.black54,spacing: 10,
                    value: managementRating,
                    color: ColorClass.blueColor,
                    onChanged: (value) {
                      setState(() {
                        managementRating = value;
                      });
                    },
                  )

                ],
              ),
            ),

          ],
        ),
      ),
    );

  }



  bool validate(){
    return facilitiesRating!=0
        &&designRating!=0
        &&locationRating!=0
        &&valueRating!= 0
        &&managementRating!=0;
  }


  void addToReview(ReviewModal reviewModal){
    // double rating = ;
    //               print(rating);
    reviewModal.facilities = facilitiesRating;
    reviewModal.value = valueRating;
    reviewModal.location = locationRating;
    reviewModal.management = managementRating;
    reviewModal.design = designRating;
    reviewModal.rating =((facilitiesRating+designRating+locationRating+valueRating+managementRating)/5);
    reviewModal.reviewDate =DateTime.now().millisecondsSinceEpoch;

  }


}