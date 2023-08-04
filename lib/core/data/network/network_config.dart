
import 'package:food_order/core/data/repositories/shared_preference_repositories.dart';

import '../../enums/request_type.dart';
//مركزية لبعض الأمور الي رح تطلع بكل ريكويست عنا
class NetworkConfig {
  static String BASE_API = 'api/web/';



  static String getFullApiUrl(String api)  {return BASE_API+api; }


//كلشي هيديرز لازميني بحطهم بالnetworkconfig.getheaders

  //في شغلات متشابهة بالهيدر لكل الريكويست
  static Map<String, String> getHeaders(
      {bool? needAuth = true, //الاشمل بدهم autharization
        requestType? type = requestType.POST,
        Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needAuth!)//عاطي قيمة افتراضية مستحيل تكون null
        'Authorization':
        'Bearer ${sharedPreferenceRepository.getTokenInfo()?.accessToken ?? ''}',
      if (type == requestType.POST) 'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }
}