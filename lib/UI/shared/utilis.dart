
import 'package:get/get.dart';

bool isEmail(String value) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}


bool isPasswordValid(String vaalue){
  RegExp regExp=RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  return regExp.hasMatch(vaalue);
}

bool isNameValid(String vaalue){
  RegExp regExp=RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  return regExp.hasMatch(vaalue);
}

bool isPhoneValid(String vaalue){
  RegExp regExp=RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  return regExp.hasMatch(vaalue);
}

double screenWidth(double percent) {
  return Get.size.width / percent;
}

double screenHeight(double percent) {
  return Get.size.width / percent;
}

