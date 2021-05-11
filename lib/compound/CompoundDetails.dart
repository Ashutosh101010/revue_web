import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';
import 'package:webrevue/AppBar/AppBarSec.dart';
import 'package:webrevue/ColorClass.dart';
import 'package:webrevue/TabWidget/RatingWidgetClass.dart';
import 'package:webrevue/TabWidget/ReviewsTab.dart';
import 'package:webrevue/route/routing_constant.dart';

import 'scrollable_list_tabview.dart';

class CompoundDetails extends StatefulWidget{
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

List propertyImage = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZsmuFTDaUChoTxaDvUsSEk5CdUzc1FZ6rFA&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp_Bl9CBscbW5R7ybrm6nKVupKCTEdnLdm8Q&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScNe5S2tg9HBwDMgYXPUJHaf3KyNip-Oi_Kg&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQamaovVKPSjAZvTrE3Mx0nyiA669Yk6NjlSw&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRynn64tApqf-fY10Y5JHa-s-HCnjfNTVQcFA&usqp=CAU"
];

  bool favhover = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      filterProperty = filterList[0];
    });
  }


ScrollController controller=new ScrollController();

@override
  Widget build(BuildContext context) {
   return Material(
     child:LayoutBuilder(builder: (context,constraints){
       var maxWidth = constraints.maxWidth>700;
       return  Scaffold(
         key: scaffoldKey,
         backgroundColor: Colors.white,
         appBar:  maxWidth?
        PreferredSize(preferredSize: Size.fromHeight(70),child:  AppBarSec(),)
             :AppBar(
           backgroundColor: Colors.white,
           leading: IconButton(icon: Icon(Icons.menu,color: Colors.black,),onPressed: (){
             return scaffoldKey.currentState.openDrawer();
           },),
         ),

         body: SmoothScrollWeb(controller: controller,
           child: SingleChildScrollView(controller: controller,
             scrollDirection: Axis.vertical,
             clipBehavior: Clip.antiAliasWithSaveLayer,
             physics:AlwaysScrollableScrollPhysics(),
             child: Stack(
               children: [
                 constraints.maxWidth>=1200?  Row(mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     leftPanel(context,constraints.maxWidth,constraints.maxHeight),
                     rightPanel(context)
                   ],):
                 constraints.maxWidth>=1000?  Row(mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     leftPanel(context,constraints.maxWidth,constraints.maxHeight),
                     rightPanel(context)
                   ],):
             leftPanel(context,constraints.maxWidth,constraints.maxHeight),
                 Positioned(
                   top: 70,
                   child: Container(width: MediaQuery.of(context).size.width
                     ,height: 1,color: Colors.black12,),
                 ),
               ],
             ),
           ),
         ),

       );
     },)
   );
  }

  
  
  Widget leftPanel(BuildContext context,double _width,double _height){
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 20),
      width:_width>=1200?_width-500:_width>=1000?_width-300:_width,
      height:_height,
      child:  ScrollableListTabView(
        tabHeight: 60,
        bodyAnimationDuration: const Duration(milliseconds: 150),
        tabAnimationCurve: Curves.easeOut,
        tabAnimationDuration: const Duration(milliseconds: 200),
        tabs: [
          ScrollableListTab(
              tab: ListTab(
                  activeBackgroundColor: Colors.white,
                  inactiveBackgroundColor: Colors.white,
                  borderColor: Colors.white,
                  label: Text('Rating', style: TextStyle(color: Colors.white)),
                  showIconOnList: false),
              body:ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context,index){
                  return RatingWidgetClass();
                },
              )),

          ScrollableListTab(
              tab: ListTab(
                  activeBackgroundColor: Colors.white,
                  inactiveBackgroundColor: Colors.white,
                  borderColor: Colors.white,
                  label: Text('Review',
                      style: TextStyle(color: Colors.white,)),
                  showIconOnList: false),
              body: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 50,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Properties  ",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,
                            fontSize: 23, fontFamily: "Mulish",
                            fontStyle:  FontStyle.normal,),),

                        Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 10, right: 10,),
                          child: DropdownButtonHideUnderline(
                            child: GFDropdown(
                              hint: Text(
                                "Filter",
                                style: TextStyle(color: Colors.black87),
                              ),
                              dropdownButtonColor: Colors.white,
                              padding: EdgeInsets.all(10),
                              itemHeight: 4,
                              icon: Icon(Icons.keyboard_arrow_down_outlined),
                              iconEnabledColor: ColorClass.blueColor,
                              value:filterProperty,
                              onChanged: (newValue) {
                                setState(() {
                                  filterProperty = newValue;
                                });
                              },
                              items: filterList
                                  .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(value,style: TextStyle(fontWeight: FontWeight.w500),),
                              ))
                                  .toList(),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                  ListView.builder(shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,itemBuilder: (context,index){

                      return ReviewsTab();

                    },),
                ],
              )
          ),
          ScrollableListTab(
              tab: ListTab(
                  activeBackgroundColor: Colors.white,
                  inactiveBackgroundColor: Colors.white,
                  borderColor: Colors.white,
                  label: Text('Facilities',
                      style: TextStyle(color: Colors.white,)),
                  showIconOnList: false),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.only(left: 50,right: 50,bottom: 10),
                    child: Container(
                      width:_width,
                      height: 500,
                      child: GridView.builder(
                        itemCount: propertyImage.length,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: _width>=1200?4:_width>=1000?3:1
                          ),
                          shrinkWrap: true,
                          itemBuilder: (context,ind){
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                child: Image.network(propertyImage[index],fit: BoxFit.fill,),
                              ),
                            );
                          }),
                    ),
                  );
                },
              )),

          ScrollableListTab(
              tab: ListTab(
                  activeBackgroundColor: Colors.white,
                  inactiveBackgroundColor: Colors.white,
                  borderColor: Colors.white,
                  label: Text('Location',
                      style: TextStyle(color: Colors.white,)),
                  showIconOnList: false),
              body: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.only(left: 50,right: 50,bottom: 10),
                    child: Container(
                      width: _width,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.white, BlendMode.dstOver),
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/map.png"))),
                    ),
                  );
                },
              )),

        ],

      ),);
  }
  
  Widget rightPanel(BuildContext context){
    return  Container(
      width: 350,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(left: 20,right:50,top: 10,),
      child: ListView(
        shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
        children: <Widget>[

          Container(
            width: 200,
            height: 40,
            margin: EdgeInsets.only( left: 50,right:50 ,  top: 10, bottom: 10),
            child: FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, addreview);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              color: ColorClass.blueColor,
              hoverColor: Colors.blue.shade900,
              child: // Write Review
              Text(
                  "Write Review",
                  style: const TextStyle(
                      color:  const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Mulish",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.0
                  ),
                  textAlign: TextAlign.left
              ),),
          ),
          Padding(
            padding: EdgeInsets.only( left: 20,right:20 ,  top: 20, bottom: 10),
            child: Text(
                "Also by these companies Explore other developments by More. ‘Superenting’",
                style:  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Mulish",
                    fontStyle:  FontStyle.normal,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.left
            ),
          ),
          ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return Container(
                // alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 170,width: 300,
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
                              color:  Colors.black,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w600,
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
                              color:  Colors.black,
                              fontFamily: "Mulish",
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
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Mulish",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.0
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                Text(
                                    " (54 reviews)",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Mulish",
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



}

