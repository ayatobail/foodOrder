import 'package:flutter/material.dart';
import 'package:food_order/UI/shared/colors.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_button.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_textField.dart';
import 'package:food_order/UI/views/signup_view/signup_view.dart';

import '../../shared/utilis.dart';
class resetPasswordScreen extends StatefulWidget {
  const resetPasswordScreen({Key? key}) : super(key: key);

  @override
  _resetPasswordScreenState createState() => _resetPasswordScreenState();
}
TextEditingController  emailController=TextEditingController();
GlobalKey<FormState> _formkey=GlobalKey<FormState>();

class _resetPasswordScreenState extends State<resetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(child:
    Scaffold(body:
      Form(
        key:_formkey ,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.width*0.1,bottom: size.width*0.04),
              child: Text("Reset password",style: TextStyle(fontSize:size.width*0.06 ),),
            ),
        Text("Please enter your email to receive a\n link to create a new password via email",textAlign: TextAlign.center,style: TextStyle(color: AppColors.mainBlackColor,fontSize: size.width*0.03)),

          Padding(
            padding:  EdgeInsets.only(top: size.width*0.15,bottom: size.width*0.1),
            child: customTextField(hintTExt: 'Email', controller: emailController,validator: (value){
              return value!.isEmpty|| !isEmail(value)? "please check email": null;
              /*  if(value!.isEmpty|| !isEmail(value))
                  return("please check email");
                else
                  return null;*/
            },),
          ),
    customButton(text: 'Send', onPressed:(){
if(_formkey.currentState!.validate())
  {print("ok");}


    })
          ],
        ),
      )
      ,));
  }
}
