import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Type {  Indoor,Flowering,Fruit,Succulants,Medicinal }
class Item {
  String id;
  String name;
  Type type;
  int price;
  bool inStock;
  String imageUrl;
  Item({this.id,this.name,this.type,this.price,this.inStock,this.imageUrl});

  String get formattedAvailability => inStock ? "Available" : "Out of stock";
//  String get formattedPrice => Item.formatter.format(this.price);
  Color get availabilityColor => inStock ? Colors.grey : Colors.red;
//  static final formatter =NumberFormat.currency(locale: 'id_ID', symbol: "Rp ");
  static List<Item> get dummyItems => [
    Item(
        id: "1",
        name: "Snake Plant",
        type: Type.Indoor,
        price: 400,
        inStock: true,
        imageUrl:
'https://www.thespruce.com/thmb/oIxigOItIWy9xV9mlQDZOIOAvRo=/2048x1545/filters:no_upscale():max_bytes(150000):strip_icc()/snake-plant-care-overview-1902772-04-76c211bb8d1b461e8af30a68b6169535.jpg'),    Item(
        id: "3",
        name: "Money Plant",
        type: Type.Indoor,
        price: 700,
        inStock: true,
        imageUrl:
        'https://www.insity.com/images/thumbs/001/0017063_golden-money-plant-in-ceramic-white-pot_510.jpeg') ,
    Item(
        id: "3",
        name: "Gardenia",
        type: Type.Flowering,
        price: 1000,
        inStock: true,
        imageUrl:
        'https://cdn.britannica.com/04/197204-050-B60F40C7/Cape-jasmine-flower.jpg'),    Item(
        id: "4",
        name: "Kalanchoe",
        type: Type.Flowering,
        price: 800,
        inStock: true,
        imageUrl:
        'https://5.imimg.com/data5/JL/FW/MY-42914277/1-500x500.jpg'),    Item(
        id: "5",
        name: "Tomato",
        type: Type.Fruit,
        price: 1300,
        inStock: true,
        imageUrl:
        'https://hgtvhome.sndimg.com/content/dam/images/hgtv/stock/2018/3/23/01/shutterstock_bajinda_61779895_tomatoes-on-plant.jpg.rend.hgtvcom.1280.853.suffix/1521816052592.jpeg'),    Item(
        id: "6",
        name: "Sapodilla Tree",
        type: Type.Fruit,
        price: 990,
        inStock: false,
        imageUrl:
  'https://practicalprimate.com/wp-content/uploads/2020/01/sapodilla-fruit.jpg')  ];
}