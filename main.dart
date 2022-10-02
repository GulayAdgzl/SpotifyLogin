import 'package:flutter/material.dart';
import 'package:flutter_application_1/spotifyLoginPage/spotifyLogin2.dart';
import 'package:flutter_application_1/spotifyLoginPage/spotify_login.dart';

//import '101/pageView_learn.dart';
//import '101/stateful_lifecycle.dart';

import '101/trendyolLogin.dart';
import '202/package/loading_bar.dart';
import '202/package_learn_view.dart';
import '202/sevice/service_post_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          //TabBar Theme Belirleme
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.white,
            //unselectedLabelColor: Color.fromARGB(255, 63, 206, 68),
            indicatorSize: TabBarIndicatorSize.label,
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            shape: CircularNotchedRectangle(),
          ),

          //primarySwatch: Colors.orange[900],
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Colors.white),
          listTileTheme:
              const ListTileThemeData(contentPadding: EdgeInsets.zero),
          cardTheme: CardTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          //errorColor: ColorsItems.sulu,
          /*
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            iconColor: Colors.red,
            labelStyle: TextStyle(color: Colors.lime),
            border: OutlineInputBorder(),
            floatingLabelStyle: TextStyle(
                color: Colors.red, fontSize: 25, fontWeight: FontWeight.w500),
          ),*/
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      home: const Spotify(),
    );
  }
}
