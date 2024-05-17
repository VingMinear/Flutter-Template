import 'package:flutter/widgets.dart';
import 'package:phum_assocation/services/AuthServices.dart';

import '../../../utils/Log.dart';

class LoginController extends ChangeNotifier {
  Future<bool> login() async {
    bool isSuccess = false;
    try {
      await AuthService().postLogin().then((res) {
        if (res['status'] == 200) {
          isSuccess = true;
        }
      });
    } catch (error) {
      Log.error(
        'CatchError while login ( error message ) : >> $error',
      );
    }
    return isSuccess;
  }
}
