import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hint,this.onChange,this.type,this.obscureText = false,   }) ;

  String? hint;
  bool obscureText ;

  Function(String)?onChange;
  TextEditingController? controller;
  TextInputType?  type;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      obscureText:obscureText! ,
      controller: controller,
      keyboardType:type,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hint,

        border:OutlineInputBorder(
            borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),

    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({required this.text,this.ontap}) ;
  String  text;
  VoidCallback?ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white),),),
      ),
    );
  }
}
