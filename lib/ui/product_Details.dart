import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class proDet extends StatefulWidget {
  final proname;
  final proimg;
  final proprice;

  const proDet({Key key, this.proname, this.proimg, this.proprice}) : super(key: key);
  @override
  _proDetState createState() => _proDetState(proname,proimg,proprice);
}

class _proDetState extends State<proDet> {
  final proname;
  final proimg;
  final proprice;

  _proDetState(this.proname, this.proimg, this.proprice);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              iconTheme: new IconThemeData(color: Colors.green),
              title: Container(
                child: Row(children: <Widget>[
                  InkWell(
                    onTap: ()=> Navigator.of(context).pop(),
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
                  icon:Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon:Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                  ),
                  onPressed: () {

                  },
                ),

//                Padding(
//                  padding: const EdgeInsets.all(5.0),
//                  child: CircleAvatar(
//                    backgroundImage: NetworkImage(user.photoUrl),
//                    minRadius: 5,
//                    maxRadius: 25,
//                  ),
//                ),
                SizedBox(
                  width: 5,
                )


              ],

              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: ListView(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                  Stack(alignment: Alignment.center,
                    children: <Widget>[
                      Container(height: 500,width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(proimg),
                                fit: BoxFit.cover)
                        ),
                      ),

                    ],
                  ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                      ),
                      height: 90,
                    )
                ],),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                              Text("$proname",style: TextStyle(fontSize: 35,fontFamily: 'Lobster'),),
                              RawMaterialButton(child: CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Icon(Icons.favorite_border,color: Colors.white,),))
                            ],),

                            Divider(),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                              Text("    Rs.$proprice",style: TextStyle(color:Colors.green,fontFamily: 'Bree Serif',fontSize: 25),),
                              Container(
                                height: 40,width: 90,

                                decoration: new BoxDecoration(color: Colors.green,
                                    borderRadius: new BorderRadius.only(
                                        topLeft:  const  Radius.circular(40.0),
                                        topRight: const  Radius.circular(40.0),
                                        bottomLeft:  const  Radius.circular(40.0),
                                        bottomRight: const  Radius.circular(40.0)

                                    )
                                ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Icon(Icons.remove_circle_outline,color: Colors.white,),
                                  Text("1",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.bold),),
                                  Icon(Icons.add_circle_outline,color: Colors.white,)
                                ],
                              ),)
                            ],)


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              child: Container(
                                  height: 50,
                                  child: Center(child: Text("Buy Now",style: TextStyle(fontSize: 25,
                                      color: Colors.white,
                                  fontFamily: 'Galada'),))),
                              color: Colors.green,
                              onPressed: (){},
                              elevation: 10,

                            ),
                          ),
                          RaisedButton(color: Colors.white,
                            child: Container(
                                height: 50,
                                child: Icon(Icons.add_shopping_cart)),
                          onPressed: (){},
                          elevation: 10,)
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
