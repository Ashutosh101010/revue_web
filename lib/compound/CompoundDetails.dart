
import 'dart:html';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:webrevue/AppBar/AppBarFirst.dart';
import 'package:webrevue/AppBar/AppBarSec.dart';
import 'package:webrevue/AppBar/MainDrawer.dart';
import 'package:webrevue/AppBar/popupmenu.dart';
import 'package:webrevue/LoginDashboard/widgets/side_drawer.dart';
import 'package:webrevue/compound/widget/Header.dart';
import 'package:webrevue/compound/widget/PersistentHeader.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/TabWidget/CompoundDetailTab.dart';
import 'package:webrevue/TabWidget/ReviewsTab.dart';
import 'package:webrevue/constants/loading_dialog.dart';
import 'package:webrevue/footer/FooterWidget.dart';
import 'package:webrevue/home/nearby_property.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/model/arguments/AddReviewArgument.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/Webservice.dart';

import 'dart:html' as html;

import '../main.dart';


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

  // bool loggedIn=false;
int selectedTab=1;

  bool signInHover=false;

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

//
// onRefresh(){
//   html.window.onBeforeUnload.listen((event) async{
//     setState(() {
//
//     });
//   });
// }
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
        PreferredSize(preferredSize: Size.fromHeight(70),child:  AppBarFirst(constraints.maxWidth,loggedIn),)
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

                        if(!loggedIn)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You must log In"),behavior: SnackBarBehavior.floating,width: 500,));
                          return;
                          }
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




              loggedIn?  Container(height: 80,
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
                    )):     Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                           top:15,  bottom: 10, left: 10, right: 30),
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
           child:
           MaterialButton(
             onPressed: (){
if(!loggedIn)
  {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: Text("Please login to Add Review"),width: 500 ,behavior: SnackBarBehavior.floating,));
  }
              else if(!exists){
                 Navigator.pushNamed(context, addreview,
                     arguments: AddReviewArgument(widget.compoundID,
                       compoundModal.compoundname,
                       compoundModal.images,compoundModal.address,

                     ));
               }else{
  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: Text("Your review already exists"),width: 500 ,behavior: SnackBarBehavior.floating,));

  // displayAlertDialog(context,content: "Your review already exists",title: "Post Review");
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
                child: compoundModal==null?Container():leftPanel(context,constraints.maxWidth,compoundModal),
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



  Widget leftPanel(BuildContext context,double width,CompoundModal compoundModal)
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
       compoundModal!=null?loggedIn?ReviewsTab(reviewList,compoundModal.address):
       Container(padding: EdgeInsets.all(60),
         child:
       Text("Please Login to View Reviews",
           style:  TextStyle(
               color:ColorClass.redColor ,
               fontWeight: FontWeight.w700,
               fontStyle: FontStyle.normal,
               fontSize: 16.0),
           textAlign: TextAlign.center),):Container(),

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
      child: NearByProperty(width: 350,),

    );
  }


}

