import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';


void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id :(context) => HomePage(),
        UpdateProductPage.id :(context) => UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}


        /*
        () async{
          http.Response response =await http.post(Uri.parse('https://fakestoreapi.com/products'),body: {
          'title':'test',
          'price':'13.5',
          'discription':'lorem ipsum set',
          'image:https':'//i.pravatar.cc',
          'category':'electronic',
          }, headers: {
            'Accept':'application/json',
            'Content-Type':'application/x-www-form-urlencoded'
            }
          );
          print(response.body);
        },
         */
