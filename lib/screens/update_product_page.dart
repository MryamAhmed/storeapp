import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/services/update_product.dart';
import '../models/product_model.dart';
import '../widget/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
   UpdateProductPage({Key? key}) : super(key: key);

static String id='update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
 String image='',describtion='', name='',price='';
bool isLoading=false;


  @override
  Widget build(BuildContext context) {
    ProductModel product_model = ModalRoute.of(context)!.settings.arguments  as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Update Product',style: TextStyle(color:Colors.black ),)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,),
                CustomTextField(
                  onChange: (data){
                    name = data;
                    print(name);
                  },
                    hint: 'product name'),
                SizedBox(
                  height: 10,),
                CustomTextField(
                    onChange: (data){
                      describtion = data;
                    },
                    hint: 'description'),
                SizedBox(
                  height: 10,),
                CustomTextField(
                    type: TextInputType.number,
                    onChange: (data){
                      price = data;
                    },
                    hint: 'price'),
                SizedBox(
                  height: 10,),
                CustomTextField(
                    onChange: (data){
                      image = data;
                    },
                    hint: 'image'),
                SizedBox(
                  height: 50,),
                CustomButton(
                  text: 'Update',
                  ontap: ()async{
                    isLoading = true;
                    setState(() {});
                    try{
                      await updateProduct(product_model!);
                      print('succ');
                    }catch(e){
                      print('error => $e');
                    }
                    isLoading=false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product_model) async {
    await UpdateProduct().updateProduct(
      id: product_model.id,
        title: name!.isEmpty ? product_model.title : name!,
        price: price!.isEmpty? product_model.price.toString() :price!,
        description: describtion!.isEmpty ? product_model.description :describtion!,
        category: product_model.category!,
        image: name!.isEmpty ? product_model.image : image!,
    );
  }
}