import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  bool _certificateCheck(X509Certificate cert, String host, int port) {
    return true;
  }

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = _certificateCheck;
  }
}
