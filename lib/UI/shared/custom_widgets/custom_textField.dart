import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/UI/shared/colors.dart';
class customTextField extends StatefulWidget {
  const customTextField({Key? key, required this.hintTExt, required this.controller, this.validator,   this.prefixIcon,  }) : super(key: key);

  @override
  final String hintTExt;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  //final bool showPrefix;
  final IconData? prefixIcon;

  @override
  State<customTextField> createState() => _customTextFieldState();
}

class _customTextFieldState extends State<customTextField> {
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: size.width*0.05),
      child: TextFormField(

        validator: widget.validator ,
        controller:widget.controller,
        //obscureText: true,
        style: TextStyle(color: AppColors.mainBlackColor),
        decoration: InputDecoration(
         // prefixIcon: Icon(widget.prefixIcon),
          errorStyle: TextStyle(fontSize: size.width*0.03),
          hintText: widget.hintTExt,
          hintStyle: TextStyle(color:  AppColors.transparentColor,
          fontSize:size.width*0.035,
          fontWeight: FontWeight.normal),
          filled: true,
          fillColor: AppColors.mainGreyColor,
          contentPadding: EdgeInsets.symmetric(horizontal: size.width*0.05) ,
          border: OutlineInputBorder(
            //borderRadius: BorderRadius.all(Radius.circular(9.0)),
             // borderSide: BorderSide(color: Colors.white),
              borderSide: BorderSide.none,
            borderRadius:BorderRadius.circular(size.width*0.08),

          ),

        ),
      ),
    );
  }
}
