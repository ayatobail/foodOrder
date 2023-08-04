
import '../network_config.dart';

class UserEndpoints{
  static String login = NetworkConfig.getFullApiUrl('user/login');
  static String Register = NetworkConfig.getFullApiUrl('user/Register');
  static String ForgotPassword = NetworkConfig.getFullApiUrl('user/ForgotPassword');
}