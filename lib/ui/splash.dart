import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'home.dart';

class Splash extends StatefulWidget {
//  final currentuser;
//
//  const Splash({Key key, this.currentuser}) : super(key: key);
  @override
  _SplashState createState() => _SplashState(
//      currentuser
  );
}

class _SplashState extends State<Splash> {
//  final currentuser;
//
//  _SplashState(this.currentuser);

  @override
  void initState(){
    super.initState();
    _mock().then((status){
      if(status)
        {
          _navigation();
        }
    });
  }


 Future<bool> _mock() async{
   await Future.delayed(Duration(milliseconds: 2000), () {});
   return true;
 } 
 void _navigation(){
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>HomeScreen(
//     user: currentuser,
   )));
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack
          (
          alignment: Alignment.center,
            children: <Widget>[
              Opacity(
                opacity: 0.5,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/dd.jpg'),
                  )),
              Shimmer.fromColors(
                baseColor: Color(0xff66bb6a),
                highlightColor: Color(0xffc8e6c9),
                child: Container(
                  child: Text("Planto",
                  style: TextStyle(
                    fontSize: 95,
                    fontFamily: 'Pacifico'
                  ),),
                ),
              )

              
            ],
        ),
      ),

    );
  }
}
