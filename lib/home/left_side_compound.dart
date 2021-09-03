
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webrevue/constants/keys.dart';

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
      child:
      // widget.list.isEmpty?
      //     Text("Getting compounds")
      //     :
      Column(
            children: [
              ListView.builder(
              itemCount: widget.list.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return CompoundCard(width: width,
                  compoundModal: (widget.list[index] as CompoundModal),);

              }),

              // SizedBox(height: 20,),
              //
              // Container(
              //   width: width-200,
              //   height: 45,
              //   alignment: Alignment.topRight,
              //   child: ListView.builder(shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       physics: NeverScrollableScrollPhysics(),
              //       itemCount: 10,itemBuilder: (context,index){
              //     return Padding(
              //       padding: const EdgeInsets.all(4.0),
              //       child: MaterialButton(
              //         onPressed: (){
              //           GlobalKeys.compoundListKey.currentState.updateCompounds();
              //         },color: Colors.grey.shade50,
              //         shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey)),
              //         child: Text((index+1).toString()),),
              //     );
              //       }),
              // )
            ],
          ),


    );
  }




  // Widget compoundCard(int index){
  //   bool viewmore = false;
  //
  //   bool favourite =  false;
  //   if(favouriteIDList.contains((widget.list[index] as CompoundModal).id)){
  //     favourite = !favourite;
  //   }
  //   return Container(
  //     height: width>=600?280:450,
  //     decoration: BoxDecoration(color: Colors.white,),
  //     child: Column(
  //       children: [
  //         width>=600?
  //         FittedBox(fit: BoxFit.fitWidth,
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Container(
  //                 width:width/2,
  //                 alignment: Alignment.topCenter,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: [
  //                     Container(
  //                       height: 150, alignment: Alignment.topCenter,
  //                       width: width/2,  margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
  //                       child:  Swiper(
  //                         itemBuilder: (BuildContext context, int ind) {
  //                           return ClipRRect(
  //                             borderRadius: BorderRadius.circular(5.0),
  //                             child: Image.network(ServerDetails.get_images+
  //                                 (widget.list[index] as CompoundModal).images[ind],fit: BoxFit.cover,),
  //                           );
  //                         },
  //                         autoplay: false,
  //                         itemCount:  (widget.list[index] as CompoundModal).images.length,
  //                         pagination: new SwiperPagination(),
  //
  //
  //                       ),
  //                     ),
  //
  //                     width>=600?
  //                     Container(width: width/2,
  //                       child: FittedBox(fit:BoxFit.fitWidth,
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Container(
  //                               height: 95,
  //                               width: width/4,
  //                               margin: EdgeInsets.only(left: 5,right: 5),
  //                               decoration: BoxDecoration(
  //                                   borderRadius:BorderRadius.circular(5), image: DecorationImage(
  //                                 image: NetworkImage(
  //                                     ServerDetails.get_images+
  //                                         (widget.list[index] as CompoundModal).images[0]),
  //                                 fit: BoxFit.cover,
  //                               )),
  //                             ),
  //                             Container(
  //                               height: 95,
  //                               width:width/4,
  //                               margin: EdgeInsets.only(left: 5,right: 5),
  //                               decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(5), image: DecorationImage(
  //                                 image: NetworkImage(
  //                                     ServerDetails.get_images+
  //                                         (widget.list[index] as CompoundModal).images[1]),
  //                                 fit: BoxFit.cover,
  //                               )),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ):Container()
  //                   ],),
  //               ),
  //               Container(
  //                 width: width/2,alignment: Alignment.topCenter,
  //                 child:
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     // assets/images/userLocation.png
  //                     SizedBox(width: width/2,
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           // Trishla Villa
  //                           Column( crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.only(left: 8),
  //                                 child: AutoSizeText(
  //                                     (widget.list[index] as CompoundModal).compoundname.toUpperCase(),
  //                                     style: const TextStyle(
  //                                         color:  Colors.black87,
  //                                         fontWeight: FontWeight.w700,
  //                                         fontFeatures: [FontFeature.proportionalFigures()],
  //                                         fontStyle:  FontStyle.normal,
  //                                         fontSize: 16.0
  //                                     ),
  //                                     textAlign: TextAlign.left
  //                                 ),
  //                               ), Padding(
  //                                 padding: const EdgeInsets.only(left:8,top:10),
  //                                 child: AutoSizeText(
  //                                     "Address: ",
  //                                     style: TextStyle(
  //                                         color:Colors.black87,
  //                                         fontWeight: FontWeight.w600,
  //                                         fontFeatures: [FontFeature.proportionalFigures()],
  //                                         fontStyle:  FontStyle.normal,
  //                                         fontSize: 14.0
  //                                     ),
  //                                     textAlign: TextAlign.left
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           Padding(
  //                             padding: const EdgeInsets.only(left: 8,right: 8,top:20),
  //                             child: CircularPercentIndicator(
  //                               radius: width>=600?38.0:25,
  //                               lineWidth:width>=600? 4.0:2.0,
  //                               backgroundColor: Colors.black26,
  //                               percent: getpercentage( (widget.list[index] as CompoundModal).rating),
  //                               center: new Text(
  //                                 (widget.list[index] as CompoundModal).rating.toStringAsFixed(1),textAlign: TextAlign.start,
  //                                 style: new TextStyle(
  //                                   fontWeight: FontWeight.bold, fontSize: 10.0,
  //                                   fontFeatures: [FontFeature.proportionalFigures()],),
  //                               ),
  //                               circularStrokeCap: CircularStrokeCap.butt,
  //                               progressColor: Colors.red,
  //                               footer: Padding(
  //                                 padding: const EdgeInsets.all(5.0),
  //                                 child: AutoSizeText("54 Reviews",
  //                                     style:  TextStyle(
  //                                       color:Colors.black54,
  //                                       fontWeight: FontWeight.w600,
  //                                       decorationStyle: TextDecorationStyle.solid,
  //                                       fontStyle: FontStyle.normal,
  //                                       fontSize: 10.0,
  //                                       fontFeatures: [FontFeature.proportionalFigures()],),
  //                                     textAlign:
  //                                     TextAlign.left),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //
  //                     Padding(
  //                       padding: const EdgeInsets.only(left: 8,right: 8),
  //                       child: AutoSizeText(
  //                           (widget.list[index] as CompoundModal).address,
  //                           style:  TextStyle(
  //                             color:Colors.black87,
  //                             fontWeight: FontWeight.w600,
  //                             fontFeatures: [FontFeature.proportionalFigures()],
  //                             fontStyle: FontStyle.normal,
  //                             fontSize: 12.0,
  //                           ),
  //                           textAlign: TextAlign.center),
  //                     ),
  //
  //                     Padding(
  //                       padding: EdgeInsets.only(left:16.0,right: 16,top:16,bottom:10),
  //                       child: CompoundRating((widget.list[index] as CompoundModal)),
  //                     ),
  //
  //                     Container(
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           FittedBox(
  //                             child: Row(
  //                               children: [
  //                                 Icon(CupertinoIcons.chat_bubble_2,
  //                                   color: Colors.black,size: 18,),
  //                                 Padding(padding: const EdgeInsets.only(left: 5,right: 20,),
  //                                   child: AutoSizeText("Q & A",
  //                                       style: const TextStyle(shadows: [Shadow(blurRadius: 5,color: Colors.black12,offset: Offset(1.0, 1.0))],
  //                                         color: const Color(0xff000000),
  //                                         fontWeight: FontWeight.w500,
  //                                         fontStyle: FontStyle.normal,
  //                                         fontSize: 14.0,
  //                                         fontFeatures: [FontFeature.proportionalFigures()],),
  //                                       textAlign: TextAlign.left),
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                           FittedBox(
  //                             child: Container(
  //                               child: Row(
  //                                 children: [
  //
  //                                   GestureDetector(
  //                                       onTap: (){
  //                                         setState(() {
  //                                           favourite = !favourite;
  //                                           // isFavourite[index] = !isFavourite[index];
  //                                           FavoriteModal favModal = new FavoriteModal();
  //
  //                                           if(favourite == false){
  //                                             favouriteIDList.remove((widget.list[index] as CompoundModal).id);
  //                                             favList.remove((widget.list[index] as CompoundModal));
  //                                             favModal.compoundID =(widget.list[index] as CompoundModal).id;
  //                                             // Webservice.removeFavoriteRequest(context,favModal)
  //                                             //     .then((value) => this.setState(() {}));
  //
  //                                           }
  //                                           else{
  //                                             favouriteIDList.add((widget.list[index] as CompoundModal).id);
  //                                             favList.add((widget.list[index] as CompoundModal));
  //                                             favModal.compoundID =   (widget.list[index] as CompoundModal).id;
  //                                             // Webservice.addFavoriteRequest(context,favModal)
  //                                             //     .then((value) => this.setState(() {
  //                                             //
  //                                             // }));
  //
  //                                           }
  //                                         });
  //
  //                                       },
  //                                       child
  //                                           : favourite == false
  //                                           ? Icon(Icons.favorite_border,color: ColorClass.blueColor,)
  //                                           : Icon(Icons.favorite,color: ColorClass.blueColor)),
  //
  //                                   // Padding(
  //                                   //   padding: const EdgeInsets.only(left:20.0,right:5),
  //                                   //   child: Icon(CupertinoIcons.heart,color: Colors.black,size: 18,),
  //                                   // ),
  //                                   AutoSizeText("Save",
  //                                       style: const TextStyle(shadows: [Shadow(blurRadius: 5,color: Colors.black12,offset: Offset(1.0, 1.0))],
  //                                           color: const Color(0xff000000),
  //                                           fontWeight: FontWeight.w500,
  //                                           fontStyle: FontStyle.normal,
  //                                           fontSize: 14.0),
  //                                       textAlign: TextAlign.left)
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //
  //                     InkWell(
  //                       onTap: (){
  //                         Navigator.pushNamed(context, compoundDetails,
  //                             arguments: CompoundArgument(
  //                                 compoundId: (widget.list[index] as CompoundModal).id,
  //                                 compoundName: (widget.list[index] as CompoundModal).compoundname,
  //                                 images: (widget.list[index] as CompoundModal).images,
  //                                 address: (widget.list[index] as CompoundModal).address));
  //                         // Navigator.push(context,
  //                         //     MaterialPageRoute(builder: (context)=>CompoundDetails()));
  //                       },onHover: (value){
  //                       viewmore = value;
  //                       (context as Element).markNeedsBuild();
  //                     },
  //                       child: Container(
  //                         margin: EdgeInsets.only(right: 10,top: 10),
  //                         width: width/2,alignment: Alignment.centerRight,
  //                         child: AutoSizeText("View more".toUpperCase(),
  //                             style: TextStyle(
  //                                 color:viewmore?Colors.blue.shade900:
  //                                 ColorClass.blueColor,
  //                                 fontWeight: viewmore?FontWeight.w700:FontWeight.w500,
  //                                 fontStyle: FontStyle.normal,
  //                                 fontSize: 10.0),
  //                             textAlign: TextAlign.left),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ):
  //         Column(children: [
  //           Container(
  //             height: 150, alignment: Alignment.topCenter,
  //             width: width,  margin: EdgeInsets.only(left: 5,right: 5,bottom: 5),
  //             child: Swiper(
  //               itemBuilder: (BuildContext context, int ind) {
  //                 return ClipRRect(
  //                   borderRadius: BorderRadius.circular(5.0),
  //                   child: new Image.network(
  //                     ServerDetails.get_images+(widget.list[index] as CompoundModal).images[ind],
  //                     fit: BoxFit.fill,
  //                   ),
  //                 );
  //               },
  //               autoplay: false,
  //               itemCount: (widget.list[index] as CompoundModal).images.length,
  //               pagination: new SwiperPagination(),
  //
  //
  //             ),
  //
  //           ),
  //
  //           Container(
  //             width: width,alignment: Alignment.topCenter,
  //             child:
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 // assets/images/userLocation.png
  //                 SizedBox(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       // Trishla Villa
  //                       Column( crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.only(left: 8),
  //                             child: AutoSizeText(
  //                                 (widget.list[index] as CompoundModal).compoundname.toUpperCase(),
  //                                 style: const TextStyle(
  //                                     color:  Colors.black87,
  //                                     fontWeight: FontWeight.w700,
  //
  //                                     fontStyle:  FontStyle.normal,
  //                                     fontSize: 16.0
  //                                 ),
  //                                 textAlign: TextAlign.left
  //                             ),
  //                           ), Padding(
  //                             padding: const EdgeInsets.only(left:8,top:10),
  //                             child: AutoSizeText(
  //                                 "Address: ",
  //                                 style: TextStyle(
  //                                     color:Colors.black87,
  //                                     fontWeight: FontWeight.w600,
  //
  //                                     fontStyle:  FontStyle.normal,
  //                                     fontSize: 14.0
  //                                 ),
  //                                 textAlign: TextAlign.left
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 8,right: 8,top:20),
  //                         child: CircularPercentIndicator(
  //                           radius: width>=600?38.0:25,
  //                           lineWidth:width>=600? 4.0:2.0,
  //                           backgroundColor: Colors.black26,
  //                           percent:getpercentage((widget.list[index] as CompoundModal).rating),
  //                           center: new Text(
  //                             getpercentage((widget.list[index] as CompoundModal).rating).toStringAsFixed(1),
  //                             style: new TextStyle(
  //                                 fontWeight: FontWeight.bold, fontSize: 10.0),
  //                           ),
  //                           circularStrokeCap: CircularStrokeCap.butt,
  //                           progressColor: Colors.red,
  //                           footer: Padding(
  //                             padding: const EdgeInsets.all(5.0),
  //                             child: AutoSizeText("54 Reviews",
  //                                 style:  TextStyle(
  //                                     color:Colors.black54,
  //                                     fontWeight: FontWeight.w600,
  //                                     decorationStyle: TextDecorationStyle.solid,
  //                                     fontStyle: FontStyle.normal,
  //                                     fontSize: 10.0),
  //                                 textAlign:
  //                                 TextAlign.left),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 8,right: 8),
  //                   child: AutoSizeText(
  //                       (widget.list[index] as CompoundModal).address,
  //                       style:  TextStyle(
  //                         color:Colors.black87,
  //                         fontWeight: FontWeight.w600,
  //
  //                         fontStyle: FontStyle.normal,
  //                         fontSize: 12.0,
  //                       ),
  //                       textAlign: TextAlign.center),
  //                 ),
  //
  //                 Padding(
  //                   padding: EdgeInsets.only(left:16.0,right: 16,top:16,bottom:10),
  //                   child: CompoundRating((widget.list[index] as CompoundModal)),
  //                 ),
  //
  //                 Container(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       FittedBox(
  //                         child: Row(
  //                           children: [
  //                             Icon(CupertinoIcons.chat_bubble_2,
  //                               color: Colors.black,size: 18,),
  //                             Padding(padding: const EdgeInsets.only(left: 5,right: 20,),
  //                               child: AutoSizeText("Q & A",
  //                                   style: const TextStyle(shadows: [Shadow(blurRadius: 5,color: Colors.black12,offset: Offset(1.0, 1.0))],
  //                                       color: const Color(0xff000000),
  //                                       fontWeight: FontWeight.w500,
  //                                       fontStyle: FontStyle.normal,
  //                                       fontSize: 14.0),
  //                                   textAlign: TextAlign.left),
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                       FittedBox(
  //                         child: Container(
  //                           child: Row(
  //                             children: [
  //                               Padding(
  //                                 padding: const EdgeInsets.only(left:20.0,right:5),
  //                                 child: Icon(CupertinoIcons.heart,color: Colors.black,size: 18,),
  //                               ),
  //                               AutoSizeText("Save",
  //                                   style: const TextStyle(shadows: [Shadow(blurRadius: 5,color: Colors.black12,offset: Offset(1.0, 1.0))],
  //                                       color: const Color(0xff000000),
  //                                       fontWeight: FontWeight.w500,
  //                                       fontStyle: FontStyle.normal,
  //                                       fontSize: 14.0),
  //                                   textAlign: TextAlign.left)
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //
  //                 InkWell(
  //                   onTap: (){
  //
  //                     Navigator.pushNamed(context, compoundDetails,
  //                         arguments: CompoundArgument(
  //                             compoundId: (widget.list[index] as CompoundModal).id,
  //                             compoundName:(widget.list[index] as CompoundModal).compoundname,
  //                             images:(widget.list[index] as CompoundModal).images,
  //                             address:(widget.list[index] as CompoundModal).address));
  //
  //                   },onHover: (value){
  //                   viewmore = value;
  //                   (context as Element).markNeedsBuild();
  //                 },
  //                   child: Container(
  //                     margin: EdgeInsets.only(right: 10,top: 10),
  //                     alignment: Alignment.centerRight,
  //                     child: AutoSizeText("View more".toUpperCase(),
  //                         style: TextStyle(
  //                             color:viewmore?Colors.blue.shade900:
  //                             ColorClass.blueColor,
  //                             fontWeight: viewmore?FontWeight.w700:FontWeight.w500,
  //                             fontStyle: FontStyle.normal,
  //                             fontSize: 10.0),
  //                         textAlign: TextAlign.left),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],),
  //         Padding(
  //           padding: const EdgeInsets.only(top:10.0),
  //           child: (widget.list[index] as CompoundModal)!=null?
  //           Divider(color: Colors.black12,thickness: 1,height: 2,):Container(),
  //         )
  //       ],
  //     ),);
  // }
}