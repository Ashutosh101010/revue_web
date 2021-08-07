
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:webrevue/AppBar/AppBarSec.dart';
import 'package:webrevue/compound/views/addReview_first_form.dart';
import 'package:webrevue/compound/views/addReview_forth_form.dart';
import 'package:webrevue/compound/views/addReview_second_form.dart';
import 'package:webrevue/compound/views/addReview_third_form.dart';
import 'package:webrevue/compound/views/add_image.dart';
import 'package:webrevue/constants/keys.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/footer/FooterWidget.dart';
import 'package:webrevue/model/ReviewModal.dart';
import 'package:webrevue/model/arguments/CompoundArgument.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/ServerDetails.dart';
import 'package:webrevue/service/Webservice.dart';


import '../constants/ColorClass.dart';

class AddReview extends StatefulWidget{
  String compoundID;
  String compoundName;
  List images = [];
  String address;


  AddReview({Key key,this.compoundID, this.compoundName, this.images,this.address}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return AddReviewState();
  }
}

class AddReviewState extends State<AddReview>{

  ReviewModal reviewModal;


  onRefresh(){
    html.window.onBeforeUnload.listen((event) async{
      setState(() {

      });
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    reviewModal = new ReviewModal();

    print(widget.compoundName);
    print(widget.compoundID);

  }

  DateTime selectedDate = DateTime.now();





  @override
  Widget build(BuildContext context) {
    return Material(child: LayoutBuilder(builder: (context,constraints){
      var width = constraints.maxWidth>700;
      return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(70),child: AppBarSec(),),
        body: Container(
          color: Colors.white,
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Write a Review",
                            style: TextStyle(
                                color:  ColorClass.redColor,
                                fontWeight: FontWeight.w600,
                                fontStyle:  FontStyle.normal,
                                fontSize: 20.0
                            ),
                            textAlign: TextAlign.left
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: width?EdgeInsets.only(left: constraints.maxWidth/6,
                    right: constraints.maxWidth/6):EdgeInsets.all(8),
                // width: width?
                // //
                // constraints.maxWidth-600:constraints.maxWidth,alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: [

                          Container(
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return new Image.network(
                                  ServerDetails.get_images+widget.images[index],
                                  fit: BoxFit.fill,
                                );
                              },
                              autoplay: true,
                              itemCount: widget.images.length,
                              pagination: new SwiperPagination(),
                            ),
                          ),


                          Align(
                            alignment: Alignment.center,
                            child: Column(children: [

                              SizedBox(height: 50,),

                              Text(
                                 widget.compoundName,
                                  style: const TextStyle(
                                      color:  Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 25.0
                                  ),
                                  textAlign: TextAlign.left
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Row(
                                    children: [
                                      Text(
                                          "Address:",
                                          style: TextStyle(
                                              color:Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 22.0
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                      Text(widget.address,
                                          style:  TextStyle(
                                              color:Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 20.0),
                                          textAlign: TextAlign.left)
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 50,),

                            ],),
                          )


                        ],
                      ),
                    ),



                    AddReviewFirstForm(key: GlobalKeys.addReviewFirstKey,),
                    AddReviewSecondForm(key:GlobalKeys.addReviewSecondKey,),
                    AddImageReview(key: GlobalKeys.addReviewImagesKey,),
                    AddReviewThirdForm(key: GlobalKeys.addReviewThirdKey,),

                    AddReviewForthForm(key: GlobalKeys.addReviewForthKey),


                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        width:350,
                        margin: EdgeInsets.only(bottom: 50,top: 50),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: () async{

                            if(GlobalKeys.addReviewImagesKey.currentState.imageFileList.isEmpty){
                              displayAlertDialog(context,content: "Please select atLeast one Image",
                                  title: "Post Review");
                            }


                            if(
                            GlobalKeys.addReviewFirstKey.currentState.validate()
                                &&GlobalKeys.addReviewSecondKey.currentState.validate()
                                &&GlobalKeys.addReviewThirdKey.currentState.validate()
                            &&GlobalKeys.addReviewImagesKey.currentState.validate())
                            {


                              reviewModal.price = GlobalKeys.addReviewFirstKey.currentState.
                              rentController.text;
                              reviewModal.floorplan = GlobalKeys.addReviewFirstKey.currentState.
                              floorPlanController.text;
                              reviewModal.bedRooms = int.parse(GlobalKeys.addReviewFirstKey.
                              currentState.bedroomController.text.trim());
                              reviewModal.bathRooms = int.parse(GlobalKeys.addReviewFirstKey.
                              currentState.bathroomController.text.trim());

                              reviewModal.review = GlobalKeys.addReviewSecondKey.currentState.
                              descriptionController.text;

                              await GlobalKeys.addReviewSecondKey.currentState.addToReview(reviewModal);
                             await GlobalKeys.addReviewImagesKey.currentState.getImages(reviewModal);
                              GlobalKeys.addReviewThirdKey.currentState.addToReview(reviewModal);

                              reviewModal.compoundID = widget.compoundID;
                              reviewModal.compoundName = widget.compoundName;


                              print(reviewModal.maptoJson());



                            bool status = await  Webservice.addReviewRequest(context, reviewModal);
                            setState(() {

                            });
                            if(status==true){
                              Navigator.popAndPushNamed(context, compoundDetails,
                                  arguments: CompoundArgument(
                                      compoundId: widget.compoundID,
                                      compoundName: widget.compoundName,
                                      images: widget.images,
                                      address: widget.address));

                            }// Navigator.pop(context);
                            }
                            else
                            {
                              displayAlertDialog(context,title: "Add Review",
                                  content: "Please complete all field");
                            }
                            },
                          color: ColorClass.blueColor,
                          hoverColor: Colors.blue.shade900,
                          textColor: Colors.white,
                          child: Text(
                            "Submit Review",
                            style: const TextStyle(
                                color:  const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                fontStyle:  FontStyle.normal,
                                fontSize: 16.0
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),


            SizedBox(height: 40,),



            Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: const Color(0x40000000),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0)
                ], color: const Color(0x4d000000))),
            FooterWidget()


          ],),
        ),
      );
    },),);
  }
}