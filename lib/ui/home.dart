import 'package:finplanto/models/plants.dart';
import 'package:finplanto/ui/login.dart';
import 'package:finplanto/ui/product_Details.dart';
import 'package:finplanto/ui/shoppingcart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'package:carousel_pro/carousel_pro.dart';


import 'horizontal.dart';

class HomeScreen extends StatefulWidget {
//  final user;
//
//  const HomeScreen({Key key, this.user}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState(
//      user
  );
}

class _HomeScreenState extends State<HomeScreen> {
//  final user;
  final List<Item> plant = Item.dummyItems;
//  final AuthService _auth=AuthService();

//  _HomeScreenState(this.user);

  @override
  Widget build(BuildContext context) {

    Widget image_carousel=Container(height: MediaQuery.of(context).size.height*0.30,
      width: MediaQuery.of(context).size.width,
      child:Carousel(
        boxFit: BoxFit.cover,
        images:[
          NetworkImage('https://www.thespruce.com/thmb/oIxigOItIWy9xV9mlQDZOIOAvRo=/2048x1545/filters:no_upscale():max_bytes(150000):strip_icc()/snake-plant-care-overview-1902772-04-76c211bb8d1b461e8af30a68b6169535.jpg'),
          NetworkImage('https://www.insity.com/images/thumbs/001/0017063_golden-money-plant-in-ceramic-white-pot_510.jpeg'),
          NetworkImage('https://www.insity.com/images/thumbs/001/0017063_golden-money-plant-in-ceramic-white-pot_510.jpeg'),
          NetworkImage('https://cdn.britannica.com/04/197204-050-B60F40C7/Cape-jasmine-flower.jpg')
        ],
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 2000),
        dotBgColor: Colors.transparent,
        dotSize: 3,
      ) ,
    );




    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,

            appBar: AppBar(
              iconTheme: new IconThemeData(color: Colors.green),
              title: Container(
                child: Row(children: <Widget>[
                  Text(
                    "Planto",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 44,
                        fontFamily: 'Pacifico'),
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return shopCart();
                    }));
                  },
                ),

                SizedBox(
                  width: 5,
                )


              ],

              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),

            drawer: Drawer(
              child: ListView(physics: const NeverScrollableScrollPhysics() ,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: (AssetImage('assets/images/dddd.jpg',
                      )))
                    ),
                      currentAccountPicture: Container(
                        height: 10,width: 10,
                        decoration: BoxDecoration(shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/dd.jpg'),
                                fit: BoxFit.fill)
                        ),),
                      accountName: Text("current user",style: TextStyle(color: Colors.black),), accountEmail: Text("user email",style: TextStyle(color: Colors.black)))
               ,
                  Container(child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('Home'),
                        leading: Icon(Icons.home),

                      ),
                      ListTile(
                        title: Text('Account'),
                        leading: Icon(Icons.person),

                      ),
                      ListTile(
                        title: Text('Orders'),
                        leading: Icon(Icons.shopping_basket),

                      ),

                      ListTile(
                        title: Text('Favourites'),
                        leading: Icon(Icons.favorite),

                      ),
                    ],
                  ),)

               ,
                  Expanded(child: SizedBox(height: MediaQuery.of(context).size.height*0.35,)),
                  Divider(),

//                  ListTile(
//                    onTap: () async{
//                      await _auth.signOut();
//                    },
//                    title: Text('Sign Out'),
//                    leading: Icon(Icons.exit_to_app),
//
//                  ),
                  ListTile(
                    onTap: () async {
                      FirebaseAuth.instance.signOut().then((value){
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context){
                          return signIn();
                        }));
                      });
                    },
                    title: Text('Sign Out'),
                    leading: Icon(Icons.exit_to_app),

                  ),
                  ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings),

                  ),
                  ListTile(
                    title: Text('About Us'),
                    leading: Icon(Icons.help),

                  ),









                ],
              ),
            ),
            body: ListView(
              children: <Widget>[
                image_carousel,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Categories',style: TextStyle(fontFamily: 'Lobster',fontSize: 28),),
                ),
                horizonList(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: ListView.builder(shrinkWrap: true,physics: ScrollPhysics(),
                          itemCount: plant.length,
                          itemBuilder: (BuildContext context, int index) {
                            return plantCard(
                              plant: plant[index],
                            );
                          })),
                ),

              ],
            )


          ),
        ],
      ),
    );
  }

  Widget planInfo(Item plant, BuildContext context) {
    return Card(
      child: Text(plant.name),
    );
  }
}

class plantCard extends StatelessWidget {
  final Item plant;

  const plantCard({Key key, this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 12.0, right: 12.0, top: 5.0, bottom: 8.0),
        child: Card(
          elevation: 3.0,
          child: Stack(children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16.0 / 9.0,
                  child: Image.network(
                    plant.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "${plant.name}",
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text("Rs. ${plant.price}")
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return proDet(proname:plant.name ,proimg: plant.imageUrl,proprice: plant.price,);
        }));
      },
    );
  }
}
