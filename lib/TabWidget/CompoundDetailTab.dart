

import 'package:auto_size_text/auto_size_text.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:webrevue/LoginDashboard/LoginScreen.dart';
import 'package:webrevue/TabWidget/widget/AboutWidget.dart';
import 'package:webrevue/TabWidget/widget/AmenitiesWidget.dart';
import 'package:webrevue/TabWidget/widget/MapsWidget.dart';
import 'package:webrevue/TabWidget/widget/compound_rating.dart';
import 'package:webrevue/TabWidget/widget/compound_rating_bar.dart';
import 'package:webrevue/TabWidget/widget/star_rating.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/keys.dart';
import 'package:webrevue/favoriteCompound/FavoriteCompound.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/model/FavoriteModal.dart';
import 'package:webrevue/model/arguments/CompoundArgument.dart';
import 'package:webrevue/model/arguments/CompoundMessagingArgument.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/ServerDetails.dart';
import 'package:webrevue/service/Webservice.dart';

class CompoundDetailTab extends StatefulWidget {
  // String compoundID;
  CompoundModal compoundModal;
  CompoundDetailTab(this.compoundModal);

  @override
  State<StatefulWidget> createState() {
    return CompoundDetailTabState();
  }

}

class CompoundDetailTabState extends State<CompoundDetailTab>{


    bool messagingHover = false;
  bool shareHover = false;
  bool favhover = false;
  double maxWidth;
  // CompoundModal compoundModal;
    bool favourite=false;
    bool load=false;
  @override
  void initState() {
    super.initState();



    if(favouriteIDList.contains(widget.compoundModal.id)){
      favourite = !favourite;
    }


  }






  @override
  Widget build(BuildContext context) {
     maxWidth = MediaQuery.of(context).size.width;
    return
      load?CircularProgressIndicator():
      Container(
      margin: maxWidth>800?EdgeInsets.only(left: 50,top: 10,):EdgeInsets.only(top: 10,),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Container(
          height: 400,width: 1000,
          child: Stack(
            children: [
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    ServerDetails.get_images+widget.compoundModal.images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: widget.compoundModal.images.length,
                pagination: new SwiperPagination(),
              ),


              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){},
                  onHover: (value){
                    setState(() {
                      favhover = value;
                    });
                  },
                  child: Container(
                    width: 40,height: 40,alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    color: ColorClass.blueColor,),
                    child: IconButton(icon:  favourite?
                    Icon(
                      CupertinoIcons.suit_heart_fill,
                      color: Colors.white,
                    ):Icon(
                      CupertinoIcons.heart,
                      color: Colors.white,
                    ),alignment: Alignment.center,
                      color: ColorClass.blueColor,
                      onPressed: () async{
                        favourite = !favourite;
                        FavoriteModal favModal = new FavoriteModal();

                        if(favourite == false){
                          favouriteIDList.remove(widget.compoundModal.id);
                          favList.remove(widget.compoundModal);
                          favModal.compoundID =widget.compoundModal.id;
                         await Webservice.removeFavoriteRequest(context,favModal);

                         setState(() {

                         });
                        }
                        else{
                          favouriteIDList.add(widget.compoundModal.id);
                          favList.add(widget.compoundModal);
                          favModal.compoundID =   widget.compoundModal.id;
                         await Webservice.addFavoriteRequest(context,favModal);
                         setState(() {

                         });
                        }
                      },),
              ),
                ),),
            ],
          ),

        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              AutoSizeText(widget.compoundModal.compoundname,softWrap: true,
                style:TextStyle(
                    color:  Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontStyle:  FontStyle.normal,
                    fontSize: 18.0
                ) ,),
                AutoSizeText(widget.compoundModal.address,softWrap: true,
                style: TextStyle(
                    color:  Colors.black87,
                    fontSize: 16,fontWeight: FontWeight.w500),)
            ],),

          maxWidth>=800?
          Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,questionAns,
                            arguments:CompoundMessagingArgument(
                            compoundID:widget.compoundModal.id,
                            compoundName: widget.compoundModal.compoundname,
                            compoundAddress: widget.compoundModal.address));
                      },
                      child: Icon(CupertinoIcons.chat_bubble_2_fill,size: 25,
                      color:ColorClass.blueColor,),
                    ),
                      AutoSizeText('Q and A',
                        style: TextStyle(
                            color:  ColorClass.blueColor,
                            fontSize: 14,fontWeight: FontWeight.w600),)
                    ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Tooltip(
                        message: "Copy link to share",
                        child: InkWell(
                          onTap: (){
                            FlutterClipboard.copy("https://revue-app.com/$mainscreenRoute$compoundDetails/${widget.compoundModal.id}").then((value){
                              print("value");
                            });

                            // print(window.location.href);
                            },
                          child: Icon(Icons.share,size: 25,
                            color:  ColorClass.blueColor,),
                        ),
                      ),
                      AutoSizeText('Share',
                        style: TextStyle(
                            color:  ColorClass.blueColor,
                            fontSize: 14,fontWeight: FontWeight.w600),)
                    ],),
                ),
              ],
            ):Container()
            ],),
        ),

        maxWidth>=800?Container():
        Row(
         mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){

                    Navigator.pushNamed(context,questionAns,
                        arguments:CompoundMessagingArgument(
                            compoundID:widget.compoundModal.id,
                            compoundName: widget.compoundModal.compoundname,
                        compoundAddress: widget.compoundModal.address));
                  },
                  child: Icon(CupertinoIcons.chat_bubble_2_fill,size: 25,
                    color:ColorClass.blueColor,),
                ),
                AutoSizeText('Q and A',
                  style: TextStyle(
                      color:  ColorClass.blueColor,
                      fontSize: 14,fontWeight: FontWeight.w600),)
              ],),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Tooltip(
                  message: "Copy link to share",
                  child: InkWell(
                    onTap: (){
                      FlutterClipboard.copy("https://revue-app.com/$mainscreenRoute$compoundDetails/${widget.compoundModal.id}").then((value){
                        print("value");
                      });

                      // print(window.location.href);
                    },
                    child: Icon(Icons.share,size: 25,
                      color:  ColorClass.blueColor,),
                  ),
                ),
                AutoSizeText('Share',
                  style: TextStyle(
                      color:  ColorClass.blueColor,
                      fontSize: 14,fontWeight: FontWeight.w600),)
              ],),
          ),
        ],),

        Row(
          mainAxisAlignment: maxWidth>=1000?MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
          children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                  border: maxWidth>=800?
                  Border(right: BorderSide(color: Colors.grey,width: 1)):null),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StarRating(widget.compoundModal.rating),

                  Container(
                    alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      child:CompoundRating(widget.compoundModal,maxWidth)),
                ],
              ),
            ),
          ),

            Container(width: 1,color: Colors.black87,),
            maxWidth>=800?
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: RatingBarWidget()
              ),
            ):Container(),

          ],),
          maxWidth>=800?Container():
          Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 10),
              child: RatingBarWidget()
          ),

        SizedBox(height: 20,),

        Row(
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: AmenitiesWidget(widget.compoundModal.amenities)),

            maxWidth>=900?
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child:Padding(
                padding: const EdgeInsets.only(left:10,top:80.0,right:10),
                child: MapsWidget(maxWidth,widget.compoundModal),
              )):Container()
          ],
        ),




        SizedBox(height: 20,),
        // About Property

        Padding(
          padding: const EdgeInsets.only(right: 10),
          child:  AboutWidget(widget.compoundModal.description)

        ),



      ],),
    );
  }


}