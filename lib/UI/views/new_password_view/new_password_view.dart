import 'package:flutter/material.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_button.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_textField.dart';
import 'package:food_order/UI/views/signup_view/signup_view.dart';

import '../../shared/colors.dart';
import '../../shared/utilis.dart';
class newPassword extends StatefulWidget {
  const newPassword({Key? key}) : super(key: key);

  @override
  State<newPassword> createState() => _newPasswordState();
}

class _newPasswordState extends State<newPassword> {
  @override
  TextEditingController  passwordController=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
            children: [
        Padding(
        padding:  EdgeInsets.only(top: size.width*0.1,bottom: size.width*0.04),
        child: Padding(
          padding:  EdgeInsets.only(top: size.width*0.1,bottom: size.width*0.04),
          child: Text("New Password",textAlign: TextAlign.center,style: TextStyle(fontSize:size.width*0.06 ),),
        ),
    ),
          Text("Please enter your email to receive a \nlink to create a new password via email",textAlign: TextAlign.center,style: TextStyle(color: AppColors.mainBlackColor,fontSize: size.width*0.03),),

              Padding(
                padding:  EdgeInsets.only(top:  size.width*0.09,bottom: size.width*0.07),
                child: customTextField(hintTExt: "New Password", controller: passwordController,validator: (value){

                    return value!.isEmpty|| !isPasswordValid(value)? "please check password": null;
                  /*if (value!.isEmpty)
                    return ("please check password");
                  else
                    return null;*/

                },),
                
              ),
              customTextField(hintTExt: "Confirm Password", controller: confirmPassword,validator: (value){
             return value!.isEmpty||value!=passwordController.text?"passwords don't match":null;
              },),
              
              Padding(
                padding:  EdgeInsets.only(top: size.width*0.07),
                child: customButton(text: "Next", onPressed: (){}),
              )
          ]
    ),
      )));
  }
}
