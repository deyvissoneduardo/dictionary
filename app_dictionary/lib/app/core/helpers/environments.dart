import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  Environments._();

  static String? param(String paramName) {
    if (kReleaseMode) {
      return dotenv.env[paramName];
    } else {
      return dotenv.env[paramName];
    }
  }

  static Future<void> loadEnvs() async {
    if (kReleaseMode) {
      return dotenv.load();
    } else {
      await dotenv.load();
    }
  }
}
