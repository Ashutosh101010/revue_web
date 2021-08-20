
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_container/overlay_container.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:webrevue/AppBar/AppBarFirst.dart';
import 'package:webrevue/AppBar/AppBarSec.dart';
import 'package:webrevue/AppBar/MainDrawer.dart';
import 'package:webrevue/AppBar/SearchWidget.dart';
import 'package:webrevue/AppBar/popupmenu.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/footer/FooterWidget.dart';
import 'package:webrevue/home/compound_card.dart';
import 'package:webrevue/home/left_side_compound.dart';
import 'package:webrevue/home/nearby_property.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/Webservice.dart';

import '../compound/FilterScreen.dart';
import 'dart:html' as html;

class CompoundList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CompoundListState();
  }
  CompoundList({Key key}):super(key:key);
}


class CompoundListState extends State<CompoundList>{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool filter = false;
  String selectedCategory;
  String selectedLocation;
  List category = ['1', '2', '3', '4', '5', '6'];
  bool viewmore = false;
  List  texthover;

  ScrollController controller= new ScrollController();
  var optionMenuSelected;
  ScrollController _scrollController;
  String lastObjectId = "";
  List compoundList = [];
  List amenityList = [];


  @override
  void initState() {
    super.initState();

    _scrollController  = ScrollController();
    getFavoriteCompound();
    // texthover  = List.filled(propertyImage.length, false);



  }


  Future<void> getFavoriteCompound()async{
    await Webservice.getAllFavoritesCompoundRequest();
    setState(() {
      getCompoundList();
    });
  }



  void toggleDropdown() {
    setState(() {
      filter = !filter;
    });
  }

  getCompoundList()async{
   await Webservice.getCompoundRequest(context,compoundList, "");
   setState(() {

   });

  }


  void updateCompounds(){
    lastObjectId = (compoundList.last as CompoundModal).id;
    Webservice.getCompoundRequest(context, compoundList, lastObjectId).then((
        value) => this.setState(() {}));
  }



  onRefresh(){
    html.window.onBeforeUnload.listen((event) async{
    setState(() {

    });
    });
  }



  double maxWidth;
  @override
  Widget build(BuildContext context) {
     maxWidth = MediaQuery.of(context).size.width;
    double maxheight = MediaQuery.of(context).size.height;
    return Material(
      child: LayoutBuilder(builder: (context,constraints){
        var width = constraints.maxWidth>=700;
        print(maxWidth);
        print(constraints.maxWidth);
        return Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          appBar: width?
          PreferredSize(preferredSize: Size.fromHeight(80),
            child:  AppBarFirst( constraints.maxWidth),)
              :appBarWidget(),


          body:GestureDetector(
            onTap: (){
              AppBarFirstState().hideIndicator(context);
            },
            child: Column(
              children: [
              Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      maxWidth>=900?Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(bottom: BorderSide(color: Colors.black12))
                        ),
                        child: SearchWidget(maxWidth/2.3),
                      ):Container(),

                      width?Padding(
                        padding: EdgeInsets.only(left: maxWidth/30,bottom: 40),
                        child: filterWidget(width,maxWidth),
                      ):Container(),
                     // filter? showOverLay(context):Container(),

                      maxWidth>=1300?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8.0,right:20),
                          child: LeftSideCompound(maxWidth/2,compoundList),
                        ),
                        NearByProperty(width:maxWidth/3)
                      ],):
                      maxWidth>=1000?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LeftSideCompound(maxWidth/2,compoundList),
                        NearByProperty(width:maxWidth/3)
                      ],):
                      LeftSideCompound(maxWidth,compoundList),
                      Container(margin: EdgeInsets.only(top:10,left: 8,right: 8),
        color: Colors.black26,width: MediaQuery.of(context).size.width,height: 1,)
,FooterWidget()
                    ],
                  ),
                ),
              ),
              ),


            ],),
          ),


        );

      },),
    );
  }

  //
  //  showOverLay(BuildContext context){
  //   overlayEntry = OverlayEntry(
  //       builder: (BuildContext context) {
  //         return Positioned(
  //             top: 200.0,
  //             left: 100,
  //             right: 100,
  //             bottom: 100,
  //         child: Material(
  //           child: FilterScreen(),
  //         ),);});
  //
  //   Overlay.of(context).insert(overlayEntry);
  // }
  //
  //
  // OverlayEntry overlayEntry;
  //
  // void hideIndicator(BuildContext context) {
  //   overlayEntry.remove();
  // }


  Widget filterWidget(bool width,double maxWidth){
    return Padding(
      padding: const EdgeInsets.only(left: 30,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Recommended
          Text("Recommended",
              style:  TextStyle(
                  color: Color(0xb2000000),
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 25.0),
              textAlign: TextAlign.left),
          // Rectangle 86
          Container(
            margin: EdgeInsets.only(right:maxWidth/(maxWidth/150)),
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                  color:Colors.white,
                  border:Border.all(
                      color: Colors.black54,
                      width: 1.2,style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: (){
                  if(width){
                    filter = !filter;
                    showFilterDialog(context);
                    // if(filter==true){
                    //
                    // }

                  }else
                  {
                    Navigator.pushNamed(context, filtercompound);
                  }
                },
                hoverColor: Colors.grey.shade100,
                mouseCursor: SystemMouseCursors.click,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Filter
                    Text("Filter",
                        style:  TextStyle(
                            color: Color(0x99000000),
                            fontWeight: FontWeight.w400,

                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                    Image.asset(
                      "assets/images/filterAndSort.png",
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded,color: Colors.black,)
                  ],
                ),
              ))

        ],
      ),
    );
  }

  Widget appBarWidget(){
    return    AppBar(
      actions: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,onTap: (){
            Navigator.pushNamed(context, filtercompound);
          },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/filter.png",width: 20,height: 20,fit: BoxFit.contain,),
                Padding(
                    padding: const EdgeInsets.only(top: 5,left:10,right:10),
                    child: // Profile
                    Text(
                        "Filter",
                        style:  TextStyle(
                            color:  Color(0x99000000),
                            fontWeight: FontWeight.w600,
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.0
                        ),
                        textAlign: TextAlign.left
                    )
                ),
              ],),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5,left:20,right:20),
          child: InkWell(
            onTap: (){
              Offset offset= new Offset(0,0);
              showPopupMenu(offset, context);
            },

            onTapDown: (TapDownDetails details){
              showPopupMenu(details.globalPosition, context);
              },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/Profile.png",width: 20,height: 20,fit: BoxFit.contain,),
                Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: // Profile
                    Text(
                        "Profile",
                        style: const TextStyle(
                            color:   Colors.red,
                            fontWeight: FontWeight.w600,
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.0
                        ),
                        textAlign: TextAlign.left
                    )
                ),
              ],),
          ),
        ),
      ],


      backgroundColor: Colors.white,
      // leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),
      //   onPressed: (){
      //   return scaffoldKey.currentState.openDrawer();
      // },),
    );
  }


  showFilterDialog(BuildContext context){
    showDialog(context: context, builder:(context){
      return AlertDialog(
        backgroundColor:  Color(0xfff9f9f9),
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        // insetPadding:
        // maxWidth>700?
        // EdgeInsets.only(left: 100,right: 100,top: 50,bottom: 50):
        // EdgeInsets.all(5),
        // contentPadding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5)),

        content: FilterScreen(),);
    });
  }

}
