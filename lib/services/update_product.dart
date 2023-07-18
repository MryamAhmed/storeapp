import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';

class UpdateProduct{
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String description ,
    required String category ,
    required String image,
    required int id,
  })
  async{
    Map<String,dynamic> data =await
    Api().put(
        url: 'https://fakestoreapi.com/products/$id',
        body:{
          'title':title,
          'price':price,
          'discription':description,
          'image':image,
          'category':category
        });
    return ProductModel.fromJson(data);
  }

}