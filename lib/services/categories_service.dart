import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';

class CategoriesService{

  Future <List<ProductModel>> getAllProduct({required String cat}) async{

    List<dynamic> data =await Api().get(url:'https://fakestoreapi.com/products/category/${cat}');

      List<ProductModel> productList = [];
      for (int i = 0; i < productList.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
      }

      return productList;
  }

}