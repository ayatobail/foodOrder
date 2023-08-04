import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order/UI/shared/colors.dart';

import '../../../../core/enums/bottom_navigation.dart';

import '../../landing_view/landing_view.dart';
class bottomNavigationWidget extends StatefulWidget {
  const bottomNavigationWidget({Key? key, required this.bottomNavigation, required this.onTap}) : super(key: key);
final BottomNavigationEnum bottomNavigation;
final Function(BottomNavigationEnum,int) onTap;
  @override
  _bottomNavigationWidgetState createState() => _bottomNavigationWidgetState();
}

class _bottomNavigationWidgetState extends State<bottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: (){widget.onTap(BottomNavigationEnum.HOME,2);},
          child: Padding(
            padding:  EdgeInsets.only(bottom: size.width*0.14),
            child: CircleAvatar(
              radius: size.width*0.1,
              child: SvgPicture.asset('images/ic_home.svg',color: AppColors.mainWhiteColor),
            backgroundColor:widget.bottomNavigation==BottomNavigationEnum.HOME?AppColors.mainOrangeColor:AppColors.transparentColor,),
          ),
        ),
       // SvgPicture.asset('images/bg_bottom_navigation.svg',),
        CustomPaint(
          painter: ClipShadowPainter(
              clipper: BottomClip(),
              shadow: Shadow(
                  blurRadius: 12,
                  offset: Offset(0, 1),
                  color: AppColors.transparentColor)),
          child: ClipPath(
            clipper: BottomClip(),
            child: Container(
              width: size.width,
              height: size.width * 0.23,
              color: AppColors.mainWhiteColor,
            ),
          ),
        ),

        Positioned(
          bottom: size.width * 0.05,
          left: size.width * 0.05,
          right: size.width * 0.05,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(children: [
                navItem(text: 'menu', imgName: 'ic_menu', isSelected: widget.bottomNavigation==BottomNavigationEnum.MENU, onTap: (){widget.onTap(BottomNavigationEnum.MENU,0);}),
                SizedBox(width: size.width*0.1),
                navItem(text: 'offers', imgName: 'ic_shopping', isSelected: widget.bottomNavigation==BottomNavigationEnum.OFFERS, onTap: (){widget.onTap(BottomNavigationEnum.OFFERS,1);},),
              ],),
              Row(children: [
                navItem( text: 'profile',  imgName: 'ic_user',  isSelected: widget.bottomNavigation==BottomNavigationEnum.PROFILE,onTap: (){widget.onTap(BottomNavigationEnum.PROFILE,3);}),
                SizedBox(width: size.width*0.1),
                navItem(text: 'more', imgName: 'ic_more', isSelected: widget.bottomNavigation==BottomNavigationEnum.MORE,onTap: (){widget.onTap(BottomNavigationEnum.MORE,4);}),
              ],),


            ],
          ),
        )


      ],
    );
  }
}

Widget navItem({required String text, required String imgName, required bool isSelected,  required Function onTap}){
      return InkWell(
        onTap: (){onTap();},
        child: Column(
          children: [
            SvgPicture.asset('images/$imgName.svg',color: isSelected?AppColors.mainOrangeColor:AppColors.transparentColor),
            Text(text,style: TextStyle(color: isSelected?AppColors.mainOrangeColor:AppColors.transparentColor),),

          ],
        ),
      );
}


class BottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3381500, 0);
    path0.quadraticBezierTo(size.width * 0.3731500, size.height * 0.0069000,
        size.width * 0.3757000, size.height * 0.1236000);
    path0.quadraticBezierTo(size.width * 0.4022000, size.height * 0.5633000,
        size.width * 0.5006000, size.height * 0.5896000);
    path0.quadraticBezierTo(size.width * 0.5955500, size.height * 0.5727000,
        size.width * 0.6200000, size.height * 0.1240000);
    path0.quadraticBezierTo(size.width * 0.6204500, size.height * -0.0157000,
        size.width * 0.6646000, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.6225000, size.height * 0.6100000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}