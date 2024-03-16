import 'package:finac_mobile_app/Constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/logo/FinacLogoSmall.svg',
                        color: Colors.white,
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Finac', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                          Text('by AKSSAI  ProjExel', style: TextStyle(color: Colors.white, fontSize: 8, fontStyle: FontStyle.italic),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: CircularProgressIndicator(color: Colors.white,),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text('Lite Version', style: TextStyle(color: Colors.white, fontSize: 12, fontStyle: FontStyle.italic),),
          ),
        ],
      )
    );
  }
}