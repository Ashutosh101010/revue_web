import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../constants/ColorClass.dart';
import '../home/CompoundList.dart';

class FilterScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FilterScreenState();
  }
}

class FilterScreenState extends State<FilterScreen>{
  // List minpriceRange = [
  //   '5 Lac',
  //   '10 Lac',
  //   '15 Lac',
  //   '20 Lac',
  //   '25 Lac',
  //   '30 Lac',
  //   '35 Lac',
  //   '40 Lac'
  // ];
  // List maxpriceRange = [
  //   '5 Lac',
  //   '10 Lac',
  //   '15 Lac',
  //   '20 Lac',
  //   '25 Lac',
  //   '30 Lac',
  //   '35 Lac',
  //   '40 Lac'
  // ];
  // List bedRooms = ['1', '2', '3', '4', '5', '6'];

  String radiusSelected;
  // String minPrice;
  // String maxPrice;
  String selectedRooms;
  String selectedCategory;
  String selectedLocation;
  String selectedRent;
  String propertyType;
  // String minBed;
  // String maxBed;
  // String minBath;
  // String maxBath;
  String minArea;
  String maxArea;
  String furnishingType;
  List propertyTypeList = ['Any','Compound','Apartment'];
  List category = ['1', '2', '3', '4', '5', '6'];
  List bathRoomsList = ['1','2','3','4'];
  List arealist = ['near by','5 KM','10 KM','20 KM','40 KM','45 KM','50 KM'];
  List furnishingTypeList = ['Fully Furnished','Semi Furnished','Furnished','None' ];

  double maxwidth;
  @override
  Widget build(BuildContext context) {
     maxwidth = MediaQuery.of(context).size.width;
    return Container(
      // width:  maxwidth>=700?500:maxwidth,
      // decoration: BoxDecoration(borderRadius:BorderRadius.circular(10), ),
      // alignment: Alignment.center,
      // margin:  maxwidth>=700? EdgeInsets.only(left: 40,right: 40):null,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            maxwidth<700?Container(
              alignment: Alignment.centerLeft,
              height: 50,color: Colors.white,
              width: maxwidth,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
                  ],
                ),
              ),
            ): Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Text("Filter",style: TextStyle(color: Colors.black87,fontSize: 17,
                  fontWeight: FontWeight.w500),),
              Align(alignment: Alignment.topRight,child: InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.clear,color: Colors.black,)),),
            ],),


            search(),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Price Range"),
                  ),
                  rentWidget(),
                ],
              ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Furnished"),
                    ),
                    furnishedType()
                  ],
                ),

            ],),
            SizedBox(height: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Property Type"),
                ),
                propertyTypeWidget(),

            ],),

            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Select area"),
              ),
              areaWidget(),
            ],),


            SizedBox(height: 30,) ,


            MaterialButton(padding: EdgeInsets.all(20),
              child: Text("Search Property",style: TextStyle(
                  color:  const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),),
              elevation: 5,color: ColorClass.blueColor,hoverColor: Colors.blue.shade900,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              onPressed: (){
                Navigator.pop(context);
              },)

          ],),
      ),
    );
  }


  Widget rentWidget(){
    return FittedBox(
      child: Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Color(0x33000000), width: 1)),
        child: DropdownButtonHideUnderline(
          child: GFDropdown(
            hint: Text(
              "Rent",
              style: TextStyle(color:Colors.grey,),
            ),
            dropdownButtonColor: Colors.white,
            iconEnabledColor: ColorClass.blueColor,
            value: selectedCategory,
            onChanged: (newValue) {
              setState(() {
                selectedCategory = newValue;
              });
            },
            items: category
                .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value, style:  TextStyle(
                color: Colors.black,

              ),),
            ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget propertyTypeWidget(){
    return Row(children: [
      Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Color(0x33000000), width: 1)),
        child: DropdownButtonHideUnderline(
          child: GFDropdown(
            hint: Text(
              "Property Type",
              style: TextStyle(color:Colors.grey,),
            ),
            dropdownButtonColor: Colors.white,
            iconEnabledColor: ColorClass.blueColor,
            value: propertyType,
            onChanged: (newValue) {
              setState(() {
                propertyType = newValue;
              });
            },
            items: propertyTypeList
                .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value, style:  TextStyle(
                color: Colors.black,

              ),),
            ))
                .toList(),
          ),
        ),
      ),
      Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Color(0x33000000), width: 1)),
        child: DropdownButtonHideUnderline(
          child: GFDropdown(
            hint: Text(
              "Monthly",
              style: TextStyle(color:Colors.grey),
            ),
            dropdownButtonColor: Colors.white,
            iconEnabledColor: ColorClass.blueColor,
            value: selectedCategory,
            onChanged: (newValue) {
              setState(() {
                selectedCategory = newValue;
              });
            },
            items: category
                .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value, style:  TextStyle(
                color: Colors.black,

              ),),
            ))
                .toList(),
          ),
        ),
      ),
    ],);
  }


  Widget search(){
    return Container(
      margin: EdgeInsets.only(
          left: 10,
          right: 10,top: 10,bottom: 10
      ),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: Color(0x33000000), width: 1)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.search,
              color: ColorClass.blueColor,
              size: 20,
            ),
          ),
          Container(
            width:maxwidth>=700?400:maxwidth-300 ,
            child: TextField(
              style: const TextStyle(
                  color: const Color(0x99000000),
                  fontWeight: FontWeight.w400,

                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
              decoration: InputDecoration(
                  hintText: "Search Compound",
                  hintStyle: TextStyle(color:Colors.grey, ),
                  border: InputBorder.none,
                  fillColor: Colors.white),
              cursorColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Widget priceWidget(){
  //   return FittedBox(
  //     child: Row(children: [
  //       Container(
  //         height: 50,
  //         margin: EdgeInsets.all(10),
  //         width: 160,
  //         child: DropdownButtonHideUnderline(
  //           child: GFDropdown(
  //             hint: Text(
  //               "Min Price",
  //               style: TextStyle(color:Colors.grey, ),
  //             ),
  //             borderRadius: BorderRadius.circular(5),
  //             dropdownButtonColor: Colors.white,
  //             iconEnabledColor: ColorClass.blueColor,
  //             border: const BorderSide(
  //                 color: Colors.black12, width: 1),
  //             value: minPrice,
  //             onChanged: (newValue) {
  //               setState(() {
  //                 minPrice = newValue;
  //               });
  //             },
  //             items: minpriceRange
  //                 .map((value) => DropdownMenuItem(
  //               value: value,
  //               child: Text(value, style:  TextStyle(
  //                 color: Colors.black,
  //
  //               ),),
  //             ))
  //                 .toList(),
  //           ),
  //         ),
  //       ),
  //       Container(
  //         height: 50,
  //         width: 160,
  //         margin: EdgeInsets.all(10),
  //         child: DropdownButtonHideUnderline(
  //           child: GFDropdown(
  //             hint: Text(
  //               "Max Price",
  //               style: TextStyle(color:Colors.grey,),
  //             ),
  //             borderRadius: BorderRadius.circular(5),
  //             dropdownButtonColor: Colors.white,
  //             iconEnabledColor: ColorClass.blueColor,
  //             border: const BorderSide(
  //                 color: Colors.black12, width: 1),
  //             value: maxPrice,
  //             onChanged: (newValue) {
  //               setState(() {
  //                 maxPrice = newValue;
  //               });
  //             },
  //             items: maxpriceRange
  //                 .map((value) => DropdownMenuItem(
  //               value: value,
  //               child: Text(value, style:  TextStyle(
  //                 color: Colors.black,
  //
  //               ),),
  //             ))
  //                 .toList(),
  //           ),
  //         ),
  //       ),
  //     ],),
  //   );
  // }

  // Widget bedWidget(){
  //   return FittedBox(
  //     child: Row(children: [
  //       Container(
  //         height: 50,
  //         margin: EdgeInsets.all(10),
  //         width: 160,
  //         child: DropdownButtonHideUnderline(
  //           child: GFDropdown(
  //             hint: Text(
  //               "Min Bed",
  //               style: TextStyle(color:Colors.grey, ),
  //             ),
  //             borderRadius: BorderRadius.circular(5),
  //             dropdownButtonColor: Colors.white,
  //             iconEnabledColor: ColorClass.blueColor,
  //             border: const BorderSide(
  //                 color: Colors.black12, width: 1),
  //             value: minBed,
  //             onChanged: (newValue) {
  //               setState(() {
  //                 minBed = newValue;
  //               });
  //             },
  //             items: bedRooms
  //                 .map((value) => DropdownMenuItem(
  //               value: value,
  //               child: Text(value, style:  TextStyle(
  //                 color: Colors.black,
  //
  //               ),),
  //             ))
  //                 .toList(),
  //           ),
  //         ),
  //       ),
  //       Container(
  //         height: 50,
  //         width: 160,
  //         margin: EdgeInsets.all(10),
  //         child: DropdownButtonHideUnderline(
  //           child: GFDropdown(
  //             hint: Text(
  //               "Max Bed",
  //               style: TextStyle(color:Colors.grey, ),
  //             ),
  //             borderRadius: BorderRadius.circular(5),
  //             dropdownButtonColor: Colors.white,
  //             iconEnabledColor: ColorClass.blueColor,
  //             border: const BorderSide(
  //                 color: Colors.black12, width: 1),
  //             value: maxBed,
  //             onChanged: (newValue) {
  //               setState(() {
  //                 maxBed = newValue;
  //               });
  //             },
  //             items: bedRooms
  //                 .map((value) => DropdownMenuItem(
  //               value: value,
  //               child: Text(value, style:  TextStyle(
  //                 color: Colors.black,
  //
  //               ),),
  //             ))
  //                 .toList(),
  //           ),
  //         ),
  //       ),
  //     ],),
  //   );
  // }

  // Widget bathWidget(){
  //   return FittedBox(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         Container(
  //           height: 50,
  //           width: 160,
  //           margin: EdgeInsets.all(10),
  //           child: DropdownButtonHideUnderline(
  //             child: GFDropdown(
  //               hint: Text(
  //                 "Min Bath",
  //                 style: TextStyle(color:Colors.grey,),
  //               ),
  //               borderRadius: BorderRadius.circular(5),
  //               border: const BorderSide(
  //                   color: Colors.black12, width: 1),
  //               dropdownButtonColor: Colors.white,
  //               iconEnabledColor: ColorClass.blueColor,
  //               value: minBath,
  //               onChanged: (newValue) {
  //                 setState(() {
  //                   minBath = newValue;
  //                 });
  //               },
  //               items: bathRoomsList
  //                   .map((value) => DropdownMenuItem(
  //                 value: value,
  //                 child: Text(value, style:  TextStyle(
  //                   color: Colors.black,
  //
  //                 ),),
  //               ))
  //                   .toList(),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           height: 50,
  //           width: 160,
  //           margin: EdgeInsets.all(10),
  //           child: DropdownButtonHideUnderline(
  //             child: GFDropdown(
  //               hint: Text(
  //                 "Max Bath",
  //                 style: TextStyle(color:Colors.grey,),
  //               ),
  //               borderRadius: BorderRadius.circular(5),
  //               border: const BorderSide(
  //                   color: Colors.black12, width: 1),
  //               dropdownButtonColor: Colors.white,
  //               iconEnabledColor: ColorClass.blueColor,
  //               value: selectedRooms,
  //               onChanged: (newValue) {
  //                 setState(() {
  //                   selectedRooms = newValue;
  //                 });
  //               },
  //               items: bathRoomsList
  //                   .map((value) => DropdownMenuItem(
  //                 value: value,
  //                 child: Text(value, style:  TextStyle(
  //                   color: Colors.black,
  //
  //                 ),),
  //               ))
  //                   .toList(),
  //             ),
  //           ),
  //         ),
  //
  //
  //       ],),
  //   );
  // }

  Widget areaWidget(){
    return Row(children: [
      Container(
        height: 50,
        width: 160,
        margin: EdgeInsets.all(10),
        child: DropdownButtonHideUnderline(
          child: GFDropdown(
            hint: Text(
              "Min Area",
              style: TextStyle(color:Colors.grey, ),
            ),
            borderRadius: BorderRadius.circular(5),
            border: const BorderSide(
                color: Colors.black12, width: 1),
            dropdownButtonColor: Colors.white,
            iconEnabledColor: ColorClass.blueColor,
            value: minArea,
            onChanged: (newValue) {
              setState(() {
                minArea = newValue;
              });
            },
            items: arealist
                .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value, style:  TextStyle(
                color: Colors.black,

              ),),
            ))
                .toList(),
          ),
        ),
      ),
      Container(
        height: 50,
        width: 160,
        margin: EdgeInsets.all(10),
        child: DropdownButtonHideUnderline(
          child: GFDropdown(
            hint: Text(
              "Max Area",
              style: TextStyle(color:Colors.grey, ),
            ),
            borderRadius: BorderRadius.circular(5),
            border: const BorderSide(
                color: Colors.black12, width: 1),
            dropdownButtonColor: Colors.white,
            iconEnabledColor: ColorClass.blueColor,
            value: maxArea,
            onChanged: (newValue) {
              setState(() {
                maxArea = newValue;
              });
            },
            items: arealist
                .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value, style:  TextStyle(
                color: Colors.black,

              ),),
            ))
                .toList(),
          ),
        ),
      ),
    ],);
  }

  Widget furnishedType(){
    return FittedBox(
      child: Row(children: [
        Container(
          height: 50,
          width: 160,
          margin: EdgeInsets.all(10),
          child: DropdownButtonHideUnderline(
            child: GFDropdown(
              hint: Text(
                "All Furnishing",
                style: TextStyle(color:Colors.grey,),
              ),
              borderRadius: BorderRadius.circular(5),
              border: const BorderSide(
                  color: Colors.black12, width: 1),
              dropdownButtonColor: Colors.white,
              iconEnabledColor: ColorClass.blueColor,
              value: furnishingType,
              onChanged: (newValue) {
                setState(() {
                  furnishingType = newValue;
                });
              },
              items: furnishingTypeList
                  .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value,style:  TextStyle(
                  color: Colors.black,

                ),),
              ))
                  .toList(),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 160,
          margin: EdgeInsets.all(10),
          child: CupertinoTextField(
            padding: EdgeInsets.all(10),
            autofocus: false,
            style:  TextStyle(
              color: Colors.black,

            ),
            placeholder: "Keyword",
            placeholderStyle: TextStyle(color:Colors.grey, ),
          ),
        ),
      ],),
    );
  }

  Widget buttonClass(){
    return  Expanded(
      child: Align(
        alignment: maxwidth>=700?
        Alignment.centerRight:Alignment.bottomCenter,
        child: Container(
          margin: maxwidth>=700?EdgeInsets.only(right: 40):EdgeInsets.all(10),
          height: 40,width: 200,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onPressed: () {},
            color: ColorClass.blueColor,
            hoverColor: Colors.blue.shade900,
            textColor: Colors.white,
            child: Text(
              "Find",
              textAlign: TextAlign.center,
              style:  TextStyle(
                  color:  const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                  fontStyle:  FontStyle.normal,
                  fontSize: 16.0
              ),
            ),
            padding: EdgeInsets.all(10),
          ),
        ),),
    );
  }

}