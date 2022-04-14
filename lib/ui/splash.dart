import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/ui/postpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ));
    });
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image.asset("assets/images/logo.png"),
                SizedBox(width: 30,),
              if(Platform.isIOS)
                CupertinoActivityIndicator(
                  radius: 30,
                )
              else
                CircularProgressIndicator(

                )

            ],
          )
      ),
    );
  }
}
