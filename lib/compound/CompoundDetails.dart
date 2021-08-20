
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:webrevue/AppBar/AppBarSec.dart';
import 'package:webrevue/AppBar/MainDrawer.dart';
import 'package:webrevue/AppBar/popupmenu.dart';
import 'package:webrevue/compound/widget/Header.dart';
import 'package:webrevue/compound/widget/PersistentHeader.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/TabWidget/CompoundDetailTab.dart';
import 'package:webrevue/TabWidget/ReviewsTab.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/footer/FooterWidget.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/model/arguments/AddReviewArgument.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/Webservice.dart';

import 'dart:html' as html;


class CompoundDetails extends StatefulWidget{

  String compoundID;
  CompoundModal compoundModal;
  // String compoundName;
  // List images= [];
  // String address;
  // String id;


  CompoundDetails({Key key,this.compoundID}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return CompoundDetailState();
  }
}

class CompoundDetailState extends State<CompoundDetails> with SingleTickerProviderStateMixin{
List tabs=[];
var scaffoldKey = GlobalKey<ScaffoldState>();
  double valueRating =4.0;
  int listIndex = 0;
bool searchWidget = false;
bool aboutHover = false;
bool blogHover = false;
bool filterHover = false;
bool profileHover = false;
bool searchHover = false;
var optionMenuSelected;
String filterProperty;
List filterList =["Most Recent","Most Useful","Highest Rating"];

bool load=false;

  bool favhover = false;

  CompoundModal compoundModal;

int selectedTab=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCompoundDetails();

    filterProperty = filterList[0];
    controller.addListener(() {


      if(controller.offset>=0&&controller.offset<=690)
        {

          HeaderKey.currentState.setState(() {
            HeaderKey.currentState.selectedTab=1;
          });
        }
      else if(controller.offset>690&&controller.offset<=1160)
        {

          HeaderKey.currentState.setState(() {
            HeaderKey.currentState.selectedTab=2;
          });
        }
      else if(controller.offset>1160)
        {
          HeaderKey.currentState.setState(() {
            HeaderKey.currentState.selectedTab=3;
          });
        }
    });


    fetchReview();
    checkReview();
  }


List reviewList = [];


  bool exists;
  checkReview()async{
    exists = await Webservice.checkReview(widget.compoundID);
    setState(() {

    });
  }


fetchReview(){
  Webservice.fetchAllReviews(context,
      widget.compoundID,reviewList).then((value) => this.setState(() {

  }));

}


onRefresh(){
  html.window.onBeforeUnload.listen((event) async{
    setState(() {

    });
  });
}
getCompoundDetails()async{
  setState(() {
    load=true;
  });
  CompoundModal value = await Webservice.getCompoundDetails(widget.compoundID);
  setState(() {
compoundModal=value;
    load=false;
  });

  // GlobalKeys.compoundDetailsKey.currentState.setState(() {
  //   GlobalKeys.compoundDetailsKey.currentState.widget.compoundModal=value;
  // });

}

ScrollController controller=new ScrollController();



  @override
  Widget build(BuildContext context)
  {

    return Material(
      child:

      compoundModal==null?Center(child: CircularProgressIndicator()):LayoutBuilder(builder: (context, constraints) {
        var maxWidth = constraints.maxWidth>700;
        return Scaffold(
          key: scaffoldKey,
         backgroundColor: Colors.white,
            drawer: Drawer(child: MainDrawer(context),),
            appBar:  maxWidth?
        PreferredSize(preferredSize: Size.fromHeight(70),child:  AppBarSec(key: MainAppBarKey,),)
             :
            AppBar(
              actions: [
                Container(height: 80,
                  alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      left: 20,top: 5,),
                    child: InkWell(
                      mouseCursor: SystemMouseCursors.click,
                      onTap: (){

                        if(!exists){
                          Navigator.pushNamed(context, addreview,
                              arguments: AddReviewArgument(widget.compoundID,
                                compoundModal.compoundname,
                                compoundModal.images,
                                compoundModal.address,

                              ));
                        }else{
                          displayAlertDialog(context,content: "Your review already exists",title: "Post Review");
                        }
                      },
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle,color: ColorClass.blueColor,size: 23,),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                                "Add Review",
                                style: const TextStyle(
                                    color:   Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 12.0
                                ),
                                textAlign: TextAlign.left
                            ),
                          ),
                        ],),
                    )),




                Container(height: 80,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      left: 20, right: 20,top: 5, ),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){

                        },
                        onTapDown: (TapDownDetails details){
                          showPopupMenu(details.globalPosition,context);
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
                    )),
              ],

           backgroundColor: Colors.white,
           leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
             return scaffoldKey.currentState.openDrawer();
           },),
         ),

body: CustomScrollView(shrinkWrap: true,
  controller: controller,
  slivers: [
    SliverPersistentHeader(
        pinned: true,
        delegate:PersistentHeader(
            controller: controller,widget:
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Expanded(
             child: Container(margin: EdgeInsets.only(left:20,right:20),
                 child: Header(controller: controller,key: HeaderKey))),
       constraints.maxWidth>=700?  Container(
           width: 200,
           height: 40,
           margin: EdgeInsets.only( left: constraints.maxWidth>=1200?constraints.maxWidth/2:constraints.maxWidth/4,right:50 ,  top: 10, bottom: 10),
           child: MaterialButton(
             onPressed: (){

               if(!exists){
                 Navigator.pushNamed(context, addreview,
                     arguments: AddReviewArgument(widget.compoundID,
                       compoundModal.compoundname,
                       compoundModal.images,compoundModal.address,

                     ));
               }else{
                 displayAlertDialog(context,content: "Your review already exists",title: "Post Review");
               }


             },
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
             color: ColorClass.blueColor,
             hoverColor: Colors.blue.shade900,elevation: 10,
             child:
             Text(
                 "Write Review",
                 style: const TextStyle(
                     color:  const Color(0xffffffff),
                     fontWeight: FontWeight.w700,
                     fontStyle:  FontStyle.normal,
                     fontSize: 16.0
                 ),
                 textAlign: TextAlign.left
             ),),
         ):Container(),

       ],
     )
    )),

    SliverList(
        delegate: SliverChildListDelegate(
            [
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: compoundModal==null?Container():leftPanel(context,constraints.maxWidth),
              )
              ),
              constraints.maxWidth>=1100?rightPanel(context):Container()
            ],
          ),
              Container(margin: EdgeInsets.only(top:10,left: 8,right: 8),
              color: Colors.black26,width: MediaQuery.of(context).size.width,height: 1,)

              ,FooterWidget()
        ])
    )

  ],
),
//
        );
      },),
    );
  }



  Widget leftPanel(BuildContext context,double width)
  {
    return   Column(
      children: [
        CompoundDetailTab(compoundModal),
        Padding(
          padding:  EdgeInsets.only(left: width<=800?10:50,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Reviews  ",
                style: TextStyle(
                  color: Colors.black87,fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontStyle:  FontStyle.normal,),),


            ],
          ),
        ),
       compoundModal==null?Container():ReviewsTab(reviewList,compoundModal.address),

        // reviewList.isEmpty?
        // Text("Please Add Review to view more Reviews",
        //   style: TextStyle(color: ColorClass.redColor,fontSize: 16,fontWeight: FontWeight.w500),):
        //     Text("")

      ],
    );
  }
  

  
  Widget rightPanel(BuildContext context){
    return  Container(
      width: 350,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(left: 20,right:50,top: 10,),
      child: ListView(
        shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only( left: 20,right:20 ,  top: 20, bottom: 10),
            child: Text(
                "Also by these companies Explore other developments by More. ‘Superenting’",
                style:  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
          ),
          ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 140,width: 300,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(onTap: (){},
                          child: Container(
                            width: 35,height: 35,alignment: Alignment.center,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: favhover?ColorClass.blueColor:Colors.white,),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: favhover?
                              Image.asset(
                                "assets/images/heart.png",
                                fit: BoxFit.contain,height: 20,width: 20,):
                              Image.asset(
                                "assets/images/heart.png",
                                fit: BoxFit.contain,height: 20,width: 20,),
                            ),
                          ),
                        ),),
                      decoration: BoxDecoration(image:
                      DecorationImage(
                        image: AssetImage("assets/images/house.png"),
                        fit: BoxFit.fill,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15,top: 5),
                      child: Text(
                          "The Trilogy, M15",
                          style:  TextStyle(
                              color:  Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontStyle:  FontStyle.normal,
                              fontSize: 16.0
                          ),
                          textAlign: TextAlign.left
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15,top: 5),
                      child: Text(
                          "More ‘Superenting’, Allsop Letting and Managementr",
                          style:  TextStyle(
                              color:  Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontStyle:  FontStyle.normal,
                              fontSize: 15.0
                          ),
                          textAlign: TextAlign.left
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15,top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GFRating(
                            size: 20,
                            value: valueRating,
                            color: Colors.yellow,
                            borderColor: Colors.yellow,
                            onChanged: (value) {
                              setState(() {
                                valueRating = value;
                              });
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                    "4.85",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.0
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                Text(
                                    " (54 reviews)",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.0
                                    ),
                                    textAlign: TextAlign.left
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],),
              );
            },
          ),

        ],
      ),
    );
  }
  // showPopupMenu(Offset offset) async {
  //   double left = offset.dx;
  //   double top = offset.dy;
  //   await showMenu<String>(
  //     context: context,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  //     color: ColorClass.blueColor,
  //     position: RelativeRect.fromLTRB(left, top, left+1, top+2),
  //     items: [
  //       PopupMenuItem(child:
  //       Text("My Account",textAlign: TextAlign.center,
  //         style: TextStyle(color: Colors.white,),),value: '1',),
  //       PopupMenuDivider(),
  //       PopupMenuItem(child:
  //       Text("Favourites",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),value: '2',),
  //       PopupMenuDivider(),
  //       PopupMenuItem(child:
  //       Text("My Reviews",textAlign: TextAlign.center,style: TextStyle(color: Colors.white)),value: '3',),
  //       PopupMenuDivider(),
  //       PopupMenuItem(
  //         child: Container(alignment: Alignment.center,child: Text("Logout",
  //           textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),))
  //         ,value: '4',)
  //     ],
  //     elevation: 8.0,
  //   ).then<void>((String itemSelected) {
  //     if (itemSelected == null) return;
  //
  //     if(itemSelected == "1"){
  //
  //     }else if(itemSelected == "2"){
  //
  //     }else if(itemSelected == "3"){
  //       Navigator.pushNamed(context, myreviews);
  //
  //     }else if(itemSelected == "4"){
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  //     }
  //
  //   });
  // }

}

