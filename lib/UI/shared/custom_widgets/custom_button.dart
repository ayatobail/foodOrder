import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';
class customButton extends StatelessWidget {
  const customButton({Key? key,  this.primary,  this.borderColor, required this.text,  this.textColor, this.textSize,  this.onPressed, this.svgName}) : super(key: key);

 final Color? primary;
 final Color? borderColor;
 final String text;
 final Color? textColor;
 final double? textSize;
 final Function? onPressed;
 final String? svgName;



  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return ElevatedButton(onPressed: () {
      if (onPressed != null) onPressed!();
    },
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: primary??AppColors.mainOrangeColor,
          fixedSize: Size(size.width*0.9, size.width*0.13),
          side:borderColor!=null?
          BorderSide(color: borderColor??AppColors.mainOrangeColor,width: size.width*0.005)
              :null

      ),
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          if(svgName!=null)
          ...  [
          SvgPicture.asset("images/$svgName.svg"),
          SizedBox(width: size.width*0.05,),
          ],
          Text(text,style: TextStyle(fontSize: textSize??size.width * 0.032,color: textColor??AppColors.mainWhiteColor),),
        ],
      ),);

  }
}
