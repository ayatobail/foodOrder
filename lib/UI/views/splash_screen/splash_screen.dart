import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_order/UI/shared/colors.dart';
import 'package:food_order/UI/views/intro_view/intro_view.dart';
import 'package:food_order/UI/views/landing_view/landing_view.dart';
import 'package:food_order/UI/views/login_view/login_view.dart';
import 'package:food_order/UI/views/main_view/home_view/home_view.dart';
import 'package:food_order/core/data/repositories/shared_preference_repositories.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  //SharedPreferences prefs=SharedPreferences.getInstance() as SharedPreferences;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((value) {
            if (sharedPreferenceRepository.getFirstLuanch()) {
       Get.off(introView());
      } else {
              Get.off(landingView());
      }

      sharedPreferenceRepository.setFirstLuanch(false);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(child:
    Scaffold(body: Stack(

      children: [
        //SvgPicture.asset('images/bg_background.svg', height: size.height, width: size.width),
       SvgPicture.asset('images/bg_background.svg', height: size.height, width: size.width,color: Colors.grey,),
        Center(child: SvgPicture.asset('images/Logo.svg', height: size.height*0.3, width: size.width*0.5)),
        //SvgPicture.asset('images/ic_face.svg', height: size.height, width: size.width),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.75),
          child: SpinKitThreeBounce(
            color: AppColors.mainOrangeColor,
          ),
        )


      ],

    )

          /* width: size.width,
           height: size.height,
           color:AppColors.mainOrangeColor ,
          child: Text("Splash screen") ,*/




    ),
    );
  }
}
