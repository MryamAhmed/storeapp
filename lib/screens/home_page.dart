import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';

import '../services/get_all_product_service.dart';
import '../widget/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id='HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'New Trend',
          style: TextStyle(
              color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Icon(
            FontAwesomeIcons.cartPlus,
            color: Colors.black,),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 65),
          child: FutureBuilder<dynamic>(
            future: AllProductService().getAllProduct(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                List<dynamic> products = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 65),
                  child: GridView.builder(
                    clipBehavior: Clip.none,
                    itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 100,),
                      itemBuilder: (context,index){
                        //return customCard(products[index]);
                        return customCard(
                          product_model: ProductModel(
                              title:products[index]['title'],
                              price:products[index]['price'],
                              id:products[index]['id'],
                              image:products[index]['image'],
                              description:products[index]['description'],
                              category:products[index]['category'],
                          ),
                         );
                      }),
                );
              }else{
                print('errror');
                return Center(child: CircularProgressIndicator());
              }
            },
          )
      ),

    );
  }
}


/*

 */