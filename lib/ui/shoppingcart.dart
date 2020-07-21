import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cartproducts.dart';



class shopCart extends StatefulWidget {
  @override
  _shopCartState createState() => _shopCartState();
}

class _shopCartState extends State<shopCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(

            bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8,left: 8,bottom: 8),
                    child: Container(
                      child: Text("Total:",style: TextStyle(fontSize: 20,

                          fontFamily: 'Bree Serif'),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: Text("Rs. 200",style: TextStyle(color:Colors.grey,fontSize:20,fontFamily: 'Bree Serif'),),),
                  ),

                  Expanded(
                    child: RaisedButton(
                      child: Container(
                          height: 50,
                          child: Center(child: Text("Check-Out",style: TextStyle(fontSize: 25,
                              color: Colors.white,
                              fontFamily: 'Galada'),))),
                      color: Colors.green,
                      onPressed: (){},
                      elevation: 10,

                    ),
                  )

                ],
              ),
            ),
          ),
            appBar: AppBar(
              iconTheme: new IconThemeData(color: Colors.green),
              title: Container(
                child: Row(children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      "Planto",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 44,
                          fontFamily: 'Pacifico'),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/images/ddd.png'),
                  ),
                ]),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 5,
                )
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: cartProduc(),
          )
        ],
      ),
    );
  }
}
