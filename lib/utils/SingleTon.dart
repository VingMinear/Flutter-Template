class GlobalClass {
  static final GlobalClass _singleton = GlobalClass._internal();

  factory GlobalClass() {
    return _singleton;
  }

  GlobalClass._internal();
  String deviceToken = '';
  String imeiCode = '';
}
