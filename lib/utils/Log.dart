import 'dart:developer' as developer;

class Log {
  // Blue text
  static void info(Object msg) {
    developer.log('\x1B[37m📝 $msg\x1B[37m');
  }

// Green text
  static void success(Object msg) {
    developer.log('\x1B[32m🎉✅ $msg\x1B[0m 🎉✅ ');
  }

// Yellow text
  static void warning(Object msg) {
    developer.log('\x1B[33m⚠️ $msg\x1B[0m');
  }

// Red text
  static void error(Object msg) {
    developer
        .log('\x1B[31m ---------------⛔️ error ⛔️--------------- \x1B[31m');
    developer.log('\x1B[31m\t $msg\x1B[31m');
    developer.log('\x1B[31m x-----------------end----------------x \x1B[31m');
  }
}
