
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_textField.dart';
import 'package:food_order/UI/shared/custom_widgets/custom_toast.dart';

import 'package:shimmer/shimmer.dart';


import '../../../../core/data/models/apis/category_model.dart';
import '../../../../core/data/models/apis/meal_model.dart';
import '../../../../core/data/repositories/category_repository.dart';
import '../../../../core/data/repositories/meal_repository.dart';
import '../../../../core/enums/message_type.dart';
import '../../../shared/colors.dart';

class HomeView extends StatefulWidget {

  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
TextEditingController search=TextEditingController();
class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categoryList = [];
  List<MealModel> mealList = [];
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          drawer: Container(
            color: AppColors.mainOrangeColor,
          ),
          body: FutureBuilder<List<dynamic>>(
              future: Future.wait([
                CategoryRepository().getAll(),
                MealRepository().getAll(),
              ]),
              builder: ((context, AsyncSnapshot<List<dynamic>> snapshot1) {
                var categories = snapshot1.data != null
                    ? snapshot1.data![0] as dartz.Either<String, List<CategoryModel>>
                    : null;
                var meals = snapshot1.data != null
                    ? snapshot1.data![1]
                as dartz.Either<String, List<MealModel>>
                    : null;

                if (snapshot1.connectionState != ConnectionState.waiting) {
                  categories!.fold((l) {
                    customToast.showMessage(
                        context: context,
                        message: l,
                        messageType: MessageType.REJECTED);
                  }, (r) {
                    categoryList.clear();
                    categoryList.addAll(r);
                  });

                  meals!.fold((l) {
                    customToast.showMessage(
                        context: context,
                        message: l,
                        messageType: MessageType.REJECTED);
                  }, (r) {
                    mealList.clear();
                    mealList.addAll(r);
                  });
                }



                return  Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: size.width*0.07,bottom: size.width*0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Good morning Akila!",style: TextStyle(color: AppColors.mainBlackColor,fontSize: size.width*0.05)),
                          Icon(Icons.shopping_cart,color: AppColors.mainBlackColor,),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width*1,),
                    Text("Delivering to",style: TextStyle(color: AppColors.transparentColor,fontSize: size.width*0.03),textAlign:TextAlign.left),
                    Padding(
                      padding: EdgeInsets.only(top: size.width*0.02,bottom: size.width*0.05),
                      child: Text("Current Location",style: TextStyle(color: AppColors.mainBlackColor,fontSize: size.width*0.04)),
                    ),

                    customTextField(hintTExt: "search food", controller: search,prefixIcon: Icons.search,),
                     SizedBox(height: size.width*0.07,),

                    categories == null
                        ? SpinKitCircle(
                      color: AppColors.mainOrangeColor,
                    )
                    :Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:  EdgeInsets.only(left: size.width*0.03,right: size.width*0.03),
                            child: Column(
                              children: [
                               /* CachedNetworkImage(

                                  imageUrl:
                                  'http://via.placeholder.com/350x150',
                                 width: size.width*0.3,
                                height: size.width*0.3,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),*/
                                FancyShimmerImage(imageUrl: 'http://via.placeholder.com/350x150',width: size.width*0.2,height: size.width*0.2
                                  ,boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(0.7)),),



                                   Text(
                                    categoryList[index].name ?? '',
                                    style: TextStyle(fontSize: 10),
                                  ),

                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Popular resturant",style: TextStyle(fontSize: size.width*0.05),),
                        Text("view all",style: TextStyle(color: AppColors.mainOrangeColor),),

                      ],
                    ),
                    meals == null
                        ? SpinKitCircle(
                      color: AppColors.mainOrangeColor,
                    )
                        : Expanded(
                      child: ListView.builder(

                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: mealList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FancyShimmerImage(imageUrl: 'http://via.placeholder.com/350x150',width: size.width*0.2,height: size.width*0.2,),
                              Text(
                                mealList[index].name ?? '',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );

              }))),
    );
  }}