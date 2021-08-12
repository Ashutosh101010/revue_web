import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class NearByProperty extends StatefulWidget{
  double width;

  NearByProperty({this.width});

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
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 140,width: 300,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            width: 30,height: 30,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,color: Colors.white,),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.asset("assets/images/heart.png",
                                fit: BoxFit.contain,height: 20,width: 20,),
                            ),
                          ),
                        ),),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage("assets/images/house.png"),
                            fit: BoxFit.fill,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15,top: 5),
                      child: Text(
                          "The Trilogy, M15",
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
                          "More ‘Superenting’, Allsop Letting and Managementr",
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
                            value: 3.4,
                            color: Colors.yellow,
                            borderColor: Colors.yellow,
                            onChanged: (value) {
                              setState(() {

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

                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.0
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                Text(
                                    " (54 reviews)",
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
            },
          ),

        ],
      ),
    );
  }

}