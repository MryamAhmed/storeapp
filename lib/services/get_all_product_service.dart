import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';

class AllProductService{
   Future<dynamic> getAllProduct() async{
    //List<dynamic> data=await Api().get(url:'https://fakestoreapi.com/products');

//print(data);
    List<dynamic> productList=await Api().get(url:'https://fakestoreapi.com/products');
    // List<ProductModel> productList = [];
    //   for (int i = 0; i < data.length ;i++) {
    //     productList.add(data[i]);
    //     print('this is $productList');
    //   }
    //   return productList;
    return productList;
    }

}