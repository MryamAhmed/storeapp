import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';


class AddProductService{
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String description ,
    required String category ,
    required String image
  })
  async{
    Map<String,dynamic> data =await
    Api().post(
        url: 'https://fakestoreapi.com/products',
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