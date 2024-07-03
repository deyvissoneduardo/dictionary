import 'dart:convert';
import 'dart:io';

class FixtureReader {
  FixtureReader._();

  static String getJsonData(String path) =>
      File('test/app/$path').readAsStringSync();

  static T getData<T>(String path) =>
      jsonDecode(File('test/app/$path').readAsStringSync());
}
