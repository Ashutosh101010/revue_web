import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:webrevue/AppBar/SearchWidget.dart';
import 'package:webrevue/constants/keys.dart';
import 'package:webrevue/model/AmenitiesModal.dart';

import '../constants/ColorClass.dart';


class FilterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FilterScreenState();
  }
}

List<AmenitiesModal> filterAmenitiesList = [];
class FilterScreenState extends State<FilterScreen> {

  String radiusSelected;
  String selectedLocation;
  String selectedRent;
  String propertyType;

  String minArea;
  String maxArea;
  String furnishingType;

  double maxwidth;

  static List<AmenitiesModal> amenities = [
    AmenitiesModal(id: 1, name: "Any"),
    AmenitiesModal(id: 2, name: "Balcony"),
    AmenitiesModal(id: 3, name: "Shared Spa"),
    AmenitiesModal(id: 4, name: "Covered Parking"),
    AmenitiesModal(id: 5, name: "Security"),
    AmenitiesModal(id: 6, name: "Electricity"),
    AmenitiesModal(id: 7, name: "Build in Kitchen Appliances"),
    AmenitiesModal(id: 8, name: "Furnished"),
    AmenitiesModal(id: 9, name: "Pets Allowed")
  ];

  final _items = amenities
      .map((building) =>
          MultiSelectItem<AmenitiesModal>(building, building.name))
      .toList();

  static const List searchRadius = [
    'None',
    'This area only',
    'Near 5 KM',
    'Near 10 KM',
    'Upto 20 KM',
    'Upto 25 KM',
    'More Than 25 KM'
  ];

  List<AmenitiesModal> isSelected = [];
  List<String> propertyTypeList = <String>['Any', 'Apartment', 'Compound'];
  bool selected = false;
  int selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    if(filterCategoryType=="Apartment"){
      propertyType ="Apartment";
    }else if(filterCategoryType =="Compound"){
      propertyType ="Compound";
    }else{
      propertyType ="Any";
    }

  }

  @override
  Widget build(BuildContext context) {
    maxwidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        // width:  maxwidth>=700?500:maxwidth,
        // decoration: BoxDecoration(borderRadius:BorderRadius.circular(10), ),
        // alignment: Alignment.center,
        // margin:  maxwidth>=700? EdgeInsets.only(left: 40,right: 40):null,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              maxwidth < 700
                  ? Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      color: Colors.white,
                      width: maxwidth,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Filter",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              mouseCursor: SystemMouseCursors.click,
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.clear,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Search property"),
                  ),
                  search(),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Property Type"),
                  ),
                  propertyTypeWidget(),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Select area"),
                  ),
                  areaWidget(),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Amenities"),
                  ),
                  furnishedType()
                ],
              ),



              SizedBox(
                height: 30,
              ),

              Center(
                child: MaterialButton(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Search Property",
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0),
                  ),
                  elevation: 5,
                  color: ColorClass.blueColor,
                  hoverColor: Colors.blue.shade900,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    List tempList =[];
                    filterAmenitiesList=isSelected;
                    isSelected.forEach((element) {
                      tempList.add((element as AmenitiesModal).name);
                    });

                    filterCategoryType =propertyType;
                    GlobalKeys.compoundListKey.currentState.compoundList.clear();
                    GlobalKeys.compoundListKey.currentState.lastObjectId="";
                    GlobalKeys.compoundListKey.currentState.amenityList= tempList;

                    GlobalKeys.compoundListKey.currentState.getCompoundList();
                    Navigator.pop(context);

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget propertyTypeWidget() {
    return Container(
      height: 50,
      width: 400,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0x33000000), width: 1)),
      child: DropdownButtonHideUnderline(
        child: GFDropdown(
          hint: Text(
            "Select Category",
            style: TextStyle(
              color: Colors.grey,
            ),
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
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget search() {
    return Container(
      width: 500,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0x33000000), width: 1)),
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
            width: maxwidth >= 700 ? 400 : maxwidth - 300,
            child: TextField(
              style: const TextStyle(
                  color: const Color(0x99000000),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
              decoration: InputDecoration(
                  hintText: "Search Compound",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.white),
              cursorColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }



  Widget areaWidget() {
    return Container(
      height: 50,
      width: 400,
      margin: EdgeInsets.all(10),
      child: DropdownButtonHideUnderline(
        child: GFDropdown(
          hint: Text(
            "Search Property by Radius",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          borderRadius: BorderRadius.circular(5),
          border: const BorderSide(color: Colors.black12, width: 1),
          dropdownButtonColor: Colors.white,
          iconEnabledColor: ColorClass.blueColor,
          value: minArea,
          onChanged: (newValue) {
            setState(() {
              minArea = newValue;
            });
          },
          items: searchRadius
              .map((value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget furnishedType() {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 10,bottom: 15),
      width:maxwidth>=700?500:maxwidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
      ),
      child: MultiSelectChipField<AmenitiesModal>(
        scrollBar: HorizontalScrollBar(isAlwaysShown: true),
        headerColor: Colors.white,
        height: 80,
        scroll: true,
        textStyle: TextStyle(color: ColorClass.lightTextColor, fontSize: 14),
        showHeader: false,
        selectedChipColor: ColorClass.blueColor,
        selectedTextStyle: TextStyle(color: Colors.white),
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.black12)),
        items: _items,
        initialValue: filterAmenitiesList,
        icon: Icon(Icons.check, color: Colors.white),
        chipShape: RoundedRectangleBorder(
            side: BorderSide(color: ColorClass.blueColor)),
        onTap: (values) {
          // filterAmenitiesList =values;
          isSelected = values;
        },
      ),
    );
  }

}
