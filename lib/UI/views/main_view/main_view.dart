import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_drawer.dart';
import 'package:food_order/UI/views/main_view/home_view/home_view.dart';
import 'package:food_order/UI/views/main_view/menu/menu.dart';
import 'package:food_order/UI/views/main_view/more_view/more_view.dart';
import 'package:food_order/UI/views/main_view/offers_view/offers_view.dart';
import 'package:food_order/UI/views/main_view/profile_view/profile_view.dart';

import '../../../core/enums/bottom_navigation.dart';

import '../../shared/colors.dart';
import 'main_view_widget/button_navigation_widget.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  PageController controller = PageController(initialPage: 2);
GlobalKey<ScaffoldState> key= GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: key,
        drawer:CustomDrawer(),
         // backgroundColor: AppColors.transparentColor,
        bottomNavigationBar: bottomNavigationWidget(bottomNavigation: selected, onTap: (select,pageNumber){
          setState(() {
            selected=select;
          });

          controller.jumpToPage(pageNumber);

        }),
        body: PageView(
          controller: controller,
           children: [
             moreView(),
             offersView(),
             HomeView(),
             profileView(),
             moreView()
           ],
        ),

      ),
    );
  }
}
