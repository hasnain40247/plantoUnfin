import 'package:flutter/material.dart';

class cartProduc extends StatefulWidget {
  @override
  _cartProducState createState() => _cartProducState();
}

class _cartProducState extends State<cartProduc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context,int index){
          return Text("Hello");
        },
      )
    );
  }


}

class singProd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

