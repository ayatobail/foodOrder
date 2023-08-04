import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:food_order/core/enums/request_type.dart';
import '../../utilies/network_utily.dart';
import '../models/apis/token_info.dart';
import '../models/common_response.dart';
import '../network/endpoints/user_endpoint.dart';
import '../network/network_config.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> login({//ازا صح بترجع موديل وازا لا بترجع string
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
      return Left(e.toString());
    }
  }


  Future<Either<String, bool>> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required int age,
    required String photo,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: requestType.POST,
        url: UserEndpoints.Register,
        fields: {
          'Email': email,
          'FirstName': firstname,
          'LastName': lastname,
          'Password': password,
          'Age': age.toString(),
        },
        files: {"Photo": photo},
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }


}