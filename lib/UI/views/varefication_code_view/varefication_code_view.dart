import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../shared/colors.dart';
class verificationView extends StatefulWidget {
  const verificationView({Key? key}) : super(key: key);

  @override
  _verificationViewState createState() => _verificationViewState();
}
TextEditingController textEditingController=TextEditingController();
class _verificationViewState extends State<verificationView> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.width*0.1,bottom: size.width*0.04),
              child: Text("We have sent an OTP to\n your Mobile",textAlign:TextAlign.center,style: TextStyle(fontSize:size.width*0.06 ),),
            ),
            Text("Please check your mobile number 071*****12\n continue to reset your password",textAlign: TextAlign.center,style: TextStyle(color: AppColors.mainBlackColor,fontSize: size.width*0.03),),
            SizedBox(height: size.width*0.15),
            PinCodeTextField(
              appContext: context,//تحاول توصل للثيم الي حاطينو بالماتيريال عن طريق الكونتيكست
              length: 4,
              obscureText: false,//بدنا نعرض الرقم وليس نجمة
              animationType: AnimationType.fade,//رح يختفي الؤشر من مكانه
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,//وقت انتقل من بوكس للتاني شو رح يصير اللون
              ),
              animationDuration: Duration(milliseconds: 300),
           //   backgroundColor: Colors.blue.shade50,
              enableActiveFill: true,
              controller: textEditingController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);

              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),

            Padding(
              padding:  EdgeInsets.symmetric(vertical: size.width*0.08),
              child: customButton(text: 'Next', onPressed:(){}),
            ),
            Text("Don't recieve ",textAlign: TextAlign.center,style: TextStyle(color: AppColors.mainBlackColor,fontSize: size.width*0.03),)

          ],
        ),
      ),
    );
  }
}
