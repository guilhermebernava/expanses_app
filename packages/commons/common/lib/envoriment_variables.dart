import 'package:common_dependencies/common_dependencies.dart';

class EnvorimentVariables {
  static String _get(String name) => dotenv.env[name] ?? "";

  static String get apiKeyAndroid => _get("apiKeyAndroid");
  static String get appIdAndroid => _get("appIdAndroid");
  static String get messagingSenderIdAndroid =>
      _get("messagingSenderIdAndroid");
  static String get projectIdAndroid => _get("projectIdAndroid");
  static String get storageBucketAndroid => _get("storageBucketAndroid");

  static String get apiKeyIos => _get("apiKeyIos");
  static String get appIdIos => _get("appIdIos");
  static String get messagingSenderIdIos => _get("messagingSenderIdIos");
  static String get projectIdIos => _get("projectIdIos");
  static String get storageBucketIdIos => _get("storageBucketIdIos");
  static String get iosBundleIdIdIos => _get("iosBundleIdIdIos");
}
