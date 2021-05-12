import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../ColorClass.dart';

class FooterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FooterWidgetState();
  }
}

class FooterWidgetState extends State<FooterWidget> {
  bool hovervalue = false;
  bool instaHover = false;
  bool twitterHover = false;
  bool fbHover = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool maxwidth = constraints.maxWidth >= 700;
      return Container(
        color: Colors.white,
        // decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
        child: Padding(
          padding: maxwidth
              ? EdgeInsets.only(top: 30, left: 10, right: 10)
              : EdgeInsets.all(10),
          child: SizedBox(
            width: constraints.maxWidth,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: maxwidth
                        ? horizontalView(context)
                        : verticalView(context)),
                SizedBox(height: 20,),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("CONNECT WITH US ON",
                                style: TextStyle(
                                    color: ColorClass.lightTextColor,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0),
                                textAlign: TextAlign.left),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    twitterHover = value;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.twitter,
                                  color:
                                      twitterHover ? Colors.black : Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    instaHover = value;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.instagram,
                                  color: instaHover ? Colors.black : Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    fbHover = value;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.facebook,
                                  color: fbHover ? Colors.black : Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

    });
  }

  Widget horizontalView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: revue()
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  aboutWidget(),
                  propertyOwner(),
                  community(),
                  workWithUs()
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget verticalView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          revue(),
          SizedBox(height: 20,),
          aboutWidget(),
          SizedBox(height: 20,),
          propertyOwner(),
          SizedBox(height: 20,),
          community(),
          SizedBox(height: 20,),
          workWithUs()
        ],
      ),
    );
  }

  Widget aboutWidget() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About
          Text("About",
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 8,
          ),

          Material(
            color: Colors.transparent,
            child: InkWell(
              onHover: (value) {
                setState(() {
                  hovervalue = value;
                });
              },
              onTap: () {},
              child: Text("About / Press Blog",
                  style: TextStyle(
                      color: hovervalue
                          ? ColorClass.redColor
                          : ColorClass.lightTextColor,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0),
                  textAlign: TextAlign.left),
            ),
          ),
        ],
      ),
    );
  }
  Widget community(){
    return   SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About
          Text("Community",
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 8,
          ),

          Text("Help / Contact Us",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),

          Text("Guidelines",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),

          Text("Terms of Use",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),

          Text("Privacy & Cookies (New)",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),

          Text("Privacy Center",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),

          Text("Do Not Sell My Personal Information",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),

          Text("Cookie Consent Tool",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
        ],
      ),
    );
  }
  Widget workWithUs(){
    return  SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About
          Text("Work with us",
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,

                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 8,
          ),

          Text("Advertisers",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),

          Text("Developers",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),
          Text("Careers",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
        ],
      ),
    );
  }
  Widget propertyOwner(){
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About
          Text("Property Owners",
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,

                  fontStyle: FontStyle.normal,
                  fontSize: 20.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 8,
          ),

          Text("Get a free owners Account",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),

          Text("Property Centre",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
          SizedBox(
            height: 5,
          ),

          Text("Post a property",
              style: TextStyle(
                  color: ColorClass.lightTextColor,
                  fontWeight: FontWeight.w500,

                  fontStyle: FontStyle.normal,
                  fontSize: 15.0),
              textAlign: TextAlign.left),
        ],
      ),
    );
  }
  Widget revue(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Image.asset(
        "assets/images/revue.png",
        fit: BoxFit.contain,
        width: 200,
      ),
      // Download the app
      Text("Download the app",
          style: const TextStyle(
              color: const Color(0xff3c2f47),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 17.0),
          textAlign: TextAlign.left),

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/android.png",
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/apple.png",
              width: 35,
              height: 35,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),

    ],);
  }
}
