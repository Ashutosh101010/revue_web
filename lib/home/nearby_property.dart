import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:getwidget/getwidget.dart';
import 'package:webrevue/LoginDashboard/LoginScreen.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/get_rating_percent.dart';
import 'package:webrevue/favoriteCompound/FavoriteCompound.dart';
import 'package:webrevue/home/CompoundList.dart';
import 'package:webrevue/main.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/model/FavoriteModal.dart';
import 'package:webrevue/service/ServerDetails.dart';
import 'package:webrevue/service/Webservice.dart';

class NearByProperty extends StatefulWidget{
  List list;
  double width;

  NearByProperty({this.width,this.list});

  @override
  State<StatefulWidget> createState() {
    return NearByPropertyState();
  }
}

class NearByPropertyState extends State<NearByProperty>{
  double width;
  @override
  void initState() {
    super.initState();
    width = widget.width;

    getRecommendedProperties();
  }

  getRecommendedProperties()async{
    await  Webservice.getRecommendedCompoundRequest(context);
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 400,alignment: Alignment.topCenter,
      margin: width>=400?EdgeInsets.only(left: 60):EdgeInsets.all(10),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding:EdgeInsets.only(left: 20,right: 20,bottom: 10),
            child: Text(
                "Property nearby you",
                style: const TextStyle(
                    color:  const Color(0xff000000),
                    fontWeight: FontWeight.w500,

                    fontStyle:  FontStyle.normal,
                    fontSize: 20.0
                ),
                textAlign: TextAlign.left
            ),
          ),
          ListView.builder(
            itemCount: recommendedList.length,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return nearByCompoundCard(index);
            },
          ),

        ],
      ),
    );
  }



  Widget nearByCompoundCard(int index){
    CompoundModal modal = recommendedList[index]as CompoundModal;
    bool favourite=false;

    if(favouriteIDList.contains(modal.id)){
      favourite = !favourite;
    }

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 140,width: 300,
              child: Stack(children: [
                Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(
                      ServerDetails.get_images+modal.images[index],
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: false,
                  itemCount: modal.images.length,
                  pagination: new SwiperPagination(),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      width: 35,height: 35,alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorClass.blueColor,),
                      child: IconButton(icon:  favourite?
                      Icon(
                        CupertinoIcons.suit_heart_fill,
                        color: Colors.white,size: 20,
                      ):Icon(
                        CupertinoIcons.heart,
                        color: Colors.white,size: 20,
                      ),alignment: Alignment.center,
                        color: ColorClass.blueColor,
                        onPressed: () async{
                          if(!loggedIn)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You must log in"),width: 500,elevation: 5,behavior: SnackBarBehavior.floating,));

                          }
                          else{

                            favourite = !favourite;
                            FavoriteModal favModal = new FavoriteModal();

                            if(favourite == false){
                              favouriteIDList.remove(modal.id);
                              favList.remove(modal);
                              favModal.compoundID =modal.id;
                              await Webservice.removeFavoriteRequest(context,favModal);

                              setState(() {

                              });
                            }
                            else{
                              favouriteIDList.add(modal.id);
                              favList.add(modal);
                              favModal.compoundID =   modal.id;
                              await Webservice.addFavoriteRequest(context,favModal);
                              setState(() {

                              });
                            }
                          }
                        },),
                    ),
                  ),),
              ],)

            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
            //     image: DecorationImage(
            //       image: AssetImage("assets/images/house.png"),
            //       fit: BoxFit.fill,)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15,top: 5),
            child: Text(
                modal.compoundname,
                style:  TextStyle(
                    color:  Colors.black,

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
                modal.address,
                style:  TextStyle(
                    color:  Colors.black,
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
                  value: getpercentage(modal.rating),
                  color: Colors.yellow,
                  borderColor: Colors.yellow,
                ),





                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                          modal.rating.toStringAsFixed(1),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,

                              fontStyle:  FontStyle.normal,
                              fontSize: 16.0
                          ),
                          textAlign: TextAlign.left
                      ),

                      Text(
                          " (${modal.reviewCount} reviews)",
                          style: TextStyle(
                              color: Colors.black,

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
  }

}