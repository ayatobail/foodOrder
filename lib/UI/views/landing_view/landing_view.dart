import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order/UI/shared/colors.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_button.dart';
import 'package:food_order/UI/views/login_view/login_view.dart';
import 'package:food_order/UI/views/splash_screen/splash_screen.dart';

class landingView extends StatelessWidget {
  const landingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final size=MediaQuery.of(context).size;
    return SafeArea(child:
        Scaffold(body:
        Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  painter: ClipShadowPainter(
                    clipper: CustomClipPath(),
                    shadow: Shadow(
                        blurRadius: 12,

                    )
                  ),
                  child: ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      color: AppColors.mainOrangeColor,
                      width: size.width,
                      height: size.width*0.7,
                      child: SvgPicture.asset("images/Background_objects.svg",fit:BoxFit.fill ,),

                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding:  EdgeInsets.only(top: size.width*0.55),
                    child: SvgPicture.asset("images/Logo.svg", width: size.width * 0.4,
                      height: size.width * 0.4,),
                  ),
                ),
              ],

            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: size.width*0.1),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: size.width*0.1,bottom: size.width*0.15),
                    child: Text("Discover the best foods from over 1,000 \nrestaurants and fast delivery to your doorstep",
                      textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.mainBlackColor,
                    fontSize: size.width*0.035),),
                  ),


              customButton( text: "Login",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginView();
                      },
                    ));
                  }),
              SizedBox(height:size.width*0.045),

              customButton(primary: AppColors.mainWhiteColor,
                  borderColor:AppColors.mainOrangeColor,
                  text: 'Create an Account',
                  textColor: AppColors.mainOrangeColor,
                  onPressed: () {})




                ],
              ),
            ),
          ],
        )
        ));}
}

class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    Path path0 = Path();
    path0.moveTo(size.width * 0.0008333, size.height * 0.0014286);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6964286, size.width,
        size.height * 0.9285714);
    path0.quadraticBezierTo(size.width * 0.9968083, size.height * 1.0063571,
        size.width * 0.9591667, size.height);
    path0.lineTo(size.width * 0.6664500, size.height);
    path0.quadraticBezierTo(size.width * 0.6596000, size.height * 0.7251000,
        size.width * 0.5001750, size.height * 0.7281714);
    path0.quadraticBezierTo(size.width * 0.3309417, size.height * 0.7312429,
        size.width * 0.3327583, size.height);
    path0.lineTo(size.width * 0.0460500, size.height);
    path0.quadraticBezierTo(size.width * 0.0006667, size.height * 1.0078714, 0,
        size.height * 0.9271429);
    path0.quadraticBezierTo(size.width * 0.0002083, size.height * 0.6957143,
        size.width * 0.0008333, size.height * 0.0014286);
    path0.close();
    return path0;


  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}
class ClipShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}