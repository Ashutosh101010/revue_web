import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:webrevue/constants/ColorClass.dart';
import 'package:webrevue/constants/keys.dart';
import 'package:webrevue/model/CompoundModal.dart';
import 'package:webrevue/model/SearchModal.dart';
import 'package:webrevue/model/arguments/CompoundArgument.dart';
import 'package:webrevue/route/routing_constant.dart';
import 'package:webrevue/service/Webservice.dart';

class SearchWidget extends StatefulWidget {
  double maxWidth;

  SearchWidget(this.maxWidth);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchWidgetState();
  }
}

List compoundSearchList = [];

String filterCategoryType = "";
class SearchWidgetState extends State<SearchWidget> {
  String selectedCategory;
  String selectedLocation;
  List category = ['Any','Apartment','Compound'];
  List location = ['Doha','Abu Dhabi','Qatar'];
  double width;

  SearchModal searchModal;

  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    width = widget.maxWidth;
    searchModal = new SearchModal();
  }

  OverlayEntry overlayEntry;

  void hideIndicator(BuildContext context) {
    overlayEntry.remove();
  }



  getCompounds(){
    setState(() {
      filterCategoryType = selectedCategory;
    });
    GlobalKeys.compoundListKey.currentState.compoundList.clear();
    GlobalKeys.compoundListKey.currentState.lastObjectId="";
    GlobalKeys.compoundListKey.currentState.getCompoundList();

  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            height: 40,
            width: width - 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: ColorClass.blueColor, width: 1)),
            child: TextField(
              controller: searchController,
              style: const TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
              decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.search,
                      color: ColorClass.blueColor,
                      size: 20,
                    ),
                  ),
                  suffix: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(
                            CupertinoIcons.clear_circled,
                            color: ColorClass.lightTextColor,
                          ),
                          padding: EdgeInsets.all(8),
                          onPressed: () {
                            searchController.clear();
                            compoundSearchList.clear();
                            setState(() {
                              hideIndicator(context);
                            });
                          },
                        )
                      : null,
                  contentPadding: EdgeInsets.only(bottom: 10, top: 5, left: 5),
                  hintText: "Search Compound",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  fillColor: Colors.white),
              onChanged: (string) {

                if (string.length > 3) {
                  print(string);
                  // searchableitem.clear();
                  searchModal.string = string;

                  Webservice.searchCompoundRequest(searchModal)
                      .then((value) => this.setState(() {
                        showSearchOverLay(context);
                          }));
                } else {
                  searchController.clear();
                  compoundSearchList.clear();
                  setState(() {
                    hideIndicator(context);
                  });
                }
              },
              cursorColor: Colors.black,
            ),
          ),
          Container(
            height: 40,
            width: width / 2,
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: ColorClass.blueColor, width: 1)),
            child: DropdownButtonHideUnderline(
              child: GFDropdown(
                borderRadius: BorderRadius.circular(10),
                hint: Text(
                  "Select Category",
                  style: TextStyle(color: Colors.grey),
                ),
                dropdownButtonColor: Colors.white,
                iconEnabledColor: ColorClass.blueColor,
                value: selectedCategory,
                onChanged: (newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });

                  getCompounds();
                },
                items: category
                    .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
              ),
            ),
          ),
          Container(
            height: 40,
            width: width / 2,
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: ColorClass.blueColor, width: 1)),
            child: DropdownButtonHideUnderline(
              child: GFDropdown(
                borderRadius: BorderRadius.circular(10),
                hint: Text(
                  "Select location",
                  style: TextStyle(color: Colors.grey),
                ),
                dropdownButtonColor: Colors.white,
                iconEnabledColor: ColorClass.blueColor,
                value: selectedLocation,
                onChanged: (newValue) {
                  setState(() {
                    selectedLocation = newValue;
                  });
                },
                items: location
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void showSearchOverLay(BuildContext context) {
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 150.0,
          left: 120,
          right: 500,
          bottom: 100,
          child: Material(
            elevation: 5,
            color: Colors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: SizedBox(
              child:
              ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  CompoundModal compoundModal =
                  (compoundSearchList[index] as CompoundModal);
                  return InkWell(
                    mouseCursor: SystemMouseCursors.click,
                    onTap: () {
                      searchController.clear();
                      hideIndicator(context);
                      Navigator.pushNamed(context, compoundDetails,
                          arguments: CompoundArgument(
                              compoundId: compoundModal.id,
                              compoundName: compoundModal.compoundname,
                              images: compoundModal.images,
                              address: compoundModal.address));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (compoundSearchList[index] as CompoundModal)
                                .compoundname,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: ColorClass.lightTextColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            (compoundSearchList[index] as CompoundModal)
                                .address,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorClass.lightTextColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: compoundSearchList.length,
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
  }
}
