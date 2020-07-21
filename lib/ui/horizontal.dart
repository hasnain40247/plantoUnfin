import 'package:flutter/material.dart';

class horizonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(image: 'assets/images/indoor.png',imageName: 'Indoor',),

          Category(image: 'assets/images/flower.png',imageName: 'Flower',),
          Category(image: 'assets/images/medicinal.png',imageName: 'Medicinal',),
          Category(image: 'assets/images/fruit.png',imageName: 'Fruit',),
          Category(image: 'assets/images/succulent.png',imageName: 'Succulent',),
          Category(image: 'assets/images/creepers.png',imageName: 'Creeper',)

        ],
      ),
    );


  }
}


class Category extends StatelessWidget {
  final String image;
  final String imageName;

  const Category({Key key, this.image, this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){},
        child: Container(width: 100,
          child: ListTile(
            title: Image.asset(image,
            width: 100,
            height: 70,),
            subtitle: imageName=='Fruit'?Text( "       $imageName"):Text( "    $imageName"),
          ),
        ),
      ),
    );
  }
}
