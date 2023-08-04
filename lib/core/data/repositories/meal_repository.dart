import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:food_order/core/data/models/apis/category_model.dart';
import 'package:food_order/core/data/network/endpoints/category_endpoint.dart';
import 'package:food_order/core/enums/request_type.dart';
import '../../utilies/network_utily.dart';
import '../models/apis/meal_model.dart';
import '../models/apis/token_info.dart';
import '../models/common_response.dart';
import '../network/endpoints/meal_endpoint.dart';
import '../network/endpoints/user_endpoint.dart';
import '../network/network_config.dart';

class MealRepository{
  Future<Either<String,List<MealModel>>> getAll()//ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: requestType.GET,
        url: MealEndpoints.getAll,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<MealModel> result=[];
          commonResponse.data!.forEach((element) {
            result.add(MealModel.fromJson(element));
          });
          return Right(result);
        }

        else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, TokenInfo>> register({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: requestType.POST,
        url: UserEndpoints.login,
        body: {
          'userName': email,
          'password': password,
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      BotToast.showText(text: e.toString());
      return Left(e.toString());
    }
  }
}