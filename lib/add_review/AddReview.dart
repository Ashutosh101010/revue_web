
import 'dart:html' as html;
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:webrevue/AppBar/AppBarSec.dart';
import 'package:webrevue/add_review/views/addReview_first_form.dart';
import 'package:webrevue/add_review/views/addReview_forth_form.dart';
import 'package:webrevue/add_review/views/addReview_second_form.dart';
import 'package:webrevue/add_review/views/addReview_third_form.dart';
import 'package:webrevue/add_review/views/add_image.dart';
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
 String id;


  AddReview({Key key,this.compoundID, this.compoundName, this.images,this.address,this.id}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return AddReviewState();
  }
}

class AddReviewState extends State<AddReview>{
  final _formKey = GlobalKey<FormState>();
  ReviewModal reviewModal;
  bool isLoading = false;




  // onRefresh(){
  //   html.window.onBeforeUnload.listen((event) async{
  //     print("refresh-------------");
  //     setState(() {
  //
  //     });
  //   });
  // }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    reviewModal = new ReviewModal();

    print(widget.compoundName);
    print(widget.compoundID);

    if (widget.compoundName == null || widget.address == null ||
        widget.images == null)
  {

  Navigator.of(context).pushNamedAndRemoveUntil(compoundDetails ,(Route<dynamic> route) => false,arguments: CompoundArgument(compoundId: widget.compoundID) );
  }


  }

  DateTime selectedDate = DateTime.now();





  @override
  Widget build(BuildContext context) {
    return Material(

      child: LayoutBuilder(builder: (context,constraints){
      var width = constraints.maxWidth>700;
      return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(70),child: AppBarSec(),),
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child:
            ListView(children: [
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


                      Visibility(
                          maintainAnimation: true,
                          maintainSize: true,
                          visible: isLoading,
                          maintainState: true,
                          child: Center(child: CircularProgressIndicator(),)),



                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 50,
                          width:350,
                          margin: EdgeInsets.only(bottom: 50,top: 50),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: ColorClass.blueColor,
                              onPrimary: Colors.blue.shade900,
                              // hoverColor: Colors.blue.shade900,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                            child: Text(
                              "Submit Review",
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0
                              ),
                            ),



                              onPressed: () async{


                              if(GlobalKeys.addReviewFirstKey.currentState.floorPlanController.text.isEmpty)
                                {
                                  GlobalKeys.addReviewFirstKey.currentState.setState(() {
                                    GlobalKeys.addReviewFirstKey.currentState.flooplanvalidate=true;
                                  });
                                }
                              if (GlobalKeys.addReviewFirstKey.currentState.rentController.text.isEmpty)
                                {
                                  GlobalKeys.addReviewFirstKey.currentState.setState(() {
                                    GlobalKeys.addReviewFirstKey.currentState.rentvalidate=true;
                                  });
                                }
                              if (GlobalKeys.addReviewFirstKey.currentState.bedroomController.text.isEmpty)
                              {
                                GlobalKeys.addReviewFirstKey.currentState.setState(() {
                                  GlobalKeys.addReviewFirstKey.currentState.bedroomvalidate=true;
                                });
                              }
                              if (GlobalKeys.addReviewFirstKey.currentState.bathroomController.text.isEmpty)
                              {
                                GlobalKeys.addReviewFirstKey.currentState.setState(() {
                                  GlobalKeys.addReviewFirstKey.currentState.bathroomvalidate=true;
                                });
                              }
                              if (GlobalKeys.addReviewSecondKey.currentState.descriptionController.text.isEmpty)
                              {
                                GlobalKeys.addReviewSecondKey.currentState.setState(() {
                                  GlobalKeys.addReviewSecondKey.currentState.descriptionvalidate=true;
                                });
                              }
                              if (GlobalKeys.addReviewForthKey.currentState.startDateController.text.isEmpty)
                              {
                                GlobalKeys.addReviewForthKey.currentState.setState(() {
                                  GlobalKeys.addReviewForthKey.currentState.startdatevalidate=true;
                                });
                              }

                              if(GlobalKeys.addReviewImagesKey.currentState.imageFileList.isEmpty){
                                GlobalKeys.addReviewImagesKey.currentState.setState(() {
                                  GlobalKeys.addReviewImagesKey.currentState.imageValidate = true;
                                });
                              }


                              if(
                              GlobalKeys.addReviewFirstKey.currentState.validate()
                                  &&GlobalKeys.addReviewSecondKey.currentState.validate()
                                  &&GlobalKeys.addReviewThirdKey.currentState.validate()
                                  &&GlobalKeys.addReviewImagesKey.currentState.validate()
                              &&GlobalKeys.addReviewImagesKey.currentState.validate())
                              {
                                setState(() {
                                  isLoading = true;
                                });

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

                              await Webservice.addReviewRequest(context, reviewModal);
                                setState(() {
                                  isLoading = false;
                                });

                                Navigator.pushReplacementNamed(context, compoundDetails,
                                    arguments: CompoundArgument(
                                        compoundId: widget.compoundID,
                                        compoundName: widget.compoundName,
                                        images: widget.images,
                                        address: widget.address,));

                                Navigator.of(context);



                              }

                              }


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
        ),
      );
    },),);
  }
}