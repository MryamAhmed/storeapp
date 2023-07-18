import 'package:flutter/cupertino.dart';

class ProductModel{
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RattingModel? ratting;

  ProductModel({
    required this.id,
    required this.price,
    required this.image,
    required this.title,
    required this.description,
    @required this.ratting,
    required this.category
  });
  factory  ProductModel.fromJson(jsonData){
    return ProductModel(
        id:jsonData['id'],
        title: jsonData['title'],
        category: jsonData['category'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        ratting: jsonData['rating'] == null
            ? null
            : RattingModel.fromJson(jsonData['rating']));
  }
}
class RattingModel{
  final int count;
  final double rate;
  RattingModel({
    required this.rate,
    required this.count,
  });
  factory  RattingModel.fromJson(jsonData){
    return RattingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}