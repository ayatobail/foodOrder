import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '';
import 'package:food_order/main.dart';

import '../../enums/data_type.dart';
import '../models/apis/token_info.dart';

class sharedPreferenceRepository{
  static String PREF_FIRST_LUANCH='first_launch';
  static String PREF_IS_LOGGEDIN="is_logged _in";

  static String PREF_TOKEN_INFO = 'token_info';


  static setTokenInfo(TokenInfo value) {
    setPrefrence(
      dataType: DataType.STRING,
      key: PREF_TOKEN_INFO,
      value: jsonEncode(value),
    );
  }

  static TokenInfo? getTokenInfo() {
    if (globalSharedPrefs!.containsKey(PREF_TOKEN_INFO)) {
      return TokenInfo.fromJson(jsonDecode(getPrference(key: PREF_TOKEN_INFO)));
    } else {
      return null;
    }
  }
  static setLoggedIn(bool value)
  {  //globalSharedPrefs!.setBool(PREF_FIRST_LUANCH,value);
    setPrefrence(dataType: DataType.BOOL, key: PREF_IS_LOGGEDIN, value: value);
  }

  static bool getLoggedIn()
  {
    if(globalSharedPrefs!.containsKey(PREF_IS_LOGGEDIN))
      return getPrference(key: PREF_FIRST_LUANCH);
    else
      return false;
  }

  static setFirstLuanch(bool value){
    setPrefrence(dataType:DataType.BOOL, key: PREF_FIRST_LUANCH, value: value);
  }
  static bool getFirstLuanch()
  {
    if(globalSharedPrefs!.containsKey(PREF_FIRST_LUANCH))
      return getPrference(key: PREF_FIRST_LUANCH);
    else
      return true;

  }


  static setPrefrence({required DataType dataType,required String key,required dynamic value}) async {

    switch(dataType){
      case DataType.INT:
        await  globalSharedPrefs!.setInt(key, value);
        break;

      case DataType.STRING:
        await  globalSharedPrefs!.setString(key, value);
        break;

      case DataType.BOOL:
        await  globalSharedPrefs!.setBool(key, value);
        break;

      case DataType.DOUBLE:
        await  globalSharedPrefs!.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await  globalSharedPrefs!.setStringList(key, value);
        break;
    }

    // ignore: unused_element


  }
  static dynamic getPrference({required String key}){
    return  globalSharedPrefs!.get(key);

  }
}