
import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_container/overlay_container.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:webrevue/AppBar/AppBarFirst.dart';
import 'package:webrevue/AppBar/AppBarSec.dart';
import 'package:webrevue/AppBar/MainDrawer.dart';
import 'package:webrevue/AppBar/SearchWidget.dart';
import 'package:webrevue/AppBar/popupmenu.dart';
import 'package:webrevue/LoginDashboard/LoginScreen.dart';
import 'package:webrevue/LoginDashboard/widgets/side_drawer.dart';
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

import '../main.dart';

class CompoundList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CompoundListState();
  }
  CompoundList({Key key}):super(key:key);
}

List<CompoundModal> recommendedList=[];

class CompoundListState extends State<CompoundList>{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool filter = false;
  String selectedCategory;
  String selectedLocation;
  List category = ['1', '2', '3', '4', '5', '6'];
  bool viewmore = false;
  List  texthover;
  // bool loggedIn=false;

  ScrollController controller= new ScrollController();
  var optionMenuSelected;
  ScrollController _scrollController;
  String lastObjectId = "";
  List compoundList = [];
  List amenityList = [];
  String search="";

  String searchResult="Recommended";
  bool load=false;
  int currentPage=0;
int propertyCount=0;
int documentCountPerPage=10;
ItemScrollController itemScrollController=new ItemScrollController();

  bool signInHover=false;

  @override
  void initState() {
    super.initState();

    _scrollController  = ScrollController();
    getFavoriteCompound();
    // texthover  = List.filled(propertyImage.length, false);

    var uri = Uri.dataFromString(window.location.href); //converts string to a uri
    Map<String, dynamic> params = uri.queryParameters;

    setState(() {
      if(params['search']!=null)
      search=params['search'];
      if(params['page']!=null)
      currentPage=params['page'];
    });


    _scrollController.addListener(() {

      if(SearchWidgetState.overlayEntry!=null && SearchWidgetState.overlayEntry.mounted)
      SearchWidgetState.hideIndicator(context);
    });


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


  getCompoundList({String search,int page})async{
    setState(() {
      load=true;
    });
   await Webservice.getCompoundRequest(context,compoundList, "",propertyCount,search: search!=null?search:"",page: page);
   setState(() {
load=false;
   });

  }


  void updateCompounds(){
    lastObjectId = (compoundList.last as CompoundModal).id;
    Webservice.getCompoundRequest(context, compoundList, lastObjectId,propertyCount).then((
        value) => this.setState(() {}));
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
          drawer: Drawer(
            child: MainDrawer(context),
          ),
          backgroundColor: Colors.white,
          key: scaffoldKey,
          appBar: width?
          PreferredSize(preferredSize: Size.fromHeight(80),
            child:  AppBarFirst( constraints.maxWidth,loggedIn),)
              :appBarWidget(),


          body:GestureDetector(
            onTap: (){
              AppBarFirstState().hideIndicator(context);
            },
            child: Column(

              children: [
              Expanded(
              child: Scrollbar(
                child:

              SingleChildScrollView(
                  controller: _scrollController,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(bottom: BorderSide(color: Colors.black12))
                        ),
                        child: SearchWidget(maxWidth/2.3),
                      ),

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
                          child:     load?Container(
                              alignment: Alignment.topCenter,
                              margin: maxWidth>=700?EdgeInsets.only(right: 40):EdgeInsets.all(10),
                              height: maxheight,
                              width: maxWidth/2,
                              child: Center(child: CircularProgressIndicator())):  LeftSideCompound(maxWidth/2,compoundList),
                        ),
                        NearByProperty(width:maxWidth/3)
                      ],):
                      maxWidth>=1000?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          load?Container(
                              alignment: Alignment.topCenter,
                              margin: maxWidth>=700?EdgeInsets.only(right: 40):EdgeInsets.all(10),
                              height: maxheight,
                              width: maxWidth/2,
                              child: Center(child: CircularProgressIndicator())): LeftSideCompound(maxWidth/2,compoundList),
                        NearByProperty(width:maxWidth/3,)
                      ],):
                      load?Center(child: CircularProgressIndicator(),):  LeftSideCompound(maxWidth,compoundList),
            Container(
              alignment: Alignment.center,
              width:maxWidth,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: paginateButtons(propertyCount,maxWidth),),
            ),
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



  Widget filterWidget(bool width,double maxWidth){
    return Padding(
      padding: const EdgeInsets.only(left: 30,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Recommended
          Text("Properties",
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
      leading:Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        onPressed: () {

        scaffoldKey.currentState.openDrawer();
        },
      ),
    ) ,
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
          child: loggedIn?InkWell(
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
          ):Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              hoverColor: Color(0xfff9f9f9),
              onHover: (value) {
                setState(() {
                  signInHover = value;
                });
              },
              onTap: () {

                Navigator.of(context).pushNamedAndRemoveUntil(initialroute,
                        (Route<dynamic> route) => false);
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                    color: signInHover ? ColorClass.redColor : ColorClass.blueColor,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0),
              ),
            ),
          ),
        ),
      ],


      backgroundColor: Color(0xfff9f9f9),

    );
  }


  showFilterDialog(BuildContext context){
    showDialog(context: context, builder:(context){
      return AlertDialog(
        backgroundColor:  Color(0xfff9f9f9),
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5)),

        content: FilterScreen(),);
    });
  }

  List<Widget> paginateButtons(int totalResult,double width)
  {
    int count=(totalResult%documentCountPerPage==0?(totalResult/documentCountPerPage).toInt() :((totalResult/documentCountPerPage).toInt() +1));

    List<Widget> children=[];

    if(count>=10)
    children.add(MaterialButton(
     height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color:currentPage>0? ColorClass.blueColor:Colors.grey,
      elevation: 5,
      child: Text("Previous",
          style: const TextStyle(
          color:  const Color(0xffffffff),
        fontWeight: FontWeight.w700,
        fontStyle:  FontStyle.normal,
        fontSize: 12.0)),
      onPressed: (){
        if(currentPage>0)
          {
            int page=currentPage-1;
            getCompoundList(page: page,search: search);
            setState(() {
              currentPage=page;

            });
            if(currentPage>2 &&  count-currentPage>3)
              itemScrollController.jumpTo(index: currentPage,alignment: 0.5);
            _scrollController.jumpTo(0);
          }

      },));
    if(count>1)
   children.add( Container(
     alignment: Alignment.center,
     height: 50,
     width: maxWidth>700?500:300,
     child: ScrollablePositionedList.builder(

       physics: NeverScrollableScrollPhysics(),
       itemScrollController: itemScrollController,
       scrollDirection: Axis.horizontal,
        itemCount: count,itemBuilder: (context, index) {
       return Container(
         margin: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
         width: 40,
         child: MaterialButton(
           height: 10,
           shape: RoundedRectangleBorder(
               side: BorderSide(color: ColorClass.blueColor),
               borderRadius: BorderRadius.circular(5)),
color: currentPage==index?ColorClass.blueColor:Colors.white,
           elevation: 5,
           child: Text((index+1).toString(),style: TextStyle(color: currentPage==index?Colors.white:Colors.black87),),
            onPressed: (){
              int page=index;
              getCompoundList(page: page,search: search);
              setState(() {
                currentPage=page;
              });
              _scrollController.jumpTo(0);
            },),
       );
      },),
   )
   );

    if(count>=10)
    children.add(MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: currentPage<count-1?ColorClass.blueColor:Colors.grey,
      height: 40,
      elevation: 5,
      child: Text("Next",style: const TextStyle(
          color:  const Color(0xffffffff),
          fontWeight: FontWeight.w700,
          fontStyle:  FontStyle.normal,
          fontSize: 12.0)),
      onPressed: () {
        if(currentPage<count-1)
          {
            int page=currentPage+1;
            getCompoundList(page: page,search: search);
            setState(() {
              currentPage=currentPage+1;

            });
            if(currentPage>5 && count-currentPage>2)
              itemScrollController.jumpTo(index: currentPage,alignment: 0.5);
            _scrollController.jumpTo(0);
          }

      },));
    return children;

  }
}
