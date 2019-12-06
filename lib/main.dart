import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_trailer/ui/home_screen.dart';


void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Movies App',
    home: SplashScreen(),
  )
);

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class MyCostomRoute<T> extends MaterialPageRoute{
  MyCostomRoute({WidgetBuilder builder , RouteSettings settings}):
      super(builder:builder,settings:settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if(settings.isInitialRoute) return child;
    //Fades between routes. (if u dont want to animate just return child)
    return FadeTransition(opacity: animation,child: child);
  }
}

class _SplashScreenState extends State<SplashScreen>{
  void navigationPage(){
    Navigator.push(
      context,
      MyCostomRoute(builder: (context) => Home())
    );
  }

  startTime() async{
    var _duration = Duration(seconds: 2);
    return Timer(_duration,navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light
    ));
    return Scaffold(
      body: Center(
        
      ),
    );
  }
}