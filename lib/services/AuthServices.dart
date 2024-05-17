import 'package:phum_assocation/utils/helper/BaseHelper.dart';

class AuthService extends BaseHelper {
  Future<Map<String, dynamic>> postLogin() async {
    var response = await onNetworkRequesting(
      endPoint: '',
      method: METHODE.post,
      body: {},
      useToken: true,
    );
    return response;
  }
}
