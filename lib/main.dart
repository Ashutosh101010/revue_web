import 'dart:html' as html;
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webrevue/LoginDashboard/LoginScreen.dart';
import 'package:webrevue/route/router.dart' as router;
import 'package:webrevue/service/Webservice.dart';
import 'constants/keys.dart';
import 'constants/string_constant.dart';
import 'home/CompoundList.dart';
import 'route/routing_constant.dart';

import 'package:flutter/foundation.dart';


void main() {
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    FacebookAuth.i.webInitialize(
      appId: facebook_app_id,//<-- YOUR APP_ID
      cookie: true,
      xfbml: true,
      version: "v9.0",
    );
  }


  runApp(MyApp());

listner();




    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // sharedPreferences.containsKey("userId");



  // runApp(sharedPreferences.containsKey("userId")?MyDashboardApp():MyApp());
}
bool loggedIn=false;
// BuildContext buildContext;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
MyApp()
{
  Webservice.verifySession();
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Revue',
        initialRoute:initialroute,
        navigatorKey: GlobalKeys.navKey,
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
      home:   LoginScreen()
    );
  }



}
listner()
{
  FBroadcast.instance().register("lfalse", (value, callback) {

    loggedIn=false;
    print("loggedIn-------"+loggedIn.toString());

  });
  FBroadcast.instance().register("ltrue", (value, callback) {
    BuildContext buildContext;
    if(value!=null)
buildContext =value as BuildContext;
    loggedIn=true;
    print("!!!!!loggedIn-------"+loggedIn.toString());

    if(buildContext!=null)
      {

        if(loggedIn &&(ModalRoute.of(buildContext).settings.name==initialroute ||
            ModalRoute.of(buildContext).settings.name==loginRoute))
          {

Navigator.of(buildContext).pushNamedAndRemoveUntil(mainscreenRoute, (route) => false);
          }
      }
    else{
      print("context null");
    }
  });
}

class MyDashboardApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: 'Revue',
        initialRoute:initialroute,
        navigatorKey: GlobalKeys.navKey,
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