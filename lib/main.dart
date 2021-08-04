import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrevue/LoginDashboard/LoginScreen.dart';
import 'package:webrevue/route/router.dart' as router;
import 'constants/ColorClass.dart';
import 'constants/keys.dart';
import 'home/CompoundList.dart';
import 'route/routing_constant.dart';

void main(){


  var url = window.location.href;
  print(url);

  if(window.localStorage.containsKey("userID")){
    runApp(MyDashboardApp());
  }else{
    runApp(MyApp());
  }

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revue',
        initialRoute:initialroute,
        navigatorKey: navKey,
        onGenerateRoute:router.generateRoute,
      theme: ThemeData(pageTransitionsTheme: NoTransitionsOnWeb(),fontFamily: GoogleFonts.muli().fontFamily,
        bottomSheetTheme: Theme.of(context).bottomSheetTheme,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:LoginScreen()
    );
  }
}


class MyDashboardApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Revue',
        initialRoute:initialroute,
        navigatorKey: navKey,
        onGenerateRoute:router.generateRoute,
        theme: ThemeData(pageTransitionsTheme: NoTransitionsOnWeb(),fontFamily: GoogleFonts.muli().fontFamily,
          bottomSheetTheme: Theme.of(context).bottomSheetTheme,
          primarySwatch: Colors.blue,
        ),
        home:CompoundList(key: GlobalKeys.compoundListKey ,),
    );
  }
}


class NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
      ) {
    if (kIsWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}