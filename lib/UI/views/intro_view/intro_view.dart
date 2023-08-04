import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order/UI/shared/colors.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_button.dart';
import 'package:food_order/UI/views/login_view/login_view.dart';

class introView extends StatefulWidget {
  const introView({Key? key}) : super(key: key);


  @override
  _introViewState createState() => _introViewState();
}

class _introViewState extends State<introView> {
  List<String> titleList=["Find Food You Love","Fast Delivery","Live Tracking"];
  List<String> descrebtionList=["Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep","Fast food delivery to your home, office\n wherever you are","Real time tracking of your food on the app\n once you placed the order"];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(child:
    Scaffold(body:
    Padding(
      padding:  EdgeInsets.symmetric(vertical: size.width*.05,horizontal: size.width*0.07),
      child: Column(
        children: [
          SvgPicture.asset("images/intro$currentIndex.svg"),
      Padding(
        padding:  EdgeInsets.only(top: size.width*0.05,bottom: size.width*0.1),
        child: DotsIndicator(
          dotsCount: 3,
          position: currentIndex.toDouble(),
          decorator: DotsDecorator(
           //size:Size(100.0,100.0),
            //activeSize:Size(100.0,100.0),
            color: AppColors.mainTextColor, // Inactive color
            activeColor: AppColors.mainOrangeColor,
          ),
        ),
      ),
           Text(titleList[currentIndex],textAlign: TextAlign.center,style: TextStyle(fontSize: size.width*0.07,color: AppColors.mainBlackColor),),

          Padding(
            padding:  EdgeInsets.only(top: size.width*0.07,bottom: size.width*0.12),
            child: Text(descrebtionList[currentIndex],textAlign: TextAlign.center,style: TextStyle(color: AppColors.mainBlackColor,fontSize: size.width*0.03),),
          ),

          customButton(text: currentIndex==2?"login":"Next", onPressed:(){
            if(currentIndex!=2)
              setState(() {
                currentIndex=currentIndex+1;
              });
   else
              Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context){
                return LoginView();
              } )));

          })


        ],
      ),
    )

      ,));
  }
}
